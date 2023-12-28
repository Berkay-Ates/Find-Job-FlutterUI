// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_jobs_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MyCarsViewModel on _MyCarsViewModelBase, Store {
  late final _$jobListsAtom =
      Atom(name: '_MyCarsViewModelBase.jobLists', context: context);

  @override
  List<JobResult> get jobLists {
    _$jobListsAtom.reportRead();
    return super.jobLists;
  }

  @override
  set jobLists(List<JobResult> value) {
    _$jobListsAtom.reportWrite(value, super.jobLists, () {
      super.jobLists = value;
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

  late final _$itemCountsAtom =
      Atom(name: '_MyCarsViewModelBase.itemCounts', context: context);

  @override
  int get itemCounts {
    _$itemCountsAtom.reportRead();
    return super.itemCounts;
  }

  @override
  set itemCounts(int value) {
    _$itemCountsAtom.reportWrite(value, super.itemCounts, () {
      super.itemCounts = value;
    });
  }

  late final _$getMyCarsAsyncAction =
      AsyncAction('_MyCarsViewModelBase.getMyCars', context: context);

  @override
  Future<dynamic> getMyCars() {
    return _$getMyCarsAsyncAction.run(() => super.getMyCars());
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
  void changeItemCount() {
    final _$actionInfo = _$_MyCarsViewModelBaseActionController.startAction(
        name: '_MyCarsViewModelBase.changeItemCount');
    try {
      return super.changeItemCount();
    } finally {
      _$_MyCarsViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
jobLists: ${jobLists},
isloading: ${isloading},
itemCounts: ${itemCounts}
    ''';
  }
}
