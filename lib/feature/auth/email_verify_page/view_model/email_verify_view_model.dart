import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/base/view_model/base_view_model.dart';
import '../../../../core/constants/enums/cache_enum_keys.dart';
import '../../../../core/init/cache/hive/hive_model.dart';
import '../../../../core/init/cache/hive_user_cache_manager/hive_user_cache_manager.dart';
import '../../../../core/init/cache/shared/i_shared_manager.dart';
import '../../../../core/init/cache/shared/shared_manager.dart';
import '../../../../core/init/cache/shared/shared_object.dart';
import '../../../../product/backend/backend_endpoints.dart';
import '../../../../product/hive_models/user_hive_model.dart';
import '../../../home/tab_page/view/tab_view.dart';
import '../../sign_in_page/view/sign_in_view.dart';
import '../model/email_verify_model.dart';

part 'email_verify_view_model.g.dart';

class EmailVerifyViewModel = _EmailVerifyViewModelBase with _$EmailVerifyViewModel;

abstract class _EmailVerifyViewModelBase with Store, BaseViewModel {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  ISharedManager? sharedManager;
  SharedPrefObject? sharedPrefObject;

  @observable
  bool isLoading = false;

  @observable
  String? mail;

  String? img_url;

  String? password;

  @override
  void setContext(BuildContext context) => baseContext = context;

  IHivecacheManager<UserHiveModel>? userHiveCacheManager;

  Future initHive() async {
    userHiveCacheManager = UserHiveCacheManager(CacheEnumKeys.USERHIVEBOXKEY.name);
    await userHiveCacheManager?.init();
    setMail();
  }

  Future<bool?> saveUserToken(String token) async {
    return await sharedManager?.setString(CacheEnumKeys.TOKEN.name, token);
  }

  @override
  void init() {
    sharedPrefObject = SharedPrefObject.instance;
    sharedManager = SharedManager(sharedPrefObject?.getSharedObject);
    initHive();
  }

  @action
  void setMail() {
    mail = userHiveCacheManager?.getItem(CacheEnumKeys.USERHIVEKEY.name)?.mail ?? "";
    img_url = userHiveCacheManager?.getItem(CacheEnumKeys.USERHIVEKEY.name)?.profile_img_url ?? "";
    password = userHiveCacheManager?.getItem(CacheEnumKeys.USERHIVEKEY.name)?.user_password ?? "";
  }

  @action
  Future isMailVerified() async {
    changeLoading();
    try {
      if (mail?.isNotEmpty ?? false) {
        final response = await appService?.dio.get("${BackendURLS.GET_ONE_USER_INFOR}$mail/");
        final data = response?.data;
        inspect(data);
        if (data is Map<String, dynamic>) {
          final emailCheckRes = EmailVerifyModel.fromJson(data);

          if (emailCheckRes.result?[0].is_active ?? false) {
            UserHiveModel userHiveModel = UserHiveModel(
              0,
              emailCheckRes.result?[0].name,
              emailCheckRes.result?[0].surname,
              emailCheckRes.result?[0].mail,
              emailCheckRes.result?[0].person_id,
              emailCheckRes.result?[0].profile_img_url,
              emailCheckRes.result?[0].created_date,
              emailCheckRes.result?[0].gender,
              emailCheckRes.result?[0].is_active,
              emailCheckRes.result?[0].user_password,
              emailCheckRes.result?[0].school,
              emailCheckRes.result?[0].experience,
            );
            await userHiveCacheManager?.putItem(CacheEnumKeys.USERHIVEKEY.name, userHiveModel);
            navigateHomePage();
          } else {
            showSnackS();
          }
        }
      }
    } catch (e) {
      inspect(e);
      changeLoading();
    }
  }

  @action
  void changeLoading() {
    isLoading = !isLoading;
  }

  void navigateHomePage() {
    Navigator.pushAndRemoveUntil(
        baseContext, MaterialPageRoute(builder: (context) => const FindJobApiTabView()), (route) => false);
  }

  void showSnackS() {
    ScaffoldMessenger.of(baseContext).showSnackBar(SnackBar(
      content: const Text(
        'Giriş Yapabilmek icin hesabını doğrulamalısın.',
        textAlign: TextAlign.center,
      ),
      backgroundColor: Theme.of(baseContext).colorScheme.error,
    ));
  }

  void navigateSignInPage() {
    Navigator.pushAndRemoveUntil(
        baseContext, MaterialPageRoute(builder: (context) => const SignInView()), (route) => false);
  }
}
