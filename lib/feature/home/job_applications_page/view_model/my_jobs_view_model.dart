import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/base/view_model/base_view_model.dart';
import '../../../../core/constants/enums/cache_enum_keys.dart';
import '../../../../core/init/cache/hive/hive_model.dart';
import '../../../../core/init/cache/hive_user_cache_manager/hive_user_cache_manager.dart';
import '../../../../product/backend/backend_endpoints.dart';
import '../../../../product/hive_models/user_hive_model.dart';
import '../../home_page/model/jobs_model.dart';

part 'my_jobs_view_model.g.dart';

class MyCarsViewModel = _MyCarsViewModelBase with _$MyCarsViewModel;

abstract class _MyCarsViewModelBase with Store, BaseViewModel {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final unfocusNode = FocusNode();

  String licencePlateUrl =
      "https://firebasestorage.googleapis.com/v0/b/placars-40f6e.appspot.com/o/download.png?alt=media";

  String carUrl = "https://firebasestorage.googleapis.com/v0/b/placars-40f6e.appspot.com/o/images.png?alt=media";

  @observable
  List<JobResult> jobLists = [];

  @observable
  bool isloading = false;

  @observable
  int itemCounts = 5;

  IHivecacheManager<UserHiveModel>? userHiveCacheManager;
  UserHiveModel? userHiveModel;

  @override
  void setContext(BuildContext context) => baseContext = context;

  @override
  void init() {
    initHive();
  }

  @action
  void changeLoading() {
    isloading = !isloading;
  }

  Future initHive() async {
    changeLoading();
    userHiveCacheManager = UserHiveCacheManager(CacheEnumKeys.USERHIVEBOXKEY.name);
    await userHiveCacheManager?.init();
    userHiveModel = userHiveCacheManager?.getItem(CacheEnumKeys.USERHIVEKEY.name);
    try {
      await getMyCars();
      changeLoading();
    } catch (e) {
      inspect(e);
      changeLoading();
    }
  }

  @action
  Future getMyCars() async {
    final response = await appService?.dio.get(BackendURLS.CAR_LISTS);
    if (response?.statusCode == HttpStatus.ok) {
      final data = response?.data;
      if (data is Map<String, dynamic>) {
        jobLists = [];
      }
    }
  }

  @action
  void changeItemCount() {
    itemCounts = 3;
  }

  void popDeleteWidget() {
    Navigator.pop(baseContext);
  }
}
