import 'dart:convert';

import 'package:assignment/view/authenticate/login/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

enum AuthStatus {
  uninitialized,
  authenticated,
  authenticating,
  unauthenticated,
}

class UserRepository with ChangeNotifier {
  User? user;
  AuthStatus _status = AuthStatus.uninitialized;

  AuthStatus get status => _status;
  User get authUser => user!;

  Future<bool> signIn(String email, String password) async {
    try {
      var body = jsonEncode({'email': email, 'password': password});

      var res = await http.post((Uri.parse('http://192.168.178.35:8000/auth/login')),
          body: body, headers: {"Accept": "application/json", "content-type": "application/json"});
      var response = jsonDecode(res.body);

      if (response.status == 200) {
        notifyListeners();
        return true;
      } else {
        notifyListeners();
        return false;
      }
    } catch (e) {
      _status = AuthStatus.unauthenticated;
      notifyListeners();
      return false;
    }
  }
}
