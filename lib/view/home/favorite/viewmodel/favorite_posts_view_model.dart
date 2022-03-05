import 'package:assignment/view/home/favorite/model/favorite_posts.dart';
import 'package:assignment/view/home/home_screen/model/blog_post_model.dart';
import 'package:mobx/mobx.dart';
part 'favorite_posts_view_model.g.dart';

class FavoritePostsViewModel = _FavoritePostsViewModel with _$FavoritePostsViewModel;

abstract class _FavoritePostsViewModel with Store {
  @observable
  ObservableList<FavoritePost> favoritePosts = <FavoritePost>[].asObservable();

  BlogPost blogPostAtIndex(int index) => favoritePosts.elementAt(index).blogPost;

  @computed
  bool get isFavoritesEmpty => favoritePosts.isEmpty;

  @action
  void removeFromFavorite(String id) {
    favoritePosts.removeWhere((element) => element.blogPost.id == id);
  }

  @action
  void addAllFavoritedPostsToFavorites(List<BlogPost> favoritePosts) {
    this.favoritePosts.addAll(favoritePosts.map((element) => FavoritePost(blogPost: element)).toList());
  }

  @action
  void addToFavorite(FavoritePost favoritePost) {
    favoritePosts.add(favoritePost);
  }

  @computed
  int get favoritePostsCount => favoritePosts.length;
}
