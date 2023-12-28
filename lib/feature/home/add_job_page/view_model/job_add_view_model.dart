import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:placars_savt/feature/home/add_job_page/model/add_job_post_model.dart';
import 'package:placars_savt/product/backend/backend_endpoints.dart';

import '../../../../core/base/view_model/base_view_model.dart';

import '../../../../core/constants/enums/cache_enum_keys.dart';
import '../../../../core/extension/easy_localization_translate/easy_localization_translate.dart';
import '../../../../core/image_upload/image_upload_manager.dart';
import '../../../../core/init/cache/hive/hive_model.dart';
import '../../../../core/init/cache/hive_user_cache_manager/hive_user_cache_manager.dart';
import '../../../../core/init/lang/locale_keys.g.dart';

import '../../../../product/hive_models/user_hive_model.dart';

part 'job_add_view_model.g.dart';

class JobAddViewModel = _JobAddViewModelBase with _$JobAddViewModel;

abstract class _JobAddViewModelBase with Store, BaseViewModel {
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController? jobTitleController;
  TextEditingController? companyNameController;
  TextEditingController? salaryController;
  TextEditingController? jobDescriptionController;

  final imageUploadViewModel = LibraryImageUpload();

  @observable
  bool checkboxValue = false;

  IHivecacheManager<UserHiveModel>? userHiveCacheManager;
  UserHiveModel? userHiveModel;

  @override
  void setContext(BuildContext context) => baseContext = context;

  @override
  void init() {
    jobTitleController ??= TextEditingController();
    companyNameController ??= TextEditingController();
    salaryController ??= TextEditingController();
    jobDescriptionController ??= TextEditingController();
    initHive();
  }

  Future initHive() async {
    userHiveCacheManager = UserHiveCacheManager(CacheEnumKeys.USERHIVEBOXKEY.name);
    await userHiveCacheManager?.init();
    userHiveModel = userHiveCacheManager?.getItem(CacheEnumKeys.USERHIVEKEY.name);
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
      return LocaleKeys.add_car_page_warn_txt.translate;
    }
    return null;
  }

  @action
  Future addJob() async {
    if (formKey.currentState?.validate() ?? false) {
      JobPostModel job = JobPostModel(
        jobTitleController?.text,
        jobDescriptionController?.text,
        "0",
        salaryController?.text,
        companyNameController?.text,
      );

      final response = await appService?.dio.post(BackendURLS.CREATE_JOB, data: job.toJson());
      if (response?.statusCode == HttpStatus.created) {
        showSnackS();
        navigateToCompanyPage(true);
      }
    }
  }

  void navigateToCompanyPage(bool val) {
    Navigator.pop(baseContext, val);
  }

  void showSnackS() {
    ScaffoldMessenger.of(baseContext).showSnackBar(SnackBar(
      content: const Text(
        "Yeni iş ekleme işlemi başarıyla sonuçlanmıştır.",
        textAlign: TextAlign.center,
      ),
      backgroundColor: Theme.of(baseContext).colorScheme.onSurface,
    ));
  }

  void showSnackSError() {
    ScaffoldMessenger.of(baseContext).showSnackBar(SnackBar(
      content: const Text(
        "Yeni iş ekleme işlemi başarılamadı, sirket ismini kontrol ederek tekrar dene",
        textAlign: TextAlign.center,
      ),
      backgroundColor: Theme.of(baseContext).colorScheme.error,
    ));
  }

  void dispose() {
    jobDescriptionController?.dispose();
    jobTitleController?.dispose();
    salaryController?.dispose();
    companyNameController?.dispose();
  }
}
