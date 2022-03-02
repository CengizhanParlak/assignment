import 'dart:convert';

import 'package:assignment/core/base/model/base_api_model.dart';
import 'package:assignment/core/constants/api_constants.dart';
import 'package:assignment/core/service/log.dart';
import 'package:assignment/view/home/home_screen/model/blog.dart';
import 'package:http/http.dart' as http;

Future<BaseApiModel> getResponse(String authToken, {String requestedCategory = ""}) async {
  String requestBody = jsonEncode({
    "requestedCategory": requestedCategory,
  });
  var response = await http.post(
    Uri.parse(ApiConstants.BLOG_POST),
    body: requestBody,
    headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $authToken',
      "Accept": "*/*",
    },
  ).catchError(
    (err) {
      Log.onError(
        err,
        "getResponse",
        className: "D:/Users/cengi/Flutter/assignment/lib/view/home/home_screen/service/network_request.dart",
      );
    },
  );
  return BaseApiModel.fromJson(json.decode(response.body));
}

Future<List<Blog>>? getBlogPosts(String token, {String categoryId = ""}) async {
  BaseApiModel model = await getResponse(token, requestedCategory: categoryId);
  if (model.data != null) {
    return model.data!.map((e) => Blog.fromJson(e)).toList();
  }
  return <Blog>[];
}
