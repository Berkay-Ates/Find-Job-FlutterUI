import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:placars_savt/core/constants/enums/cache_enum_keys.dart';
import 'package:placars_savt/core/init/cache/hive/hive_model.dart';
import 'package:placars_savt/core/init/cache/hive_user_cache_manager/hive_user_cache_manager.dart';
import 'package:placars_savt/feature/home/settings_page/profile_settings/model/update_model.dart';
import 'package:placars_savt/product/backend/backend_endpoints.dart';
import 'package:placars_savt/product/hive_models/user_hive_model.dart';

import '../../../../../core/base/view_model/base_view_model.dart';
part 'profile_settings_view_model.g.dart';

class ProfileSettingsViewModel = _ProfileSettingsViewModelBase with _$ProfileSettingsViewModel;

abstract class _ProfileSettingsViewModelBase with Store, BaseViewModel {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();

  TextEditingController? schoolController;
  TextEditingController? experienceController;

  IHivecacheManager<UserHiveModel>? userHiveCacheManager;

  @observable
  UserHiveModel? userHiveModel;

  @observable
  bool isLoading = false;

  @action
  Future initHive() async {
    userHiveCacheManager = UserHiveCacheManager(CacheEnumKeys.USERHIVEBOXKEY.name);
    await userHiveCacheManager?.init();
    userHiveModel = userHiveCacheManager?.getItem(CacheEnumKeys.USERHIVEKEY.name);
  }

  @override
  void setContext(BuildContext context) => baseContext = context;

  @override
  void init() {
    schoolController ??= TextEditingController();
    experienceController ??= TextEditingController();
    initHive();
  }

  @action
  void changeLoading() {
    isLoading = !isLoading;
  }

  @action
  Future updateProfile() async {
    changeLoading();
    // ignore: unrelated_type_equality_checks
    if (formKey.currentState?.validate() ?? false) {
      final updateModel =
          UpdateModel(school: schoolController?.text, experience: int.tryParse(experienceController?.text ?? '0'));

      try {
        final response = await appService?.dio
            .post("${BackendURLS.UPDATE_PROFILE}${userHiveModel?.mail}/", data: updateModel.toJson());

        if (response?.statusCode == HttpStatus.created) {
          UserHiveModel userHiveModel2 = UserHiveModel(
            0,
            userHiveModel?.name,
            userHiveModel?.surname,
            userHiveModel?.mail,
            userHiveModel?.person_id,
            userHiveModel?.profile_img_url,
            userHiveModel?.created_date,
            userHiveModel?.gender,
            userHiveModel?.is_active,
            userHiveModel?.user_password,
            updateModel.school,
            updateModel.experience,
          );
          await userHiveCacheManager?.putItem(CacheEnumKeys.USERHIVEKEY.name, userHiveModel2);
          // ignore: use_build_context_synchronously
          Navigator.pop(baseContext);
        }
      } catch (e) {
        showSnackSWithParam(e.toString());
      }
    }
    changeLoading();
  }

  void dispose() {
    schoolController?.dispose();
    experienceController?.dispose();
  }

  void showSnackSWithParam(String param) {
    ScaffoldMessenger.of(baseContext).showSnackBar(SnackBar(
      content: Text(
        param,
        textAlign: TextAlign.center,
      ),
      backgroundColor: Theme.of(baseContext).colorScheme.error,
    ));
  }
}
