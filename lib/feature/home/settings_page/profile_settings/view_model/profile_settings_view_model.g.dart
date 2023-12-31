// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_settings_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ProfileSettingsViewModel on _ProfileSettingsViewModelBase, Store {
  late final _$userHiveModelAtom = Atom(
      name: '_ProfileSettingsViewModelBase.userHiveModel', context: context);

  @override
  UserHiveModel? get userHiveModel {
    _$userHiveModelAtom.reportRead();
    return super.userHiveModel;
  }

  @override
  set userHiveModel(UserHiveModel? value) {
    _$userHiveModelAtom.reportWrite(value, super.userHiveModel, () {
      super.userHiveModel = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_ProfileSettingsViewModelBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$initHiveAsyncAction =
      AsyncAction('_ProfileSettingsViewModelBase.initHive', context: context);

  @override
  Future<dynamic> initHive() {
    return _$initHiveAsyncAction.run(() => super.initHive());
  }

  late final _$updateProfileAsyncAction = AsyncAction(
      '_ProfileSettingsViewModelBase.updateProfile',
      context: context);

  @override
  Future<dynamic> updateProfile() {
    return _$updateProfileAsyncAction.run(() => super.updateProfile());
  }

  late final _$_ProfileSettingsViewModelBaseActionController =
      ActionController(name: '_ProfileSettingsViewModelBase', context: context);

  @override
  void changeLoading() {
    final _$actionInfo = _$_ProfileSettingsViewModelBaseActionController
        .startAction(name: '_ProfileSettingsViewModelBase.changeLoading');
    try {
      return super.changeLoading();
    } finally {
      _$_ProfileSettingsViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
userHiveModel: ${userHiveModel},
isLoading: ${isLoading}
    ''';
  }
}
