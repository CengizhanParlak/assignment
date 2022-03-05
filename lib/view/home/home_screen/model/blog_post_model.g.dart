// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blog_post_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$BlogPost on _BlogPostViewModel, Store {
  final _$isFavoritedAtom = Atom(name: '_BlogPostViewModel.isFavorited');

  @override
  bool get isFavorited {
    _$isFavoritedAtom.reportRead();
    return super.isFavorited;
  }

  @override
  set isFavorited(bool value) {
    _$isFavoritedAtom.reportWrite(value, super.isFavorited, () {
      super.isFavorited = value;
    });
  }

  final _$_BlogPostViewModelActionController =
      ActionController(name: '_BlogPostViewModel');

  @override
  void toggleFavorite() {
    final _$actionInfo = _$_BlogPostViewModelActionController.startAction(
        name: '_BlogPostViewModel.toggleFavorite');
    try {
      return super.toggleFavorite();
    } finally {
      _$_BlogPostViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isFavorited: ${isFavorited}
    ''';
  }
}
