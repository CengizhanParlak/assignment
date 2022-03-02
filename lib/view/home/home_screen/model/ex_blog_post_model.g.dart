// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ex_blog_post_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ExBlogPost on _ExBlogPost, Store {
  final _$isFavoriteAtom = Atom(name: '_ExBlogPost.isFavorite');

  @override
  bool get isFavorite {
    _$isFavoriteAtom.reportRead();
    return super.isFavorite;
  }

  @override
  set isFavorite(bool value) {
    _$isFavoriteAtom.reportWrite(value, super.isFavorite, () {
      super.isFavorite = value;
    });
  }

  final _$_ExBlogPostActionController = ActionController(name: '_ExBlogPost');

  @override
  void toggleFavorite(String articleId) {
    final _$actionInfo = _$_ExBlogPostActionController.startAction(
        name: '_ExBlogPost.toggleFavorite');
    try {
      return super.toggleFavorite(articleId);
    } finally {
      _$_ExBlogPostActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isFavorite: ${isFavorite}
    ''';
  }
}
