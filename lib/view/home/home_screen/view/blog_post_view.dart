import 'package:assignment/core/constants/api_constants.dart';
import 'package:assignment/view/home/home_screen/model/blog_post_model.dart';
import 'package:assignment/view/home/home_screen/model/category_model.dart';
import 'package:assignment/view/home/home_screen/service/home_screen_network_service.dart';
import 'package:assignment/view/home/home_screen/view/article_screen_view.dart';
import 'package:assignment/view/home/home_screen/viewmodel/blog_post_view_model.dart';
import 'package:assignment/view/home/home_screen/viewmodel/category_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:collection/collection.dart';

Size getSize(BuildContext context) {
  return MediaQuery.of(context).size;
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlogPostViewModel vmBlogPost = BlogPostViewModel();
    CategoryViewModel vmCategory = CategoryViewModel();
    vmCategory.fetchCategories();
    vmBlogPost.fetchBlogPosts();
    return Center(
      child: Column(
        children: [
          categoryHorizontalScrollView(vmBlogPost, vmCategory, context),
          const SizedBox(
            height: 20,
          ),
          const Text('Blog'),
          blogPostGridView(vmBlogPost, context),
        ],
      ),
    );
  }

  Flexible categoryHorizontalScrollView(
      BlogPostViewModel vmBlogPost, CategoryViewModel vmCategory, BuildContext context) {
    return Flexible(
      flex: 2,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Observer(builder: (_) {
          if (!vmCategory.isCategoriesLoaded) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (vmCategory.isCategoriesEmpty) {
            return const Text("No data returned from API");
          } else {
            return Row(
              children: [
                ...categoryCard(vmBlogPost, vmCategory, context),
              ],
            );
          }
        }),
      ),
    );
  }

  List<GestureDetector> categoryCard(BlogPostViewModel vmBlogPost, CategoryViewModel vmCategory, BuildContext context) {
    int index = 0;
    var categoryWidgets = vmCategory.categories!.mapIndexed((index, category) {
      return GestureDetector(
        onTap: () {
          if (vmCategory.selectedCategoryIndex == index) {
            vmBlogPost.fetchBlogPosts();
            vmCategory.selectedCategoryIndex = -1;
          } else {
            vmBlogPost.fetchBlogPosts(categoryId: category.id!);
            vmCategory.selectedCategoryIndex = index;
          }
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Stack(
                children: [
                  Card(
                    child: Image.network(
                      category.image!,
                      fit: BoxFit.fill,
                      width: getSize(context).width * 0.40,
                    ),
                  ),
                  Positioned(
                    top: 0,
                    right: 0,
                    child: Icon(
                      Icons.bookmark,
                      color: vmCategory.selectedCategoryIndex == index ? Colors.white : Colors.grey.shade900,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(category.title!),
            ),
          ],
        ),
      );
    }).toList();
    return categoryWidgets;
  }
}

Expanded blogPostGridView(BlogPostViewModel vmBlogPost, BuildContext context) {
  return Expanded(
    flex: 8,
    child: Observer(
      builder: (_) {
        if (vmBlogPost.isBlogPostsEmpty) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return GridView.builder(
            // TODO: vmBlogPost.blogPosts.length, keep alive yapılacak, önceki session'da son seçilen kategorideki blogları getir
            // itemCount: vmBlogPost.blogPosts.length,
            itemCount: vmBlogPost.blogPosts.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisExtent: getSize(context).height * 0.4,
            ),
            itemBuilder: (context, index) => GestureDetector(
              onTap: () => Navigator.of(context).pushNamed(
                ArticleScreen.routeName,
                arguments: vmBlogPost.blogPosts[index],
              ),
              child: Card(
                child: Column(
                  children: [
                    Expanded(
                      flex: 5,
                      child: Stack(
                        children: [
                          Image.network(
                            vmBlogPost.blogPosts.elementAt(index).image!,
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
                                  color: vmBlogPost.blogPosts.elementAt(index).isFavorited ? Colors.red : Colors.grey,
                                );
                              }),
                              onPressed: () async {
                                await vmBlogPost.toggleFavorite(vmBlogPost.getPostAtIndex(index).id!, index);
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text(vmBlogPost.blogPosts.elementAt(index).title!),
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
