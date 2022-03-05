// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SignUpViewModel on _SignUpViewModelBase, Store {
  Computed<bool>? _$isEmailOrPasswordEmptyComputed;

  @override
  bool get isEmailOrPasswordEmpty => (_$isEmailOrPasswordEmptyComputed ??=
          Computed<bool>(() => super.isEmailOrPasswordEmpty,
              name: '_SignUpViewModelBase.isEmailOrPasswordEmpty'))
      .value;
  Computed<bool>? _$isEmailValidComputed;

  @override
  bool get isEmailValid =>
      (_$isEmailValidComputed ??= Computed<bool>(() => super.isEmailValid,
              name: '_SignUpViewModelBase.isEmailValid'))
          .value;
  Computed<bool>? _$isPasswordValidComputed;

  @override
  bool get isPasswordValid =>
      (_$isPasswordValidComputed ??= Computed<bool>(() => super.isPasswordValid,
              name: '_SignUpViewModelBase.isPasswordValid'))
          .value;
  Computed<bool>? _$isPasswordRetryValidComputed;

  @override
  bool get isPasswordRetryValid => (_$isPasswordRetryValidComputed ??=
          Computed<bool>(() => super.isPasswordRetryValid,
              name: '_SignUpViewModelBase.isPasswordRetryValid'))
      .value;
  Computed<bool>? _$isPasswordsEqualComputed;

  @override
  bool get isPasswordsEqual => (_$isPasswordsEqualComputed ??= Computed<bool>(
          () => super.isPasswordsEqual,
          name: '_SignUpViewModelBase.isPasswordsEqual'))
      .value;

  final _$modelAtom = Atom(name: '_SignUpViewModelBase.model');

  @override
  SignUpModel get model {
    _$modelAtom.reportRead();
    return super.model;
  }

  @override
  set model(SignUpModel value) {
    _$modelAtom.reportWrite(value, super.model, () {
      super.model = value;
    });
  }

  final _$emailAtom = Atom(name: '_SignUpViewModelBase.email');

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  final _$passwordAtom = Atom(name: '_SignUpViewModelBase.password');

  @override
  String get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  final _$passwordRetryAtom = Atom(name: '_SignUpViewModelBase.passwordRetry');

  @override
  String get passwordRetry {
    _$passwordRetryAtom.reportRead();
    return super.passwordRetry;
  }

  @override
  set passwordRetry(String value) {
    _$passwordRetryAtom.reportWrite(value, super.passwordRetry, () {
      super.passwordRetry = value;
    });
  }

  final _$isPasswordVisibleAtom =
      Atom(name: '_SignUpViewModelBase.isPasswordVisible');

  @override
  bool get isPasswordVisible {
    _$isPasswordVisibleAtom.reportRead();
    return super.isPasswordVisible;
  }

  @override
  set isPasswordVisible(bool value) {
    _$isPasswordVisibleAtom.reportWrite(value, super.isPasswordVisible, () {
      super.isPasswordVisible = value;
    });
  }

  final _$isPasswordRetryVisibleAtom =
      Atom(name: '_SignUpViewModelBase.isPasswordRetryVisible');

  @override
  bool get isPasswordRetryVisible {
    _$isPasswordRetryVisibleAtom.reportRead();
    return super.isPasswordRetryVisible;
  }

  @override
  set isPasswordRetryVisible(bool value) {
    _$isPasswordRetryVisibleAtom
        .reportWrite(value, super.isPasswordRetryVisible, () {
      super.isPasswordRetryVisible = value;
    });
  }

  final _$isSignUpCompletedAtom =
      Atom(name: '_SignUpViewModelBase.isSignUpCompleted');

  @override
  bool get isSignUpCompleted {
    _$isSignUpCompletedAtom.reportRead();
    return super.isSignUpCompleted;
  }

  @override
  set isSignUpCompleted(bool value) {
    _$isSignUpCompletedAtom.reportWrite(value, super.isSignUpCompleted, () {
      super.isSignUpCompleted = value;
    });
  }

  final _$signUpAsyncAction = AsyncAction('_SignUpViewModelBase.signUp');

  @override
  Future<void> signUp(dynamic context) {
    return _$signUpAsyncAction.run(() => super.signUp(context));
  }

  final _$_SignUpViewModelBaseActionController =
      ActionController(name: '_SignUpViewModelBase');

  @override
  void setModelField() {
    final _$actionInfo = _$_SignUpViewModelBaseActionController.startAction(
        name: '_SignUpViewModelBase.setModelField');
    try {
      return super.setModelField();
    } finally {
      _$_SignUpViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void togglePasswordVisibility() {
    final _$actionInfo = _$_SignUpViewModelBaseActionController.startAction(
        name: '_SignUpViewModelBase.togglePasswordVisibility');
    try {
      return super.togglePasswordVisibility();
    } finally {
      _$_SignUpViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void togglePasswordRetryVisibility() {
    final _$actionInfo = _$_SignUpViewModelBaseActionController.startAction(
        name: '_SignUpViewModelBase.togglePasswordRetryVisibility');
    try {
      return super.togglePasswordRetryVisibility();
    } finally {
      _$_SignUpViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearFieldValues() {
    final _$actionInfo = _$_SignUpViewModelBaseActionController.startAction(
        name: '_SignUpViewModelBase.clearFieldValues');
    try {
      return super.clearFieldValues();
    } finally {
      _$_SignUpViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
model: ${model},
email: ${email},
password: ${password},
passwordRetry: ${passwordRetry},
isPasswordVisible: ${isPasswordVisible},
isPasswordRetryVisible: ${isPasswordRetryVisible},
isSignUpCompleted: ${isSignUpCompleted},
isEmailOrPasswordEmpty: ${isEmailOrPasswordEmpty},
isEmailValid: ${isEmailValid},
isPasswordValid: ${isPasswordValid},
isPasswordRetryValid: ${isPasswordRetryValid},
isPasswordsEqual: ${isPasswordsEqual}
    ''';
  }
}
