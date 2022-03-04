import 'dart:convert';

import 'package:assignment/core/constants/api_constants.dart';
import 'package:assignment/view/home/home_screen/model/blog_post_model.dart';
import 'package:assignment/view/home/home_screen/service/home_screen_network_service.dart';
import 'package:flutter/services.dart';
import 'package:mobx/mobx.dart';

part 'blog_post_view_model.g.dart';

class BlogPostViewModel = _BlogPostViewModel with _$BlogPostViewModel;

abstract class _BlogPostViewModel with Store {
  final HomeScreenNetworkService networkService = HomeScreenNetworkService();

  BlogPost getPostAtIndex(int index) => blogPosts[index];

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
      blogPosts.elementAt(index).isFavorited = true;
    } else if (value == 0) {
      blogPosts.elementAt(index).isFavorited = false;
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
