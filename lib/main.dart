import 'package:assignment/view/authenticate/login/model/user_model.dart';
import 'package:assignment/view/authenticate/login/service/user_repository.dart';
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
        '/article': (context) => const ArticleScreen(),
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
              child: Text(
                'Register',
                style: TextStyle(
                  color: Colors.grey.shade900,
                ),
              ),
            ),
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.white,
              ),
              onPressed: (() => Navigator.of(context).pushNamed('/login')),
              child: const Text(
                'Login',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Flexible(
            flex: 2,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: const [
                  Card(
                    child: Placeholder(
                      fallbackWidth: 200,
                      fallbackHeight: 40,
                      color: Colors.blue,
                    ),
                  ),
                  Card(
                    child: Placeholder(
                      fallbackWidth: 200,
                      fallbackHeight: 40,
                      color: Colors.blue,
                    ),
                  ),
                  Card(
                    child: Placeholder(
                      fallbackWidth: 200,
                      fallbackHeight: 40,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Text('Blog'),
          Expanded(
            flex: 8,
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
          ),
        ],
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
  int _selectedIndex = 0;

  void _changePage(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget get childWidget {
    switch (_selectedIndex) {
      case 0:
        return const FavoriteScreen();
      case 1:
        return const HomeScreen();
      case 2:
        return const ProfileScreen();
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
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite),
                label: 'Favorite',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ArticleScreen extends StatelessWidget {
  const ArticleScreen({Key? key}) : super(key: key);

  void addFavorite(int id) {
    // TODO: add to favorite
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Article Detail'),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: (() => addFavorite),
              icon: const Icon(Icons.favorite),
            ),
          ],
        ),
        body: const Placeholder(
          fallbackHeight: 100,
          color: Colors.blue,
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

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: Column(
          children: [
            Container(
              decoration: _getDecoration(context, 100, Colors.white),
              height: 150,
              width: 150,
            ),
            const SizedBox(
              height: 40,
            ),
            Container(
              height: 200,
              width: 350,
              decoration: _getDecoration(context, 25, Colors.white),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 65,
              width: 350,
              decoration: _getDecoration(context, 15, Colors.white),
              child: TextButton(
                onPressed: (() {
                  // TODO: api isteği at
                }),
                child: Text(
                  'Save',
                  style: TextStyle(
                    color: Colors.grey.shade900,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 65,
              width: 350,
              decoration: _getDecoration(context, 15, Colors.grey.shade900),
              child: TextButton(
                onPressed: (() {
                  Navigator.of(context).pushNamed('/login');
                  // TODO: çıkış yap
                }),
                child: const Text(
                  'Log Out',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  BoxDecoration _getDecoration(BuildContext context, double radius, Color color) {
    return BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(radius),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.shade200,
          blurRadius: 10,
          spreadRadius: 5,
        ),
      ],
      border: Border.all(
        color: Colors.grey.shade900,
        width: 1,
      ),
    );
  }
}
