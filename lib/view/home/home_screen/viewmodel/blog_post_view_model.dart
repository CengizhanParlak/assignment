import 'dart:convert';

import 'package:assignment/core/constants/api_constants.dart';
import 'package:assignment/view/home/home_screen/model/blog_post_model.dart';
import 'package:assignment/view/home/home_screen/model/ex_blog_post_model.dart';
import 'package:assignment/view/home/home_screen/service/home_screen_network_service.dart';
import 'package:flutter/services.dart';
import 'package:mobx/mobx.dart';

part 'blog_post_view_model.g.dart';

class BlogPostViewModel = _BlogPostViewModel with _$BlogPostViewModel;

late final HomeScreenNetworkService networkService = HomeScreenNetworkService();

abstract class _BlogPostViewModel with Store {
  @observable
  ObservableList<ExBlogPost> blogPosts = <ExBlogPost>[].asObservable();

  @computed
  List<ExBlogPost> get favoritedBlogPosts => blogPosts.where((blogPost) => blogPost.isFavorite).toList();

  @computed
  bool get isBlogPostsEmpty => blogPosts.isEmpty;

  @computed
  bool get isFavoritedBlogPostsEmpty => favoritedBlogPosts.isEmpty;

  @action
  Future<void> fetchBlogPosts() async {
    var exBlogPosts = await networkService.getBlogPostsPOST(ApiConstants.TEST_TOKEN);
    // blogPosts.addAll(decodedJson.map((e) => ExBlogPost(BlogPost.fromJson(e))).toList().asObservable());
    blogPosts.addAll(exBlogPosts!.toList().asObservable());
  }
}
