// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite_posts_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FavoritePostsViewModel on _FavoritePostsViewModel, Store {
  Computed<bool>? _$isFavoritesEmptyComputed;

  @override
  bool get isFavoritesEmpty => (_$isFavoritesEmptyComputed ??= Computed<bool>(
          () => super.isFavoritesEmpty,
          name: '_FavoritePostsViewModel.isFavoritesEmpty'))
      .value;

  final _$favoritePostsAtom =
      Atom(name: '_FavoritePostsViewModel.favoritePosts');

  @override
  ObservableList<FavoritePost> get favoritePosts {
    _$favoritePostsAtom.reportRead();
    return super.favoritePosts;
  }

  @override
  set favoritePosts(ObservableList<FavoritePost> value) {
    _$favoritePostsAtom.reportWrite(value, super.favoritePosts, () {
      super.favoritePosts = value;
    });
  }

  final _$_FavoritePostsViewModelActionController =
      ActionController(name: '_FavoritePostsViewModel');

  @override
  void removeFromFavorite(String id) {
    final _$actionInfo = _$_FavoritePostsViewModelActionController.startAction(
        name: '_FavoritePostsViewModel.removeFromFavorite');
    try {
      return super.removeFromFavorite(id);
    } finally {
      _$_FavoritePostsViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addToFavorite(FavoritePost favoritePost) {
    final _$actionInfo = _$_FavoritePostsViewModelActionController.startAction(
        name: '_FavoritePostsViewModel.addToFavorite');
    try {
      return super.addToFavorite(favoritePost);
    } finally {
      _$_FavoritePostsViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
favoritePosts: ${favoritePosts},
isFavoritesEmpty: ${isFavoritesEmpty}
    ''';
  }
}
