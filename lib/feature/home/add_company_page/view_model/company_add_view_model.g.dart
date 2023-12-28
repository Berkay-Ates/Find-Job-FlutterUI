// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company_add_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CompanyAddViewModel on _CompanyAddViewModelBase, Store {
  late final _$checkboxValueAtom =
      Atom(name: '_CompanyAddViewModelBase.checkboxValue', context: context);

  @override
  bool get checkboxValue {
    _$checkboxValueAtom.reportRead();
    return super.checkboxValue;
  }

  @override
  set checkboxValue(bool value) {
    _$checkboxValueAtom.reportWrite(value, super.checkboxValue, () {
      super.checkboxValue = value;
    });
  }

  late final _$companyUrlAtom =
      Atom(name: '_CompanyAddViewModelBase.companyUrl', context: context);

  @override
  String get companyUrl {
    _$companyUrlAtom.reportRead();
    return super.companyUrl;
  }

  @override
  set companyUrl(String value) {
    _$companyUrlAtom.reportWrite(value, super.companyUrl, () {
      super.companyUrl = value;
    });
  }

  late final _$addCompanyAsyncAction =
      AsyncAction('_CompanyAddViewModelBase.addCompany', context: context);

  @override
  Future<dynamic> addCompany() {
    return _$addCompanyAsyncAction.run(() => super.addCompany());
  }

  late final _$_CompanyAddViewModelBaseActionController =
      ActionController(name: '_CompanyAddViewModelBase', context: context);

  @override
  void setCarUrl(String imageUrl) {
    final _$actionInfo = _$_CompanyAddViewModelBaseActionController.startAction(
        name: '_CompanyAddViewModelBase.setCarUrl');
    try {
      return super.setCarUrl(imageUrl);
    } finally {
      _$_CompanyAddViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeCarSaleCheckboxValue(bool? value) {
    final _$actionInfo = _$_CompanyAddViewModelBaseActionController.startAction(
        name: '_CompanyAddViewModelBase.changeCarSaleCheckboxValue');
    try {
      return super.changeCarSaleCheckboxValue(value);
    } finally {
      _$_CompanyAddViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String? textFieldsValidator(String? value) {
    final _$actionInfo = _$_CompanyAddViewModelBaseActionController.startAction(
        name: '_CompanyAddViewModelBase.textFieldsValidator');
    try {
      return super.textFieldsValidator(value);
    } finally {
      _$_CompanyAddViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
checkboxValue: ${checkboxValue},
companyUrl: ${companyUrl}
    ''';
  }
}
