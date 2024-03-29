import 'dart:async';

import 'package:assignment/core/constants/api_constants.dart';
import 'package:assignment/view/authenticate/login/model/login_model.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/service/network_helper.dart';
import '../service/login_network_service.dart';
part 'login_view_model.g.dart';

class LoginViewModel = _LoginViewModelBase with _$LoginViewModel;

abstract class _LoginViewModelBase with Store {
  final LoginNetworkService networkService = LoginNetworkService();

  @observable
  String email = "";

  @observable
  String password = "";

  @observable
  bool isLogged = false;

  @observable
  bool isPasswordVisible = false;

  @observable
  bool isLoading = false;

  @computed
  bool get isLoggedIn => isLogged;

  @computed
  bool get isEmailOrPasswordEmpty => email.isNotEmpty == true || password.isNotEmpty == true;

  @computed
  bool get isEmailValid =>
      RegExp(r"""(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4][0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9][0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])""")
          .hasMatch(email) &&
      email.isNotEmpty;

  @computed
  bool get isPasswordValid => password.length >= 6;

  @action
  void togglePasswordVisibility() => isPasswordVisible = !isPasswordVisible;

  @action
  void clearFieldValues() {
    email = "";
    password = "";
  }

  @action
  Future<void> testConnection() async {
    isLoading = true;
    final prefs = await SharedPreferences.getInstance();
    final authTester = AuthTester();
    String authToken = prefs.getString('token') ?? '';
    final bool isAuthed = await authTester.testConnection(authToken);
    if (!isAuthed) {
      prefs.setString('token', '');
      ApiConstants.TEST_TOKEN = '';
    } else {
      ApiConstants.TEST_TOKEN = authToken;
    }
    isLogged = isAuthed;
    isLoading = false;
  }

  @action
  Future<void> signIn(context) async {
    var responseModel = await networkService.signInPOST(context, email: email, password: password);
    if (!responseModel.hasError!) {
      isLogged = true;
    }
  }

  @action
  Future<void> signOut() async {
    isLogged = false;
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('token', '');
    ApiConstants.TEST_TOKEN = '';
  }
}
