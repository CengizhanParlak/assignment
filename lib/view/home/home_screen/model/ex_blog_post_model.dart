import 'package:assignment/core/constants/api_constants.dart';
import 'package:assignment/view/home/home_screen/service/home_screen_network_service.dart';
import 'package:mobx/mobx.dart';
import 'blog_post_model.dart';

part 'ex_blog_post_model.g.dart';

class ExBlogPost extends _ExBlogPost with _$ExBlogPost {
  ExBlogPost(BlogPost blogPost) : super(blogPost);
}

late final networkService = HomeScreenNetworkService();

abstract class _ExBlogPost extends BlogPost with Store {
  _ExBlogPost(BlogPost blogPost)
      : super(
          categoryId: blogPost.categoryId,
          content: blogPost.content,
          id: blogPost.id,
          image: blogPost.image,
          title: blogPost.title,
          isFavorited: blogPost.isFavorited,
        );

  @observable
  bool isFavorite = false;

  @action
  void toggleFavorite(String articleId) {
    networkService.toggleFavoritePOST(ApiConstants.TEST_TOKEN, articleId: articleId).then((value) {
      if (value == 1) {
        isFavorite = true;
      } else if (value == 0) {
        isFavorite = false;
      }
    });
  }
}
