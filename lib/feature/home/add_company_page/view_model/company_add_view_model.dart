import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:placars_savt/feature/home/add_company_page/model/add_company_model.dart';

import '../../../../core/base/view_model/base_view_model.dart';
import '../../../../core/constants/enums/cache_enum_keys.dart';

import '../../../../core/image_upload/image_upload_manager.dart';
import '../../../../core/init/cache/hive/hive_model.dart';
import '../../../../core/init/cache/hive_user_cache_manager/hive_user_cache_manager.dart';

import '../../../../product/backend/backend_endpoints.dart';
import '../../../../product/hive_models/user_hive_model.dart';
import '../model/image_upload_response.dart';

part 'company_add_view_model.g.dart';

class CompanyAddViewModel = _CompanyAddViewModelBase with _$CompanyAddViewModel;

abstract class _CompanyAddViewModelBase with Store, BaseViewModel {
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  TextEditingController? companyNameController;
  TextEditingController? companyLocationController;
  TextEditingController? companyFieldController;

  final imageUploadViewModel = LibraryImageUpload();

  @observable
  bool checkboxValue = false;

  @observable
  String companyUrl = "https://firebasestorage.googleapis.com/v0/b/placars-40f6e.appspot.com/o/images.png?alt=media";

  IHivecacheManager<UserHiveModel>? userHiveCacheManager;
  UserHiveModel? userHiveModel;

  @override
  void setContext(BuildContext context) => baseContext = context;

  @override
  void init() {
    companyNameController ??= TextEditingController();
    companyLocationController ??= TextEditingController();
    companyFieldController ??= TextEditingController();
    initHive();
  }

  Future initHive() async {
    userHiveCacheManager = UserHiveCacheManager(CacheEnumKeys.USERHIVEBOXKEY.name);
    await userHiveCacheManager?.init();
    userHiveModel = userHiveCacheManager?.getItem(CacheEnumKeys.USERHIVEKEY.name);
  }

  @action
  void setCarUrl(String imageUrl) {
    companyUrl = imageUrl;
  }

  Future<String?> uploadImageToFirebase() async {
    final file = await imageUploadViewModel.fetch();
    if (file != null && (userHiveModel?.name?.isNotEmpty ?? false)) {
      final uploadFile = File(file.path);
      final uploadResponse = await uploadToImageServer(uploadFile, file.name);
      return "${BackendURLS.IMAGE_UPLOAD}${uploadResponse?.name}?alt=media";
    }
    return null;
  }

  Future<ImageUploadResponse?> uploadToImageServer(File file, String name,
      {void Function(int, int)? onSendProgress}) async {
    // https://firebasestorage.googleapis.com/v0/b/flash-chat-8756d.appspot.com/o/ --Base
    // /full%2F --directory
    // 2Screen%20Shot%202022-09-23%20at%2022.08.18.png --filename
    var formData = FormData.fromMap({'file': await MultipartFile.fromFile(file.path)});

    final response =
        await appService?.dio.post('${BackendURLS.IMAGE_UPLOAD}$name', data: formData, onSendProgress: onSendProgress);

    if (response?.statusCode == HttpStatus.ok) {
      return ImageUploadResponse.fromJson(response?.data);
    }
    return null;
  }

  @action
  void changeCarSaleCheckboxValue(bool? value) {
    if (value != null) {
      checkboxValue = value;
    }
  }

  @action
  String? textFieldsValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "Locale Keys5";
    }
    return null;
  }

  @action
  Future addCompany() async {
    if (formKey.currentState?.validate() ?? false) {
      CompanyModel company =
          CompanyModel(companyNameController?.text, 1, companyUrl, companyFieldController?.text, "Null");
      final response = await appService?.dio.post(BackendURLS.CREATE_COMPANY, data: company.toJson());
      if (response?.statusCode == HttpStatus.created) {
        showSnackS();
        navigateToCompanyPage(true);
      }
    }
  }

  void navigateToCompanyPage(bool isAdded) {
    Navigator.pop(baseContext);
  }

  void showSnackS() {
    ScaffoldMessenger.of(baseContext).showSnackBar(SnackBar(
      content: const Text(
        "Yeni şirket ekleme işlemi başarıyla sonuçlanmıştır.",
        textAlign: TextAlign.center,
      ),
      backgroundColor: Theme.of(baseContext).colorScheme.onSurface,
    ));
  }

  void showSnackSError() {
    ScaffoldMessenger.of(baseContext).showSnackBar(SnackBar(
      content: const Text(
        "Yeni şirket ekleme işlemi başarılamadı sonra tekrar dene",
        textAlign: TextAlign.center,
      ),
      backgroundColor: Theme.of(baseContext).colorScheme.error,
    ));
  }

  void dispose() {
    companyNameController?.dispose();
    companyLocationController?.dispose();
    companyFieldController?.dispose();
  }
}
