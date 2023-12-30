// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_jobs_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MyCarsViewModel on _MyCarsViewModelBase, Store {
  late final _$appliedJobListsAtom =
      Atom(name: '_MyCarsViewModelBase.appliedJobLists', context: context);

  @override
  List<JobPageJobApplication> get appliedJobLists {
    _$appliedJobListsAtom.reportRead();
    return super.appliedJobLists;
  }

  @override
  set appliedJobLists(List<JobPageJobApplication> value) {
    _$appliedJobListsAtom.reportWrite(value, super.appliedJobLists, () {
      super.appliedJobLists = value;
    });
  }

  late final _$isloadingAtom =
      Atom(name: '_MyCarsViewModelBase.isloading', context: context);

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

  late final _$getAppliedJobsAsyncAction =
      AsyncAction('_MyCarsViewModelBase.getAppliedJobs', context: context);

  @override
  Future<void> getAppliedJobs() {
    return _$getAppliedJobsAsyncAction.run(() => super.getAppliedJobs());
  }

  late final _$deleteJobApplicationAsyncAction = AsyncAction(
      '_MyCarsViewModelBase.deleteJobApplication',
      context: context);

  @override
  Future<void> deleteJobApplication(int index) {
    return _$deleteJobApplicationAsyncAction
        .run(() => super.deleteJobApplication(index));
  }

  late final _$_MyCarsViewModelBaseActionController =
      ActionController(name: '_MyCarsViewModelBase', context: context);

  @override
  void changeLoading() {
    final _$actionInfo = _$_MyCarsViewModelBaseActionController.startAction(
        name: '_MyCarsViewModelBase.changeLoading');
    try {
      return super.changeLoading();
    } finally {
      _$_MyCarsViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
appliedJobLists: ${appliedJobLists},
isloading: ${isloading}
    ''';
  }
}
