import 'dart:convert';

import 'package:http/http.dart' as http;

mixin NetworkHelper {
  Future<http.Response> sendPostRequest({
    required String url,
    required String token,
    Map<String, String>? body,
  }) async {
    final response = await http.post(
      Uri.parse(url),
      body: jsonEncode(body),
      headers: {
        'Content-Type': 'application/json',
        'Accept': '*/*',
        'Authorization': 'Bearer $token',
      },
    );
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
    );
    return response;
  }
}
