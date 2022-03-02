import 'package:assignment/core/constants/api_constants.dart';
import 'package:assignment/view/home/home_screen/model/blog_post_model.dart';
import 'package:assignment/view/home/home_screen/model/category_model.dart';
import 'package:assignment/view/home/home_screen/model/ex_blog_post_model.dart';
import 'package:assignment/view/home/home_screen/service/network_request.dart';
import 'package:assignment/view/home/home_screen/viewmodel/blog_post_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  Size getSize(BuildContext context) {
    return MediaQuery.of(context).size;
  }

  @override
  Widget build(BuildContext context) {
    BlogPostViewModel vm = BlogPostViewModel();
    return Center(
      child: Column(
        children: [
          Flexible(
            flex: 2,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: FutureBuilder<List<Category>>(
                future: getCategoriesGET(ApiConstants.TEST_TOKEN),
                builder: ((_, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasData && snapshot.data.isNotEmpty) {
                      List<Category> categories = snapshot.data;
                      return Row(
                        children: [
                          for (var category in categories) ...{
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Card(
                                    child: Image.network(
                                      category.image!,
                                      fit: BoxFit.fill,
                                      width: getSize(context).width * 0.45,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Text(category.title!),
                                ),
                              ],
                            )
                          }
                        ],
                      );
                    }
                    if (snapshot.hasError) {
                      return const Center(
                        child: Text('Error while fetching Data from API'),
                      );
                    }
                    return const Center(
                      child: Text('No Data'),
                    );
                  }
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text('Blog'),
          Expanded(
            flex: 8,
            child: FutureBuilder<List<ExBlogPost>>(
              future: getBlogPostsPOST(
                  "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySUQiOiI2MjFmOWMxOWIwN2QxZTEzOWFmNWI0ZDAiLCJuYmYiOjE2NDYyMzg3NDUsImV4cCI6MTY0ODgzMDc0NSwiaXNzIjoiaSIsImF1ZCI6ImEifQ.jEXOhFRqGYB50SYigh5fzsSpFJVWY88VeabkKojRmOI"),
              builder: ((BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasData && snapshot.data.isNotEmpty) {
                    List<ExBlogPost> blogs = snapshot.data;
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
                                      blogs.elementAt(index).image!,
                                      fit: BoxFit.fill,
                                      // height: getSize(context).height * 0.2,
                                    ),
                                    Positioned(
                                      top: 0,
                                      right: 0,
                                      child: IconButton(
                                        icon: Observer(
                                          builder: (_) => Icon(
                                            Icons.favorite,
                                            color: blogs.elementAt(index).isFavorite ? Colors.red : Colors.grey,
                                          ),
                                        ),
                                        onPressed: () {
                                          // TODO: implement favorite
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Text(blogs.elementAt(index).title!),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  }
                  if (snapshot.hasError) {
                    return const Center(
                      child: Text('Error while fetching Data from API'),
                    );
                  }
                  return const Center(
                    child: Text('No Data'),
                  );
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
