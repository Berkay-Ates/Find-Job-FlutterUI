import 'dart:io';

import 'package:dio/src/response.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:placars_savt/feature/home/job_applications_page/model/job_page_job_applications.dart';
import '../../../../core/base/view_model/base_view_model.dart';
import '../../../../core/constants/enums/cache_enum_keys.dart';
import '../../../../core/init/cache/hive/hive_model.dart';
import '../../../../core/init/cache/hive_user_cache_manager/hive_user_cache_manager.dart';
import '../../../../product/backend/backend_endpoints.dart';
import '../../../../product/hive_models/user_hive_model.dart';

part 'my_jobs_view_model.g.dart';

class MyCarsViewModel = _MyCarsViewModelBase with _$MyCarsViewModel;

abstract class _MyCarsViewModelBase with Store, BaseViewModel {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final unfocusNode = FocusNode();

  String licencePlateUrl =
      "https://firebasestorage.googleapis.com/v0/b/placars-40f6e.appspot.com/o/download.png?alt=media";

  String carUrl = "https://firebasestorage.googleapis.com/v0/b/placars-40f6e.appspot.com/o/images.png?alt=media";

  @observable
  List<JobPageJobApplication> appliedJobLists = [];

  @observable
  bool isloading = false;

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
    userHiveCacheManager = UserHiveCacheManager(CacheEnumKeys.USERHIVEBOXKEY.name);
    await userHiveCacheManager?.init();
    userHiveModel = userHiveCacheManager?.getItem(CacheEnumKeys.USERHIVEKEY.name);

    await getAppliedJobs();
  }

  @action
  Future<void> getAppliedJobs() async {
    changeLoading();
    try {
      final appliedJobs =
          await appService?.dio.get("${BackendURLS.GET_USER_JOB_APPLICATION}${userHiveModel?.person_id}/");
      final jobData = appliedJobs?.data;
      if (jobData is Map<String, dynamic>) {
        appliedJobLists = JobPageJobApplicationsModel.fromJson(jobData).result ?? [];
      }
    } catch (e) {
      showSnackS();
    }
    changeLoading();
  }

  @action
  Future<void> deleteJobApplication(int index) async {
    final Response? result;

    try {
      result =
          await appService?.dio.get("${BackendURLS.DELETE_JOB_APPLICATION}${appliedJobLists[index].jobApplicationId}");
      if (result?.statusCode == HttpStatus.noContent) {
        getAppliedJobs();
      }
    } catch (e) {
      showSnackSWithParam(e.toString());
    }
  }

  void popDeleteWidget() {
    Navigator.pop(baseContext);
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
