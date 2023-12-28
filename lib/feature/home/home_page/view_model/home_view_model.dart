import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:placars_savt/product/backend/backend_endpoints.dart';

import '../../../../core/base/view_model/base_view_model.dart';
import '../../../../core/constants/enums/cache_enum_keys.dart';
import '../../../../core/init/cache/hive/hive_model.dart';
import '../../../../core/init/cache/hive_user_cache_manager/hive_user_cache_manager.dart';
import '../../../../product/enums/home_post_enums.dart';
import '../../../../product/hive_models/user_hive_model.dart';

import '../model/jobs_model.dart';

part 'home_view_model.g.dart';

class HomeViewModel = _HomeViewModelBase with _$HomeViewModel;

abstract class _HomeViewModelBase with Store, BaseViewModel {
  TextEditingController? textController;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final unfocusNode = FocusNode();

  @observable
  HomePostEnums selectedPostCatgry = HomePostEnums.highPaid;

  IHivecacheManager<UserHiveModel>? userHiveCacheManager;
  UserHiveModel? userHiveModel;

  @observable
  List<JobResult>? joblist = [];

  @observable
  bool isloading = false;

  @action
  void changeLoading() {
    isloading = !isloading;
  }

  @override
  void setContext(BuildContext context) => baseContext = context;

  @override
  void init() {
    textController ??= TextEditingController();
    getJobs();
    initHive();
  }

  void dispose() {
    textController?.dispose();
  }

  Future initHive() async {
    userHiveCacheManager = UserHiveCacheManager(CacheEnumKeys.USERHIVEBOXKEY.name);
    await userHiveCacheManager?.init();
    userHiveModel = userHiveCacheManager?.getItem(CacheEnumKeys.USERHIVEKEY.name);
  }

  @action
  void changePostCategory(HomePostEnums value) {
    if (value != selectedPostCatgry) {
      selectedPostCatgry = value;
    }
  }

  @action
  String tarihiDuzenle(String tarih) {
    DateTime dt = DateTime.parse(tarih);
    String gun = dt.day.toString().padLeft(2, '0');
    String ay = dt.month.toString().padLeft(2, '0');
    String yil = dt.year.toString();
    return "$gun.$ay.$yil";
  }

  Future<void> getJobs() async {
    changeLoading();
    try {
      final response = await appService?.dio.get(BackendURLS.GET_ALL_JOBS);
      final data = response?.data;

      if (data is Map<String, dynamic>) {
        joblist = Jobs.fromJson(data).result;
      }
      print(response?.data);
    } catch (e) {
      showSnackS();
    }
    changeLoading();
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
