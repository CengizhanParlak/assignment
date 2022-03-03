import 'package:assignment/core/constants/api_constants.dart';
import 'package:assignment/view/home/home_screen/model/blog_post_model.dart';
import 'package:assignment/view/home/home_screen/model/category_model.dart';
import 'package:assignment/view/home/home_screen/service/home_screen_network_service.dart';
import 'package:assignment/view/home/home_screen/viewmodel/blog_post_view_model.dart';
import 'package:assignment/view/home/home_screen/viewmodel/category_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

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
          categoryHorizontalScrollView(vmCategory, context),
          const SizedBox(
            height: 20,
          ),
          const Text('Blog'),
          blogPostGridView(vmBlogPost, context),
        ],
      ),
    );
  }

  Flexible categoryHorizontalScrollView(CategoryViewModel vmCategory, BuildContext context) {
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
                ...categoryCard(vmCategory.categories!, context),
              ],
            );
          }
        }),
      ),
    );
  }

  List<Column> categoryCard(List<Category> categories, BuildContext context) {
    var x = categories.map((category) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Card(
              child: Image.network(
                category.image!,
                fit: BoxFit.fill,
                width: getSize(context).width * 0.40,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(category.title!),
          ),
        ],
      );
    }).toList();
    return x;
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
            itemCount: 10, // TODO: blogs.length
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, mainAxisExtent: getSize(context).height * 0.4
                // crossAxisSpacing: 4.0,
                // mainAxisSpacing: 4.0,
                ),
            itemBuilder: (context, index) => GestureDetector(
              onTap: () => Navigator.of(context).pushNamed('/article'),
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
                              onPressed: () {
                                print(vmBlogPost.blogPosts.elementAt(index).isFavorited);
                                vmBlogPost.blogPosts.elementAt(index).isFavorited =
                                    !vmBlogPost.blogPosts.elementAt(index).isFavorited;
                                // TODO: implement favorite
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
