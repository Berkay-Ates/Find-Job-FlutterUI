import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:placars_savt/feature/home/add_company_page/view/company_add_view.dart';
import 'package:placars_savt/feature/home/add_job_page/view/job_add_view.dart';
import '../../../../core/base/view_model/base_view_model.dart';
import '../../../../core/constants/enums/cache_enum_keys.dart';
import '../../../../core/init/cache/hive/hive_model.dart';
import '../../../../core/init/cache/hive_user_cache_manager/hive_user_cache_manager.dart';

import '../../../../product/hive_models/user_hive_model.dart';

import '../model/message_model.dart';

part 'company_view_model.g.dart';

class CompanyViewModel = _CompanyViewModelBase with _$CompanyViewModel;

abstract class _CompanyViewModelBase with Store, BaseViewModel {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final unfocusNode = FocusNode();

  IHivecacheManager<UserHiveModel>? userHiveCacheManager;
  UserHiveModel? userHiveModel;

  @observable
  List<RecentlyMessaged> recentlyMessged = [];

  @observable
  bool isLoading = false;

  @action
  void changeLoading() {
    isLoading = !isLoading;
  }

  @override
  void setContext(BuildContext context) => baseContext = context;

  @override
  void init() {}

  Future initHive() async {
    userHiveCacheManager = UserHiveCacheManager(CacheEnumKeys.USERHIVEBOXKEY.name);
    await userHiveCacheManager?.init();
    userHiveModel = userHiveCacheManager?.getItem(CacheEnumKeys.USERHIVEKEY.name);
  }

  Future<bool?> navigateToCompanyAdd() async {
    return await Navigator.push(baseContext, MaterialPageRoute(builder: (context) => const CompanyAddView()));
  }

  Future<bool> navigateToJobAdd() async {
    return await Navigator.push(baseContext, MaterialPageRoute(builder: (context) => const JobAddView()));
  }

  void showSnackS() {
    ScaffoldMessenger.of(baseContext).showSnackBar(SnackBar(
      content: const Text(
        "Bir hata oluştu tekrar deneyiniz",
        textAlign: TextAlign.center,
      ),
      backgroundColor: Theme.of(baseContext).colorScheme.error,
    ));
  }
}
