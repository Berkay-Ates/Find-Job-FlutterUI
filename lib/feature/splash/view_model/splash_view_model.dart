import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mobx/mobx.dart';
import 'package:path_provider/path_provider.dart' as parth_provider;

import '../../../core/base/view_model/base_view_model.dart';
import '../../../core/constants/enums/cache_enum_keys.dart';
import '../../../core/init/cache/hive/hive_model.dart';
import '../../../core/init/cache/hive_user_cache_manager/hive_user_cache_manager.dart';
import '../../../product/hive_models/user_hive_model.dart';
import '../../auth/sign_in_page/view/sign_in_view.dart';
import '../../home/tab_page/view/tab_view.dart';

part 'splash_view_model.g.dart';

class SplashViewModel = _SplashViewModelBase with _$SplashViewModel;

abstract class _SplashViewModelBase with Store, BaseViewModel {
  @observable
  bool isLoading = true;

  @override
  void setContext(BuildContext context) => baseContext = context;

  IHivecacheManager<UserHiveModel>? userHiveCacheManager;
  @observable
  UserHiveModel? userHiveModel;

  @override
  void init() {
    initHive();
  }

  Future<void> initHive() async {
    final applicationDirectory = await parth_provider.getApplicationDocumentsDirectory();
    await Hive.initFlutter(applicationDirectory.path);
    userHiveCacheManager = UserHiveCacheManager(CacheEnumKeys.USERHIVEBOXKEY.name);
    await userHiveCacheManager?.init();
    userHiveModel = userHiveCacheManager?.getItem(CacheEnumKeys.USERHIVEKEY.name);

    if (userHiveModel?.mail?.isNotEmpty ?? false) {
      // ignore: use_build_context_synchronously
      Navigator.pushAndRemoveUntil(
          baseContext, MaterialPageRoute(builder: (context) => const FindJobApiTabView()), (route) => false);
    } else {
      // ignore: use_build_context_synchronously
      Navigator.pushAndRemoveUntil(
          baseContext, MaterialPageRoute(builder: (context) => const SignInView()), (route) => false);
    }
  }
}
