// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeViewModel on _HomeViewModelBase, Store {
  late final _$selectedJobOrderAtom =
      Atom(name: '_HomeViewModelBase.selectedJobOrder', context: context);

  @override
  HomeJobsorderEnums get selectedJobOrder {
    _$selectedJobOrderAtom.reportRead();
    return super.selectedJobOrder;
  }

  @override
  set selectedJobOrder(HomeJobsorderEnums value) {
    _$selectedJobOrderAtom.reportWrite(value, super.selectedJobOrder, () {
      super.selectedJobOrder = value;
    });
  }

  late final _$joblistAtom =
      Atom(name: '_HomeViewModelBase.joblist', context: context);

  @override
  List<JobResult> get joblist {
    _$joblistAtom.reportRead();
    return super.joblist;
  }

  @override
  set joblist(List<JobResult> value) {
    _$joblistAtom.reportWrite(value, super.joblist, () {
      super.joblist = value;
    });
  }

  late final _$companyJobListAtom =
      Atom(name: '_HomeViewModelBase.companyJobList', context: context);

  @override
  List<JobResult> get companyJobList {
    _$companyJobListAtom.reportRead();
    return super.companyJobList;
  }

  @override
  set companyJobList(List<JobResult> value) {
    _$companyJobListAtom.reportWrite(value, super.companyJobList, () {
      super.companyJobList = value;
    });
  }

  late final _$jobApplicationListAtom =
      Atom(name: '_HomeViewModelBase.jobApplicationList', context: context);

  @override
  List<JobApplication> get jobApplicationList {
    _$jobApplicationListAtom.reportRead();
    return super.jobApplicationList;
  }

  @override
  set jobApplicationList(List<JobApplication> value) {
    _$jobApplicationListAtom.reportWrite(value, super.jobApplicationList, () {
      super.jobApplicationList = value;
    });
  }

  late final _$isloadingAtom =
      Atom(name: '_HomeViewModelBase.isloading', context: context);

  @override
  bool get isloading {
    _$isloadingAtom.reportRead();
    return super.isloading;
  }

  @override
  set isloading(bool value) {
    _$isloadingAtom.reportWrite(value, super.isloading, () {
      super.isloading = value;
    });
  }

  late final _$getOrderedJobsAsyncAction =
      AsyncAction('_HomeViewModelBase.getOrderedJobs', context: context);

  @override
  Future<void> getOrderedJobs() {
    return _$getOrderedJobsAsyncAction.run(() => super.getOrderedJobs());
  }

  late final _$getCompanyJobsAsyncAction =
      AsyncAction('_HomeViewModelBase.getCompanyJobs', context: context);

  @override
  Future<void> getCompanyJobs() {
    return _$getCompanyJobsAsyncAction.run(() => super.getCompanyJobs());
  }

  late final _$getJobsAsyncAction =
      AsyncAction('_HomeViewModelBase.getJobs', context: context);

  @override
  Future<void> getJobs() {
    return _$getJobsAsyncAction.run(() => super.getJobs());
  }

  late final _$applyJobAsyncAction =
      AsyncAction('_HomeViewModelBase.applyJob', context: context);

  @override
  Future<void> applyJob(int index) {
    return _$applyJobAsyncAction.run(() => super.applyJob(index));
  }

  late final _$_HomeViewModelBaseActionController =
      ActionController(name: '_HomeViewModelBase', context: context);

  @override
  void changeLoading() {
    final _$actionInfo = _$_HomeViewModelBaseActionController.startAction(
        name: '_HomeViewModelBase.changeLoading');
    try {
      return super.changeLoading();
    } finally {
      _$_HomeViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeJobOrderCategory(HomeJobsorderEnums value) {
    final _$actionInfo = _$_HomeViewModelBaseActionController.startAction(
        name: '_HomeViewModelBase.changeJobOrderCategory');
    try {
      return super.changeJobOrderCategory(value);
    } finally {
      _$_HomeViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String tarihiDuzenle(String inputDateTime) {
    final _$actionInfo = _$_HomeViewModelBaseActionController.startAction(
        name: '_HomeViewModelBase.tarihiDuzenle');
    try {
      return super.tarihiDuzenle(inputDateTime);
    } finally {
      _$_HomeViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
selectedJobOrder: ${selectedJobOrder},
joblist: ${joblist},
companyJobList: ${companyJobList},
jobApplicationList: ${jobApplicationList},
isloading: ${isloading}
    ''';
  }
}
