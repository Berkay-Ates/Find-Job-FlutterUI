import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/base/view_model/base_view_model.dart';
import '../../../../core/constants/enums/cache_enum_keys.dart';
import '../../../../core/init/cache/hive/hive_model.dart';
import '../../../../core/init/cache/hive_user_cache_manager/hive_user_cache_manager.dart';
import '../../../../product/backend/backend_endpoints.dart';
import '../../../../product/enums/prof_img_urls.dart';
import '../../../../product/hive_models/user_hive_model.dart';
import '../../../home/tab_page/view/tab_view.dart';
import '../../email_verify_page/view/email_verify_view.dart';
import '../model/sign_up_model.dart';

part 'sign_up_view_model.g.dart';

class SignUpViewModel = _SignUpViewModelBase with _$SignUpViewModel;

abstract class _SignUpViewModelBase with Store, BaseViewModel {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  GlobalKey<FormState> formState = GlobalKey();

  TextEditingController? nameController;

  TextEditingController? surnameController;

  TextEditingController? mailController;

  TextEditingController? genderController;

  TextEditingController? passwordCreateController;
  @observable
  bool passwordCreateVisibility = true;

  TextEditingController? passwordConfirmController;
  @observable
  bool passwordConfirmVisibility = true;

  @observable
  bool isLoading = false;

  IHivecacheManager<UserHiveModel>? userHiveCacheManager;

  Future initHive() async {
    userHiveCacheManager = UserHiveCacheManager(CacheEnumKeys.USERHIVEBOXKEY.name);
    await userHiveCacheManager?.init();
  }

  @override
  void setContext(BuildContext context) => baseContext = context;

  @override
  void init() {
    nameController ??= TextEditingController();
    surnameController ??= TextEditingController();
    mailController ??= TextEditingController();
    genderController ??= TextEditingController();
    passwordCreateController ??= TextEditingController();
    passwordConfirmController ??= TextEditingController();
    initHive();
  }

  @action
  void changePasswordsVisibility() {
    passwordCreateVisibility = !passwordCreateVisibility;
    passwordConfirmVisibility = !passwordConfirmVisibility;
  }

  @action
  void changeLoading() {
    isLoading = !isLoading;
  }

  bool isPasswordsMatch() {
    if (passwordCreateController?.text == passwordConfirmController?.text) {
      return true;
    }
    return false;
  }

  @action
  Future signUpUser() async {
    if (formState.currentState?.validate() ?? false) {
      await registerUser();
    }
  }

  void showSnackS(String message) {
    ScaffoldMessenger.of(baseContext).showSnackBar(SnackBar(
      content: Text(
        message,
        textAlign: TextAlign.center,
      ),
      backgroundColor: Theme.of(baseContext).colorScheme.error,
    ));
  }

  Future registerUser() async {
    int random = Random().nextInt(DefaultProfileImageEnums.values.length);
    String imageUrl = DefaultProfileImageEnums.values.elementAt(random).imagePath;
    SignUpModel signUpModel = SignUpModel(
      name: nameController?.text,
      surname: surnameController?.text,
      user_password: passwordCreateController?.text,
      mail: mailController?.text,
      gender: genderController?.text,
      profile_img_url: imageUrl,
    );

    try {
      final response = await appService?.dio.post(BackendURLS.CREATE_ACCOUNT, data: signUpModel.toJson());
      if (response != null) {
        final data = response.data;
        if (response.statusCode == HttpStatus.ok) {
          if (data is Map<String, dynamic>) {
            UserHiveModel userHiveModel = UserHiveModel(
              0,
              signUpModel.name,
              signUpModel.surname,
              signUpModel.mail,
              signUpModel.person_id,
              signUpModel.profile_img_url,
              signUpModel.created_date,
              signUpModel.gender,
              signUpModel.is_active,
              signUpModel.user_password,
            );

            await userHiveCacheManager?.putItem(CacheEnumKeys.USERHIVEKEY.name, userHiveModel);
            navigateEmailSendPage();
          }
          //
        } else if (response.statusCode == HttpStatus.created) {
          if (data is Map<String, dynamic>) {
            UserHiveModel userHiveModel = UserHiveModel(
              0,
              signUpModel.name,
              signUpModel.surname,
              signUpModel.mail,
              signUpModel.person_id,
              signUpModel.profile_img_url,
              signUpModel.created_date,
              signUpModel.gender,
              signUpModel.is_active,
              signUpModel.user_password,
            );
            await userHiveCacheManager?.putItem(CacheEnumKeys.USERHIVEKEY.name, userHiveModel);
            navigateEmailSendPage();
          }
          //
        } else if (response.statusCode == HttpStatus.conflict) {
          showSnackS('Bu hesap var ve halihazirda biri tarafindan kullaniliyor ');
        } else {
          showSnackS(
              'Beklenmedik bir hata olustu ya network sorunlu yada gecersiz veriler girdiniz sonra tekrar deneyiniz.');
          // there is an error
        }
      }
    } catch (e) {
      showSnackS(e.toString());
    }
  }

  bool? isEmailUnique(String? email) {
    return true;
    //! girilen email veri tabanında varsa false yoksa true dondurecegiz.
  }

  bool? isUserNameUnique(String? userName) {
    return true;
    //! girilen isim varsa false yoksa true dondurecegiz
  }

  void navigateEmailSendPage() {
    Navigator.pushAndRemoveUntil(
        baseContext, MaterialPageRoute(builder: (context) => const EmailVerifyView()), (route) => false);
  }

  void navigateHomePage() {
    Navigator.pushAndRemoveUntil(
        baseContext, MaterialPageRoute(builder: (context) => const FindJobApiTabView()), (route) => false);
  }

  void dispose() {
    nameController?.dispose();
    mailController?.dispose();
    surnameController?.dispose();
    passwordCreateController?.dispose();
    passwordConfirmController?.dispose();
    genderController?.dispose();
  }
}
