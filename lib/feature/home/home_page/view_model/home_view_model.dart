import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:placars_savt/feature/home/home_page/model/job_applications_model.dart';
import 'package:placars_savt/feature/home/home_page/model/job_apply_model.dart';
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
  FocusNode? focusNode;

  TextEditingController? textController;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final unfocusNode = FocusNode();

  @observable
  HomeJobsorderEnums selectedJobOrder = HomeJobsorderEnums.none;

  IHivecacheManager<UserHiveModel>? userHiveCacheManager;
  UserHiveModel? userHiveModel;

  @observable
  List<JobResult> joblist = [];

  @observable
  List<JobResult> companyJobList = [];

  @observable
  List<JobApplication> jobApplicationList = [];

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
    focusNode ??= FocusNode();

    initHive();
  }

  void dispose() {
    textController?.dispose();
  }

  Future initHive() async {
    userHiveCacheManager = UserHiveCacheManager(CacheEnumKeys.USERHIVEBOXKEY.name);
    await userHiveCacheManager?.init();
    userHiveModel = userHiveCacheManager?.getItem(CacheEnumKeys.USERHIVEKEY.name);
    getJobs();
  }

  @action
  void changeJobOrderCategory(HomeJobsorderEnums value) {
    if (value != selectedJobOrder) {
      selectedJobOrder = value;
    }
    getOrderedJobs();
  }

  @action
  String tarihiDuzenle(String inputDateTime) {
    // Gelen tarih ve saat formatını parse et
    DateTime dateTime;
    // Tarihi ve saati ayrı ayrı al
    try {
      dateTime = DateTime.parse(inputDateTime);
    } on Exception {
      inspect(inputDateTime);
      return inputDateTime;
    }
    int day = dateTime.day;
    int month = dateTime.month;
    int year = dateTime.year;
    int hour = dateTime.hour;
    int minute = dateTime.minute;

    // İstediğimiz formatta bir string oluştur
    String formattedDateTime =
        '$day-${month < 10 ? '0$month' : month}-$year ${hour < 10 ? '0$hour' : hour}:${minute < 10 ? '0$minute' : minute}';

    return formattedDateTime;
  }

  @action
  Future<void> getOrderedJobs() async {
    changeLoading();
    try {
      final appliedJobs =
          await appService?.dio.get("${BackendURLS.GET_USER_JOB_APPLICATION}${userHiveModel?.person_id}/");
      final jobData = appliedJobs?.data;
      if (jobData is Map<String, dynamic>) {
        jobApplicationList = JobApplications.fromJson(jobData).result ?? [];
      }
      final response = await appService?.dio.get("${BackendURLS.GET_ORDERED_JOBS}${selectedJobOrder.enumValue}");
      final data = response?.data;

      if (data is Map<String, dynamic>) {
        joblist = Jobs.fromJson(data).result ?? [];

        for (var application in jobApplicationList) {
          for (var job in joblist) {
            if (application.jobId == job.job_id) {
              job.is_applied = true;
            }
          }
        }
      }
    } catch (e) {
      showSnackSParam(e.toString());
    }
    changeLoading();
    showSnackSParam(
        "SQL Fonksiyonu ile veriler cekildigi icin bilgiler farkli formatta donmektedir. Bu bilgiler API tarafinda her ne kadar duzeltilse de ekranda duzgun gozukmeyebilir");
  }

  @action
  Future<void> getCompanyJobs() async {
    changeLoading();
    try {
      final response = await appService?.dio.get("${BackendURLS.GET_COMPANY_JOBS}${textController?.text}");
      final data = response?.data;

      if (data is Map<String, dynamic>) {
        companyJobList = Jobs.fromJson(data).result ?? [];
      }
    } catch (e) {
      showSnackSParam(e.toString());
    }
    changeLoading();
  }

  @action
  Future<void> getJobs() async {
    changeLoading();
    try {
      final appliedJobs =
          await appService?.dio.get("${BackendURLS.GET_USER_JOB_APPLICATION}${userHiveModel?.person_id}/");
      final jobData = appliedJobs?.data;
      if (jobData is Map<String, dynamic>) {
        jobApplicationList = JobApplications.fromJson(jobData).result ?? [];
      }
      final response = await appService?.dio.get(BackendURLS.GET_ALL_JOBS);
      final data = response?.data;

      if (data is Map<String, dynamic>) {
        joblist = Jobs.fromJson(data).result ?? [];

        for (var application in jobApplicationList) {
          for (var job in joblist) {
            if (application.jobId == job.job_id) {
              job.is_applied = true;
            }
          }
        }
      }
    } catch (e) {
      showSnackSParam(e.toString());
    }
    changeLoading();
  }

  @action
  Future<void> applyJob(int index) async {
    final userId = userHiveModel?.person_id;
    final jobId = joblist[index].job_id;
    final companyId = joblist[index].company_id;
    JobApplyModel jobApplyModel = JobApplyModel(companyId: companyId, jobId: jobId.toString(), userId: userId);

    try {
      final response = await appService?.dio.post(BackendURLS.CREATE_JOB_APPLICATION, data: jobApplyModel.toJson());

      if (response?.statusCode == HttpStatus.created) {
        getJobs();
      }
    } catch (e) {
      showSnackSParam(e.toString());
      inspect(e);
    }

    inspect(userId);
  }

  void showSnackAlreadyApplied() {
    ScaffoldMessenger.of(baseContext).showSnackBar(SnackBar(
      content: const Text(
        "Bu ise zaten basvuru yapildi!!",
        textAlign: TextAlign.center,
      ),
      backgroundColor: Theme.of(baseContext).colorScheme.error,
    ));
  }

  void showSnackSParam(String message) {
    ScaffoldMessenger.of(baseContext).showSnackBar(SnackBar(
      content: Text(
        message,
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
