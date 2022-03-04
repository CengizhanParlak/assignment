// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginViewModel on _LoginViewModelBase, Store {
  Computed<bool>? _$isLoggedInComputed;

  @override
  bool get isLoggedIn =>
      (_$isLoggedInComputed ??= Computed<bool>(() => super.isLoggedIn,
              name: '_LoginViewModelBase.isLoggedIn'))
          .value;
  Computed<bool>? _$isEmailOrPasswordEmptyComputed;

  @override
  bool get isEmailOrPasswordEmpty => (_$isEmailOrPasswordEmptyComputed ??=
          Computed<bool>(() => super.isEmailOrPasswordEmpty,
              name: '_LoginViewModelBase.isEmailOrPasswordEmpty'))
      .value;
  Computed<bool>? _$isEmailValidComputed;

  @override
  bool get isEmailValid =>
      (_$isEmailValidComputed ??= Computed<bool>(() => super.isEmailValid,
              name: '_LoginViewModelBase.isEmailValid'))
          .value;
  Computed<bool>? _$isPasswordValidComputed;

  @override
  bool get isPasswordValid =>
      (_$isPasswordValidComputed ??= Computed<bool>(() => super.isPasswordValid,
              name: '_LoginViewModelBase.isPasswordValid'))
          .value;

  final _$emailAtom = Atom(name: '_LoginViewModelBase.email');

  @override
  String? get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String? value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  final _$passwordAtom = Atom(name: '_LoginViewModelBase.password');

  @override
  String? get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String? value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  final _$isLoggedAtom = Atom(name: '_LoginViewModelBase.isLogged');

  @override
  bool get isLogged {
    _$isLoggedAtom.reportRead();
    return super.isLogged;
  }

  @override
  set isLogged(bool value) {
    _$isLoggedAtom.reportWrite(value, super.isLogged, () {
      super.isLogged = value;
    });
  }

  final _$signInAsyncAction = AsyncAction('_LoginViewModelBase.signIn');

  @override
  Future<void> signIn() {
    return _$signInAsyncAction.run(() => super.signIn());
  }

  final _$signOutAsyncAction = AsyncAction('_LoginViewModelBase.signOut');

  @override
  Future<void> signOut() {
    return _$signOutAsyncAction.run(() => super.signOut());
  }

  @override
  String toString() {
    return '''
email: ${email},
password: ${password},
isLogged: ${isLogged},
isLoggedIn: ${isLoggedIn},
isEmailOrPasswordEmpty: ${isEmailOrPasswordEmpty},
isEmailValid: ${isEmailValid},
isPasswordValid: ${isPasswordValid}
    ''';
  }
}
