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

  @observable
  ObservableList<BlogPost> blogPosts = <BlogPost>[].asObservable();

  @computed
  List<BlogPost> get favoritedBlogPosts => blogPosts.where((blogPost) => blogPost.isFavorited).toList();

  @computed
  bool get isBlogPostsEmpty => blogPosts.isEmpty;

  @computed
  bool get isFavoritedBlogPostsEmpty => favoritedBlogPosts.isEmpty;

  @computed
  int get favoritedBlogPostCount => blogPosts.where((element) => element.isFavorited).length;

  @action
  void toggleFavorite(String articleId, int index) {
    networkService.toggleFavoritePOST(ApiConstants.TEST_TOKEN, articleId: articleId).then((value) {
      if (value == 1) {
        blogPosts.elementAt(index).isFavorited = true;
      } else if (value == 0) {
        blogPosts.elementAt(index).isFavorited = false;
      }
    });
  }

  @action
  Future<void> fetchBlogPosts() async {
    var exBlogPosts = await networkService.getBlogPostsPOST(ApiConstants.TEST_TOKEN);
    // blogPosts.addAll(decodedJson.map((e) => ExBlogPost(BlogPost.fromJson(e))).toList().asObservable());
    blogPosts.addAll(exBlogPosts!.toList().asObservable());
  }
}
