// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blog_post_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$BlogPostViewModel on _BlogPostViewModel, Store {
  Computed<List<BlogPost>>? _$favoritedBlogPostsComputed;

  @override
  List<BlogPost> get favoritedBlogPosts => (_$favoritedBlogPostsComputed ??=
          Computed<List<BlogPost>>(() => super.favoritedBlogPosts,
              name: '_BlogPostViewModel.favoritedBlogPosts'))
      .value;
  Computed<bool>? _$isBlogPostsEmptyComputed;

  @override
  bool get isBlogPostsEmpty => (_$isBlogPostsEmptyComputed ??= Computed<bool>(
          () => super.isBlogPostsEmpty,
          name: '_BlogPostViewModel.isBlogPostsEmpty'))
      .value;
  Computed<bool>? _$isFavoritedBlogPostsEmptyComputed;

  @override
  bool get isFavoritedBlogPostsEmpty => (_$isFavoritedBlogPostsEmptyComputed ??=
          Computed<bool>(() => super.isFavoritedBlogPostsEmpty,
              name: '_BlogPostViewModel.isFavoritedBlogPostsEmpty'))
      .value;
  Computed<int>? _$favoritedBlogPostCountComputed;

  @override
  int get favoritedBlogPostCount => (_$favoritedBlogPostCountComputed ??=
          Computed<int>(() => super.favoritedBlogPostCount,
              name: '_BlogPostViewModel.favoritedBlogPostCount'))
      .value;

  final _$blogPostsAtom = Atom(name: '_BlogPostViewModel.blogPosts');

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

  final _$fetchBlogPostsAsyncAction =
      AsyncAction('_BlogPostViewModel.fetchBlogPosts');

  @override
  Future<void> fetchBlogPosts() {
    return _$fetchBlogPostsAsyncAction.run(() => super.fetchBlogPosts());
  }

  final _$_BlogPostViewModelActionController =
      ActionController(name: '_BlogPostViewModel');

  @override
  void toggleFavorite(String articleId, int index) {
    final _$actionInfo = _$_BlogPostViewModelActionController.startAction(
        name: '_BlogPostViewModel.toggleFavorite');
    try {
      return super.toggleFavorite(articleId, index);
    } finally {
      _$_BlogPostViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
blogPosts: ${blogPosts},
favoritedBlogPosts: ${favoritedBlogPosts},
isBlogPostsEmpty: ${isBlogPostsEmpty},
isFavoritedBlogPostsEmpty: ${isFavoritedBlogPostsEmpty},
favoritedBlogPostCount: ${favoritedBlogPostCount}
    ''';
  }
}
