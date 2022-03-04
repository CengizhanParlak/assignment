import 'dart:convert';

import 'package:assignment/core/constants/api_constants.dart';
import 'package:assignment/view/home/favorite/model/favorite_posts.dart';
import 'package:assignment/view/home/favorite/viewmodel/favorite_posts_view_model.dart';
import 'package:assignment/view/home/home_screen/model/blog_post_model.dart';
import 'package:assignment/view/home/home_screen/service/blog_network_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

part 'blog_post_view_model.g.dart';

class BlogPostListViewModel = _BlogPostListVievModelBase with _$BlogPostListViewModel;

abstract class _BlogPostListVievModelBase with Store {
  final BlogNetworkService networkService = BlogNetworkService();

  FavoritePostsViewModel? favoritePostsViewModel;

  @observable
  bool isInitialized = false;

  @action
  void initViedModel(BuildContext context) {
    favoritePostsViewModel = Provider.of<FavoritePostsViewModel>(context);
    debugPrint("viewModel initted -- dependency injection");
    isInitialized = true;
  }

  @computed
  bool get isInitted => isInitialized;

  BlogPost getPostAtIndex(int index) => blogPosts[index];

  int getIndexOfPostFromId(String id) => blogPosts.indexWhere((post) => post.id == id);

  @observable
  ObservableList<BlogPost> blogPosts = <BlogPost>[].asObservable();

  @computed
  List<BlogPost> get favoritedBlogPosts => blogPosts.where((blogPost) => blogPost.isFavorited).toList();

  @computed
  bool get isBlogPostsEmpty => blogPosts.isEmpty;

  @computed
  bool get isFavoritedBlogPostsEmpty => favoritedBlogPosts.isEmpty;

  @action
  bool isFavorited(int index) {
    return blogPosts[index].isFavorited;
  }

  @computed
  int get favoritedBlogPostCount => blogPosts.where((element) => element.isFavorited).length;

  @action
  Future<void> toggleFavorite(String articleId, int index) async {
    int value = await networkService.toggleFavoritePOST(ApiConstants.TEST_TOKEN, articleId: articleId);
    if (value == 1) {
      // FIX: Article sayfası açılınca blog postlar siliniyor.
      if (blogPosts.isNotEmpty && blogPosts.length >= index) {
        favoritePostsViewModel?.addToFavorite(FavoritePost(blogPost: blogPosts[index]));
        blogPosts.elementAt(index).isFavorited = true;
      }
    } else if (value == 0) {
      if (blogPosts.isNotEmpty && blogPosts.length >= index) {
        favoritePostsViewModel?.removeFromFavorite(
          articleId,
        );
        blogPosts.elementAt(index).isFavorited = false;
      }
    }
  }

  @action
  Future<void> fetchBlogPosts({String categoryId = ""}) async {
    var exBlogPosts = await networkService.getBlogPostsPOST(ApiConstants.TEST_TOKEN, categoryId: categoryId);
    // blogPosts.addAll(decodedJson.map((e) => ExBlogPost(BlogPost.fromJson(e))).toList().asObservable());
    if (categoryId.isEmpty) {
      blogPosts.clear();
      blogPosts.addAll(exBlogPosts!.toList().asObservable());
    } else {
      blogPosts.clear();
      blogPosts.addAll(exBlogPosts!.toList().asObservable());
    }
  }
}
