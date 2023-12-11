// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'splash_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SplashViewModel on _SplashViewModelBase, Store {
  late final _$isLoadingAtom =
      Atom(name: '_SplashViewModelBase.isLoading', context: context);

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

  late final _$userHiveModelAtom =
      Atom(name: '_SplashViewModelBase.userHiveModel', context: context);

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

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
userHiveModel: ${userHiveModel}
    ''';
  }
}
