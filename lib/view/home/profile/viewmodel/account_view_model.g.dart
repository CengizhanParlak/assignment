// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AccountViewModel on _AccountViewModelBase, Store {
  final _$accountAtom = Atom(name: '_AccountViewModelBase.account');

  @override
  Account? get account {
    _$accountAtom.reportRead();
    return super.account;
  }

  @override
  set account(Account? value) {
    _$accountAtom.reportWrite(value, super.account, () {
      super.account = value;
    });
  }

  final _$_AccountViewModelBaseActionController =
      ActionController(name: '_AccountViewModelBase');

  @override
  void setAccount(Account account) {
    final _$actionInfo = _$_AccountViewModelBaseActionController.startAction(
        name: '_AccountViewModelBase.setAccount');
    try {
      return super.setAccount(account);
    } finally {
      _$_AccountViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void getAccountInfo() {
    final _$actionInfo = _$_AccountViewModelBaseActionController.startAction(
        name: '_AccountViewModelBase.getAccountInfo');
    try {
      return super.getAccountInfo();
    } finally {
      _$_AccountViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setFavorites() {
    final _$actionInfo = _$_AccountViewModelBaseActionController.startAction(
        name: '_AccountViewModelBase.setFavorites');
    try {
      return super.setFavorites();
    } finally {
      _$_AccountViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeAccountImage(String url) {
    final _$actionInfo = _$_AccountViewModelBaseActionController.startAction(
        name: '_AccountViewModelBase.changeAccountImage');
    try {
      return super.changeAccountImage(url);
    } finally {
      _$_AccountViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
account: ${account}
    ''';
  }
}
