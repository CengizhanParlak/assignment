import 'dart:convert';
import 'dart:ffi';

import 'package:assignment/api_test.dart';
import 'package:assignment/core/base/model/base_api_model.dart';
import 'package:assignment/view/authenticate/login/model/user_model.dart';
import 'package:assignment/view/home/home_screen/model/blog_post_model.dart';
import 'package:assignment/view/home/home_screen/model/category_model.dart';
import 'package:assignment/view/home/home_screen/service/home_screen_network_service.dart';
import 'package:assignment/view/home/home_screen/view/article_screen_view.dart';
import 'package:assignment/view/home/home_screen/view/blog_post_view.dart';
import 'package:assignment/view/home/home_screen/viewmodel/blog_post_view_model.dart';
import 'package:assignment/view/home/profile/view/account_view.dart';
import 'package:http/http.dart' as http;
import 'package:assignment/view/authenticate/login/service/user_repository.dart';
import 'package:assignment/core/constants/api_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      debugShowCheckedModeBanner: false,
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
    );
  }
}

class AuthScreen extends StatelessWidget {
  const AuthScreen({Key? key, this.isAuth = true}) : super(key: key);
  final bool isAuth;
  @override
  Widget build(BuildContext context) {
    if (isAuth) {
      return const LandingView();
    }
    return const LoginScreen();
  }
}

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key, User? user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text('Login'),
          centerTitle: true,
        ),
        body: Column(
          children: [
            const Placeholder(
              fallbackHeight: 100,
              color: Colors.blue,
            ),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Email',
              ),
            ),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Password',
              ),
            ),
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.grey.shade900,
              ),
              onPressed: (() => Navigator.of(context).pushNamed('/landing')),
              child: const Text(
                'Login',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.white,
              ),
              onPressed: (() => Navigator.of(context).pushNamed('/signup')),
              child: Text(
                'Register',
                style: TextStyle(
                  color: Colors.grey.shade900,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key, User? user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Register'),
          centerTitle: true,
        ),
        body: Column(
          children: [
            const Placeholder(
              fallbackHeight: 100,
              color: Colors.blue,
            ),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Email',
              ),
            ),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Password',
              ),
            ),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Re-Password',
              ),
            ),
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.grey.shade900,
              ),
              onPressed: (() => Navigator.of(context).pushNamed('/login')),
              child: const Text(
                'Register',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.white,
              ),
              onPressed: (() => Navigator.of(context).pushNamed('/login')),
              child: Text(
                'Login',
                style: TextStyle(
                  color: Colors.grey.shade900,
                ),
              ),
            ),
          ],
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

  BlogPostViewModel? vmBlogPost;

  void _changePage(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    vmBlogPost = BlogPostViewModel();
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
                        child: Text(
                          '${vmBlogPost?.favoritedBlogPostCount ?? 0}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 8,
                          ),
                          textAlign: TextAlign.center,
                        ),
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

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GridView.builder(
        itemCount: 10,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 4.0,
          mainAxisSpacing: 4.0,
        ),
        itemBuilder: (context, index) => GestureDetector(
          onTap: () => Navigator.of(context).pushNamed('/article'),
          child: const Card(
            child: Placeholder(
              fallbackHeight: 100,
              color: Colors.blue,
            ),
          ),
        ),
      ),
    );
  }
}
