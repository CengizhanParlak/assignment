import 'package:assignment/view/authenticate/login/viewmodel/login_view_model.dart';
import 'package:assignment/view/authenticate/signup/viewmodel/signup_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  SignUpViewModel? signUpViewModel;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordRetryController = TextEditingController();
  GlobalKey<FormState> formKeyCreate = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text('Register'),
          centerTitle: true,
        ),
        body: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Provider<SignUpViewModel>(
            create: (_) => signUpViewModel = Provider.of<SignUpViewModel>(context),
            builder: (context, __) {
              signUpViewModel = Provider.of<SignUpViewModel>(context);
              return Form(
                key: formKeyCreate,
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
                              child: Observer(builder: (_) {
                                return TextFormField(
                                  keyboardType: TextInputType.emailAddress,
                                  controller: emailController,
                                  onChanged: (value) {
                                    signUpViewModel!.email = value;
                                  },
                                  validator: (value) {
                                    if (value != null) {
                                      if (value.isEmpty) {
                                        return 'Mail boş bırakılamaz';
                                      } else if (value.contains(" ")) {
                                        return 'Mail boşluk içeremez';
                                      } else if (!signUpViewModel!.isEmailValid) {
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
                                );
                              }),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.02,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.97,
                              child: Observer(builder: (_) {
                                return TextFormField(
                                  controller: passwordController,
                                  obscureText: !signUpViewModel!.isPasswordVisible,
                                  onChanged: (value) {
                                    signUpViewModel!.password = value;
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
                                        onPressed: () => signUpViewModel!.togglePasswordVisibility(),
                                        icon: Icon(
                                          !signUpViewModel!.isPasswordVisible ? Icons.visibility : Icons.visibility_off,
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
                                    if (!signUpViewModel!.isPasswordValid) {
                                      return 'Şifre en az 6 karakter olmalıdır';
                                    }
                                    if (!signUpViewModel!.isPasswordsEqual) {
                                      return 'Şifreler eşleşmeli';
                                    }
                                    return null;
                                  },
                                  onEditingComplete: () => FocusScope.of(context).unfocus(),
                                );
                              }),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.015,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.97,
                              child: Observer(builder: (_) {
                                return TextFormField(
                                  controller: passwordRetryController,
                                  obscureText: !signUpViewModel!.isPasswordRetryVisible,
                                  onChanged: (value) {
                                    signUpViewModel!.passwordRetry = value;
                                  },
                                  decoration: InputDecoration(
                                    border: const OutlineInputBorder(),
                                    hintText: 'Şifrenizi tekrar giriniz',
                                    labelText: 'Şifre Tekrar',
                                    hintStyle: TextStyle(
                                      fontSize: MediaQuery.of(context).size.shortestSide * 0.045,
                                    ),
                                    labelStyle: TextStyle(
                                      fontSize: MediaQuery.of(context).size.shortestSide * 0.05,
                                    ),
                                    suffixIcon: Observer(builder: (_) {
                                      return IconButton(
                                        onPressed: () => signUpViewModel!.togglePasswordRetryVisibility(),
                                        icon: Icon(
                                          !signUpViewModel!.isPasswordRetryVisible
                                              ? Icons.visibility
                                              : Icons.visibility_off,
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
                                    if (!signUpViewModel!.isPasswordRetryValid) {
                                      return 'Şifre en az 6 karakter olmalıdır';
                                    }
                                    if (!signUpViewModel!.isPasswordsEqual) {
                                      return 'Şifreler eşleşmeli';
                                    }
                                    return null;
                                  },
                                  onEditingComplete: () => FocusScope.of(context).unfocus(),
                                );
                              }),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.015,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                ElevatedButton(
                                  onPressed: () async {
                                    emailController.clear();
                                    passwordController.clear();
                                    signUpViewModel!.clearFieldValues();
                                    Navigator.of(context).pop();
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
                                Provider<LoginViewModel>(
                                    create: (_) => LoginViewModel(),
                                    builder: (_, __) {
                                      final loginViewModel = Provider.of<LoginViewModel>(_);
                                      return ElevatedButton(
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
                                        onPressed: () async {
                                          if (formKeyCreate.currentState!.validate()) {
                                            await signUpViewModel!.signUp(context);
                                            if (!signUpViewModel!.isSignUpCompleted) {
                                              signUpViewModel!.clearFieldValues();
                                            } else {
                                              loginViewModel.isLogged = true;
                                              Navigator.of(context).pushReplacementNamed('/landing');
                                            }
                                          }
                                          ;
                                          FocusScope.of(context).unfocus();
                                        },
                                      );
                                    }),
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
