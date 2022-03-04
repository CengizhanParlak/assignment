import 'package:assignment/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import '../viewmodel/login_view_model.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKeyLogIn = GlobalKey<FormState>();
  LoginViewModel? loginVM;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
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
            Provider<LoginViewModel>(
              create: (_) {
                return loginVM = Provider.of<LoginViewModel>(context);
              },
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.grey.shade900,
                ),
                onPressed: (() {
                  //TODO: apiye gönderilen şfire maile uygun cevap döndü mü kontrolü yap
                  bool girdiMiKontrolu = true;
                  if (girdiMiKontrolu) {
                    loginVM?.isLogged = true;
                    Navigator.pushReplacementNamed(context, '/landing');
                  }
                }),
                child: const Text(
                  'Login',
                  style: TextStyle(
                    color: Colors.white,
                  ),
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
