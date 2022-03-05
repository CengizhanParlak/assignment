import 'dart:convert';

import 'package:assignment/core/constants/api_constants.dart';
import 'package:assignment/core/service/log.dart';
import 'package:http/http.dart' as http;

mixin NetworkHelper {
  Future<http.Response> sendPostRequest({
    required String url,
    required String token,
    Map<String, Object>? body,
  }) async {
    final response = await http.post(
      Uri.parse(url),
      body: jsonEncode(body),
      headers: {
        'Content-Type': 'application/json',
        'Accept': '*/*',
        'Authorization': 'Bearer $token',
      },
    ).catchError((err) {
      Log.onError(err, 'NetworkHelper.sendPostRequest');
    });
    return response;
  }

  Future<http.Response> sendGetRequest({
    required String url,
    required String token,
    Map<String, String>? body,
  }) async {
    final response = await http.get(
      Uri.parse(url),
      headers: {
        'Accept': '*/*',
        'Authorization': 'Bearer $token',
      },
    ).catchError((err) {
      Log.onError(err, 'NetworkHelper.sendGetRequest');
    });
    return response;
  }
}

class AuthTester with NetworkHelper {
  Future<bool> testConnection(String token) async {
    var response = await sendGetRequest(url: ApiConstants.GET_ACCOUNT, token: token).catchError((err) {
      Log.onError(err, 'AuthTester.testConnection');
    });
    if (response.statusCode == 200) {
      return Future.value(true);
    }
    return Future.value(false);
  }
}
