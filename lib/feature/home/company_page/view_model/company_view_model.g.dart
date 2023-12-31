// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CompanyViewModel on _CompanyViewModelBase, Store {
  late final _$companiesListAtom =
      Atom(name: '_CompanyViewModelBase.companiesList', context: context);

  @override
  List<CompanyResult>? get companiesList {
    _$companiesListAtom.reportRead();
    return super.companiesList;
  }

  @override
  set companiesList(List<CompanyResult>? value) {
    _$companiesListAtom.reportWrite(value, super.companiesList, () {
      super.companiesList = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_CompanyViewModelBase.isLoading', context: context);

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

  late final _$_CompanyViewModelBaseActionController =
      ActionController(name: '_CompanyViewModelBase', context: context);

  @override
  void changeLoading() {
    final _$actionInfo = _$_CompanyViewModelBaseActionController.startAction(
        name: '_CompanyViewModelBase.changeLoading');
    try {
      return super.changeLoading();
    } finally {
      _$_CompanyViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
companiesList: ${companiesList},
isLoading: ${isLoading}
    ''';
  }
}
