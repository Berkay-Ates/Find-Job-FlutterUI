// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job_add_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$JobAddViewModel on _JobAddViewModelBase, Store {
  late final _$checkboxValueAtom =
      Atom(name: '_JobAddViewModelBase.checkboxValue', context: context);

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

  late final _$addJobAsyncAction =
      AsyncAction('_JobAddViewModelBase.addJob', context: context);

  @override
  Future<dynamic> addJob() {
    return _$addJobAsyncAction.run(() => super.addJob());
  }

  late final _$_JobAddViewModelBaseActionController =
      ActionController(name: '_JobAddViewModelBase', context: context);

  @override
  void changeCarSaleCheckboxValue(bool? value) {
    final _$actionInfo = _$_JobAddViewModelBaseActionController.startAction(
        name: '_JobAddViewModelBase.changeCarSaleCheckboxValue');
    try {
      return super.changeCarSaleCheckboxValue(value);
    } finally {
      _$_JobAddViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String? textFieldsValidator(String? value) {
    final _$actionInfo = _$_JobAddViewModelBaseActionController.startAction(
        name: '_JobAddViewModelBase.textFieldsValidator');
    try {
      return super.textFieldsValidator(value);
    } finally {
      _$_JobAddViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
checkboxValue: ${checkboxValue}
    ''';
  }
}
