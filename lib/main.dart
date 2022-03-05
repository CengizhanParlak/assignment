import 'dart:convert';
import 'dart:ffi';

import 'package:assignment/api_test.dart';
import 'package:assignment/core/base/model/base_api_model.dart';
import 'package:assignment/view/authenticate/login/model/login_model.dart';
import 'package:assignment/view/authenticate/login/viewmodel/login_view_model.dart';
import 'package:assignment/view/authenticate/signup/viewmodel/signup_view_model.dart';
import 'package:assignment/view/home/favorite/view/favorite_post_screen_view.dart';
import 'package:assignment/view/home/favorite/viewmodel/favorite_posts_view_model.dart';
import 'package:assignment/view/home/home_screen/model/blog_post_model.dart';
import 'package:assignment/view/home/home_screen/model/category_model.dart';
import 'package:assignment/view/home/home_screen/service/blog_network_service.dart';
import 'package:assignment/view/home/home_screen/view/article_screen_view.dart';
import 'package:assignment/view/home/home_screen/view/blog_post_screen_view.dart';
import 'package:assignment/view/home/home_screen/viewmodel/blog_post_view_model.dart';
import 'package:assignment/view/home/home_screen/viewmodel/category_view_model.dart';
import 'package:assignment/view/home/profile/view/account_view.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:http/http.dart' as http;
import 'package:assignment/core/constants/api_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

import 'view/authenticate/login/view/login_screen_view.dart';
import 'view/authenticate/signup/view/signup_screen_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<BlogPostListViewModel>(create: (_) => BlogPostListViewModel()),
        Provider<CategoryViewModel>(create: (_) => CategoryViewModel()),
        Provider<BlogPost>(create: (_) => BlogPost.fromJson({})),
        Provider<FavoritePostsViewModel>(create: (_) => FavoritePostsViewModel()),
        Provider<LoginViewModel>(create: (_) => LoginViewModel()),
        Provider<SignUpViewModel>(create: (_) => SignUpViewModel()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => const AuthScreen(),
          '/login': (context) => const LoginScreen(),
          '/signup': (context) => const SignUpScreen(),
          '/landing': (context) => const LandingView(),
          '/home': (context) => const HomeScreen(),
          ArticleScreen.routeName: (context) => const ArticleScreen(),
          '/favorite': (context) => const FavoriteScreen(),
          '/profile': (context) => const ProfileScreen(),
        },
        title: 'Blog It',
        theme: ThemeData.light(),
      ),
    );
  }
}

class AuthScreen extends StatelessWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final vmLogin = Provider.of<LoginViewModel>(context);
    return SafeArea(
      child: Center(
        child: Observer(
          builder: (_) {
            if (vmLogin.isLoggedIn) {
              return const LandingView();
            } else {
              return const LoginScreen();
            }
          },
        ),
      ),
    );
  }
}

class LandingView extends StatefulWidget {
  const LandingView({Key? key}) : super(key: key);

  @override
  State<LandingView> createState() => _LandingViewState();
}

class _LandingViewState extends State<LandingView> {
  int _selectedIndex = 1;

  void _changePage(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  Widget get childWidget {
    switch (_selectedIndex) {
      case 0:
        return const FavoriteScreen();
      case 1:
        return const HomeScreen();
      case 2:
        return const ProfileScreen();
      case 3:
        return const ApiTestScreen();
      default:
        return const HomeScreen();
    }
  }

  Text get title {
    switch (_selectedIndex) {
      case 0:
        return const Text('Favorite');
      case 1:
        return const Text('Home');
      case 2:
        return const Text('My Profile');
      case 3:
        return const Text('Api Test');
      default:
        return const Text('Home');
    }
  }

  @override
  Widget build(BuildContext context) {
    final blogPostListVM = Provider.of<BlogPostListViewModel>(context);
    blogPostListVM.initViedModel(context);
    final favoritePostsVM = Provider.of<FavoritePostsViewModel>(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.search),
            // onPressed: (() => Navigator.of(context).pushNamed('/article')),
            onPressed: (() => {}),
          ),
          title: title,
          centerTitle: true,
        ),
        body: childWidget,
        bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
          ),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            unselectedItemColor: Colors.grey.shade400,
            selectedItemColor: Colors.grey.shade900,
            currentIndex: _selectedIndex,
            onTap: _changePage,
            items: [
              BottomNavigationBarItem(
                icon: Stack(
                  children: <Widget>[
                    const Icon(Icons.notifications),
                    Positioned(
                      right: 0,
                      child: Container(
                        padding: const EdgeInsets.all(1),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        constraints: const BoxConstraints(
                          minWidth: 12,
                          minHeight: 12,
                        ),
                        child: Observer(builder: (_) {
                          return Text(
                            '${favoritePostsVM.favoritePostsCount}',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 8,
                            ),
                            textAlign: TextAlign.center,
                          );
                        }),
                      ),
                    )
                  ],
                ),
                label: 'Favorite',
              ),
              const BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              const BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
              ),
              const BottomNavigationBarItem(
                icon: Icon(Icons.text_snippet),
                label: 'Api Test',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
