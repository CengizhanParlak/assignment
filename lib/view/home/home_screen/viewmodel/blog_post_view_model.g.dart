// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blog_post_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$BlogPostListViewModel on _BlogPostListVievModelBase, Store {
  Computed<bool>? _$isInittedComputed;

  @override
  bool get isInitted =>
      (_$isInittedComputed ??= Computed<bool>(() => super.isInitted,
              name: '_BlogPostListVievModelBase.isInitted'))
          .value;
  Computed<List<BlogPost>>? _$favoritedBlogPostsComputed;

  @override
  List<BlogPost> get favoritedBlogPosts => (_$favoritedBlogPostsComputed ??=
          Computed<List<BlogPost>>(() => super.favoritedBlogPosts,
              name: '_BlogPostListVievModelBase.favoritedBlogPosts'))
      .value;
  Computed<bool>? _$isBlogPostsEmptyComputed;

  @override
  bool get isBlogPostsEmpty => (_$isBlogPostsEmptyComputed ??= Computed<bool>(
          () => super.isBlogPostsEmpty,
          name: '_BlogPostListVievModelBase.isBlogPostsEmpty'))
      .value;
  Computed<bool>? _$isFavoritedBlogPostsEmptyComputed;

  @override
  bool get isFavoritedBlogPostsEmpty => (_$isFavoritedBlogPostsEmptyComputed ??=
          Computed<bool>(() => super.isFavoritedBlogPostsEmpty,
              name: '_BlogPostListVievModelBase.isFavoritedBlogPostsEmpty'))
      .value;
  Computed<int>? _$favoritedBlogPostCountComputed;

  @override
  int get favoritedBlogPostCount => (_$favoritedBlogPostCountComputed ??=
          Computed<int>(() => super.favoritedBlogPostCount,
              name: '_BlogPostListVievModelBase.favoritedBlogPostCount'))
      .value;

  final _$isInitializedAtom =
      Atom(name: '_BlogPostListVievModelBase.isInitialized');

  @override
  bool get isInitialized {
    _$isInitializedAtom.reportRead();
    return super.isInitialized;
  }

  @override
  set isInitialized(bool value) {
    _$isInitializedAtom.reportWrite(value, super.isInitialized, () {
      super.isInitialized = value;
    });
  }

  final _$blogPostsAtom = Atom(name: '_BlogPostListVievModelBase.blogPosts');

  @override
  ObservableList<BlogPost> get blogPosts {
    _$blogPostsAtom.reportRead();
    return super.blogPosts;
  }

  @override
  set blogPosts(ObservableList<BlogPost> value) {
    _$blogPostsAtom.reportWrite(value, super.blogPosts, () {
      super.blogPosts = value;
    });
  }

  final _$toggleFavoriteAsyncAction =
      AsyncAction('_BlogPostListVievModelBase.toggleFavorite');

  @override
  Future<void> toggleFavorite(String articleId, int index) {
    return _$toggleFavoriteAsyncAction
        .run(() => super.toggleFavorite(articleId, index));
  }

  final _$fetchBlogPostsAsyncAction =
      AsyncAction('_BlogPostListVievModelBase.fetchBlogPosts');

  @override
  Future<void> fetchBlogPosts({String categoryId = ""}) {
    return _$fetchBlogPostsAsyncAction
        .run(() => super.fetchBlogPosts(categoryId: categoryId));
  }

  final _$_BlogPostListVievModelBaseActionController =
      ActionController(name: '_BlogPostListVievModelBase');

  @override
  void initViedModel(BuildContext context) {
    final _$actionInfo = _$_BlogPostListVievModelBaseActionController
        .startAction(name: '_BlogPostListVievModelBase.initViedModel');
    try {
      return super.initViedModel(context);
    } finally {
      _$_BlogPostListVievModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setFavorites(List<String> favoriteArticleIds) {
    final _$actionInfo = _$_BlogPostListVievModelBaseActionController
        .startAction(name: '_BlogPostListVievModelBase.setFavorites');
    try {
      return super.setFavorites(favoriteArticleIds);
    } finally {
      _$_BlogPostListVievModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  bool isFavorited(int index) {
    final _$actionInfo = _$_BlogPostListVievModelBaseActionController
        .startAction(name: '_BlogPostListVievModelBase.isFavorited');
    try {
      return super.isFavorited(index);
    } finally {
      _$_BlogPostListVievModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isInitialized: ${isInitialized},
blogPosts: ${blogPosts},
isInitted: ${isInitted},
favoritedBlogPosts: ${favoritedBlogPosts},
isBlogPostsEmpty: ${isBlogPostsEmpty},
isFavoritedBlogPostsEmpty: ${isFavoritedBlogPostsEmpty},
favoritedBlogPostCount: ${favoritedBlogPostCount}
    ''';
  }
}
