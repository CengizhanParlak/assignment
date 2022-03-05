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
import 'package:assignment/view/home/profile/model/account.dart';
import 'package:assignment/view/home/profile/view/profile_screen_view.dart';
import 'package:assignment/view/home/profile/viewmodel/account_view_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:http/http.dart' as http;
import 'package:assignment/core/constants/api_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

import 'core/service/network_helper.dart';
import 'view/authenticate/login/view/login_screen_view.dart';
import 'view/authenticate/signup/view/signup_screen_view.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (defaultTargetPlatform == TargetPlatform.android) {
    AndroidGoogleMapsFlutter.useAndroidViewSurface = true;
  }
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
        Provider<AccountViewModel>(create: (_) => AccountViewModel()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => AuthScreen(),
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

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final vmLogin = Provider.of<LoginViewModel>(context);
    vmLogin.testConnection();
  }

  @override
  Widget build(BuildContext context) {
    final vmLogin = Provider.of<LoginViewModel>(context);
    return SafeArea(
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Center(
          child: Observer(
            builder: (_) {
              if (vmLogin.isLoading) {
                return const Center();
              } else {
                if (vmLogin.isLoggedIn) {
                  return const LandingView();
                } else {
                  return const LoginScreen();
                }
              }
            },
          ),
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

  late AccountViewModel _accountViewModel;
  late BlogPostListViewModel _blogPostListViewModel;
  late FavoritePostsViewModel _favoritePostsViewModel;
  late CategoryViewModel _categoryViewModel;

  void _changePage(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    _accountViewModel = Provider.of<AccountViewModel>(context);
    _blogPostListViewModel = Provider.of<BlogPostListViewModel>(context);
    _favoritePostsViewModel = Provider.of<FavoritePostsViewModel>(context);
    _categoryViewModel = Provider.of<CategoryViewModel>(context);
    await _accountViewModel.getAccountInfo(context);
    _categoryViewModel.fetchCategories();
    await _blogPostListViewModel.fetchBlogPosts();
    _blogPostListViewModel.setFavorites(_accountViewModel.getFavoriteBlogIds);

    _favoritePostsViewModel.addAllFavoritedPostsToFavorites(_blogPostListViewModel.favBlogPosts);
  }

  Widget get childWidget {
    switch (_selectedIndex) {
      case 0:
        return const FavoriteScreen();
      case 1:
        return const HomeScreen();
      case 2:
        return const ProfileScreen();
      // case 3:
      //   return const ApiTestScreen();
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
      // case 3:
      //   return const Text('Api Test');
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
              // const BottomNavigationBarItem(
              //   icon: Icon(Icons.text_snippet),
              //   label: 'Api Test',
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
