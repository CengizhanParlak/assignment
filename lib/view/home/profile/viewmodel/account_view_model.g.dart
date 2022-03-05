// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AccountViewModel on _AccountViewModelBase, Store {
  Computed<List<String>>? _$getFavoriteBlogIdsComputed;

  @override
  List<String> get getFavoriteBlogIds => (_$getFavoriteBlogIdsComputed ??=
          Computed<List<String>>(() => super.getFavoriteBlogIds, name: '_AccountViewModelBase.getFavoriteBlogIds'))
      .value;
  Computed<bool>? _$isEmptyComputed;

  @override
  bool get isAccountImageEmpty =>
      (_$isEmptyComputed ??= Computed<bool>(() => super.isAccountImageEmpty, name: '_AccountViewModelBase.isEmpty'))
          .value;
  Computed<String>? _$accountImageComputed;

  @override
  String get getAccountImage => (_$accountImageComputed ??=
          Computed<String>(() => super.getAccountImage, name: '_AccountViewModelBase.accountImage'))
      .value;

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

  final _$getAccountInfoAsyncAction = AsyncAction('_AccountViewModelBase.getAccountInfo');

  @override
  Future<void> getAccountInfo(dynamic context) {
    return _$getAccountInfoAsyncAction.run(() => super.getAccountInfo(context));
  }

  final _$_AccountViewModelBaseActionController = ActionController(name: '_AccountViewModelBase');

  @override
  void setAccount(Account account) {
    final _$actionInfo = _$_AccountViewModelBaseActionController.startAction(name: '_AccountViewModelBase.setAccount');
    try {
      return super.setAccount(account);
    } finally {
      _$_AccountViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setFavorites() {
    final _$actionInfo =
        _$_AccountViewModelBaseActionController.startAction(name: '_AccountViewModelBase.setFavorites');
    try {
      return super.setFavorites();
    } finally {
      _$_AccountViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setLocation(String long, String lat) {
    final _$actionInfo = _$_AccountViewModelBaseActionController.startAction(name: '_AccountViewModelBase.setLocation');
    try {
      return super.setLocation(long, lat);
    } finally {
      _$_AccountViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeAccountImage(String url) {
    final _$actionInfo =
        _$_AccountViewModelBaseActionController.startAction(name: '_AccountViewModelBase.changeAccountImage');
    try {
      return super.changeAccountImage(url);
    } finally {
      _$_AccountViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateAccountInfo(dynamic context) {
    final _$actionInfo =
        _$_AccountViewModelBaseActionController.startAction(name: '_AccountViewModelBase.updateAccountInfo');
    try {
      return super.updateAccountInfo(context);
    } finally {
      _$_AccountViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
account: ${account},
getFavoriteBlogIds: ${getFavoriteBlogIds},
isEmpty: ${isAccountImageEmpty},
accountImage: ${getAccountImage}
    ''';
  }
}
