// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blog_post_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$BlogPostViewModel on _BlogPostViewModel, Store {
  Computed<List<ExBlogPost>>? _$favoritedBlogPostsComputed;

  @override
  List<ExBlogPost> get favoritedBlogPosts => (_$favoritedBlogPostsComputed ??=
          Computed<List<ExBlogPost>>(() => super.favoritedBlogPosts,
              name: '_BlogPostViewModel.favoritedBlogPosts'))
      .value;
  Computed<bool>? _$isFavoritedBlogPostsEmptyComputed;

  @override
  bool get isFavoritedBlogPostsEmpty => (_$isFavoritedBlogPostsEmptyComputed ??=
          Computed<bool>(() => super.isFavoritedBlogPostsEmpty,
              name: '_BlogPostViewModel.isFavoritedBlogPostsEmpty'))
      .value;

  final _$blogPostsAtom = Atom(name: '_BlogPostViewModel.blogPosts');

  @override
  ObservableList<ExBlogPost> get blogPosts {
    _$blogPostsAtom.reportRead();
    return super.blogPosts;
  }

  @override
  set blogPosts(ObservableList<ExBlogPost> value) {
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

  @override
  String toString() {
    return '''
blogPosts: ${blogPosts},
favoritedBlogPosts: ${favoritedBlogPosts},
isFavoritedBlogPostsEmpty: ${isFavoritedBlogPostsEmpty}
    ''';
  }
}
