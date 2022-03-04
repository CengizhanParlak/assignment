import 'package:assignment/view/home/favorite/viewmodel/favorite_posts_view_model.dart';
import 'package:assignment/view/home/home_screen/view/article_screen_view.dart';
import 'package:assignment/view/home/home_screen/viewmodel/blog_post_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FavoritePostsViewModel viewModel = FavoritePostsViewModel();
    BlogPostViewModel blogPostViewModel = BlogPostViewModel();
    return Center(
      child: Observer(
        builder: (_) {
          if (viewModel.isFavoritesEmpty) {
            return const Card(
              child: Text(
                'No favorite posts',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          } else {
            print("değişti: dolu");
            return GridView.builder(
              // TODO: viewModel.blogPosts.length, keep alive yapılacak, önceki session'da son seçilen kategorideki blogları getir
              // itemCount: viewModel.blogPosts.length,
              itemCount: viewModel.favoritePosts.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: getSize(context).height * 0.4,
              ),
              itemBuilder: (context, index) => GestureDetector(
                onTap: () => Navigator.of(context).pushNamed(
                  ArticleScreen.routeName,
                  arguments: viewModel.blogPostAtIndex(index),
                ),
                child: Card(
                  child: Column(
                    children: [
                      Expanded(
                        flex: 5,
                        child: Stack(
                          children: [
                            Image.network(
                              viewModel.blogPostAtIndex(index).image!,
                              fit: BoxFit.fill,
                              // height: getSize(context).height * 0.2,
                            ),
                            Positioned(
                              top: 0,
                              right: 0,
                              child: IconButton(
                                icon: Observer(builder: (_) {
                                  return Icon(
                                    Icons.favorite,
                                    color: viewModel.blogPostAtIndex(index).isFavorited ? Colors.red : Colors.grey,
                                  );
                                }),
                                onPressed: () async {
                                  await blogPostViewModel.toggleFavorite(viewModel.blogPostAtIndex(index).id!, index);
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Text(
                          viewModel.blogPostAtIndex(index).title!,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }

  Size getSize(BuildContext context) => MediaQuery.of(context).size;
}
