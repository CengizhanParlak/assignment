import 'package:assignment/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import '../../signup/view/signup_screen_view.dart';
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
        body: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Provider<LoginViewModel>(
            create: (_) => loginVM = Provider.of<LoginViewModel>(context),
            builder: (context, __) {
              loginVM = Provider.of<LoginViewModel>(context);
              return Form(
                key: formKeyLogIn,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Spacer(
                        flex: 2,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height * 0.2,
                          child: CircleAvatar(
                            backgroundColor: Colors.teal.shade300,
                            radius: 100,
                            child: Icon(
                              Icons.person,
                              size: MediaQuery.of(context).size.height * 0.15,
                              color: Colors.lightGreen.shade900,
                            ),
                          ),
                        ),
                      ),
                      const Spacer(
                        flex: 2,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.65,
                        child: Column(
                          children: <Widget>[
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.97,
                              child: TextFormField(
                                keyboardType: TextInputType.emailAddress,
                                controller: emailController,
                                onChanged: (value) {
                                  loginVM!.email = value;
                                },
                                validator: (value) {
                                  if (value != null) {
                                    if (value.isEmpty) {
                                      return 'Mail boş bırakılamaz';
                                    } else if (value.contains(" ")) {
                                      return 'Mail boşluk içeremez';
                                    } else if (!loginVM!.isEmailValid) {
                                      return 'Geçerli bir mail adresi giriniz';
                                    }
                                  }
                                },
                                decoration: InputDecoration(
                                  hintText: "E-posta adresinizi giriniz",
                                  border: const OutlineInputBorder(),
                                  labelText: 'E-posta',
                                  hintStyle: TextStyle(
                                    fontSize: MediaQuery.of(context).size.shortestSide * 0.045,
                                  ),
                                  labelStyle: TextStyle(
                                    fontSize: MediaQuery.of(context).size.shortestSide * 0.05,
                                  ),
                                ),
                                onEditingComplete: () => FocusScope.of(context).nextFocus(),
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.02,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.97,
                              child: TextFormField(
                                controller: passwordController,
                                obscureText: !loginVM!.isPasswordVisible,
                                onChanged: (value) {
                                  loginVM!.password = value;
                                },
                                decoration: InputDecoration(
                                  border: const OutlineInputBorder(),
                                  hintText: 'Şifrenizi giriniz',
                                  labelText: 'Şifre',
                                  hintStyle: TextStyle(
                                    fontSize: MediaQuery.of(context).size.shortestSide * 0.045,
                                  ),
                                  labelStyle: TextStyle(
                                    fontSize: MediaQuery.of(context).size.shortestSide * 0.05,
                                  ),
                                  suffixIcon: Observer(builder: (_) {
                                    return IconButton(
                                      onPressed: () => loginVM!.togglePasswordVisibility(),
                                      icon: Icon(
                                        !loginVM!.isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                                      ),
                                      splashColor: Colors.transparent,
                                    );
                                  }),
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Şifre boş bırakılamaz';
                                  }
                                  if (value.contains(' ')) {
                                    return 'Şifre boşluk içeremez';
                                  }
                                  if (!loginVM!.isPasswordValid) {
                                    return 'Şifre en az 6 karakter olmalıdır';
                                  }
                                  return null;
                                },
                                onEditingComplete: () => FocusScope.of(context).unfocus(),
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.015,
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.015,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                ElevatedButton(
                                  onPressed: () async {
                                    if (formKeyLogIn.currentState!.validate()) {
                                      await loginVM!.signIn(context);
                                    }
                                  },
                                  child: Text(
                                    'Giriş',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                      fontSize: MediaQuery.of(context).size.shortestSide * 0.075,
                                    ),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.teal.shade300,
                                    enableFeedback: false,
                                    shape: const StadiumBorder(),
                                    minimumSize: Size(MediaQuery.of(context).size.width * 0.4,
                                        MediaQuery.of(context).size.height * 0.05),
                                  ),
                                ),
                                ElevatedButton(
                                  child: Text(
                                    'Kayıt ol',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                      fontSize: MediaQuery.of(context).size.shortestSide * 0.075,
                                    ),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.indigo.shade600,
                                    enableFeedback: false,
                                    shape: const StadiumBorder(),
                                    minimumSize: Size(MediaQuery.of(context).size.width * 0.4,
                                        MediaQuery.of(context).size.height * 0.05),
                                  ),
                                  onPressed: () {
                                    emailController.clear();
                                    passwordController.clear();
                                    loginVM!.clearFieldValues();
                                    FocusScope.of(context).unfocus();
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => const SignUpScreen()),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
