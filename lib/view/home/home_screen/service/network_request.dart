import 'dart:convert';

import 'package:assignment/core/base/model/base_api_model.dart';
import 'package:assignment/core/constants/api_constants.dart';
import 'package:assignment/core/service/log.dart';
import 'package:assignment/view/home/home_screen/model/blog_post.dart';
import 'package:assignment/view/home/home_screen/model/category.dart';
import 'package:http/http.dart' as http;

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

// TODO: auth token'lar kullanıcı class'ında tutulsun. Argüman olarak gönderilmesin. Shared preferences ile lokalde tutulsun.
Future<BaseApiModel>? sendRequest(String url, String authToken,
    {required String method, String requestedCategory = ""}) async {
  http.Response? response;
  switch (method) {
    case "post":
      if (url == ApiConstants.BLOG_POST) {
        var body = {
          "categoryId": requestedCategory,
        };
        response = await sendPostRequest(
          url: ApiConstants.BLOG_POST,
          token: authToken,
          body: body,
        ).catchError((err) {
          Log.onError(
            err,
            "sendPostRequest",
            className: "lib/view/home/home_screen/service/network_request.dart",
          );
        });
      }
      break;
    case "get":
      if (url == ApiConstants.BLOG_GET) {
        response = await sendGetRequest(
          url: ApiConstants.BLOG_GET,
          token: authToken,
        ).catchError((err) {
          Log.onError(
            err,
            "sendGetRequest",
            className: "lib/view/home/home_screen/service/network_request.dart",
          );
        });
      }
      break;
    default:
  }
  if (response!.statusCode != 200) {
    return BaseApiModel();
  }
  if (response.body.isEmpty) {
    return BaseApiModel();
  }
  return BaseApiModel.fromJson(json.decode(response.body));
}

Future<List<BlogPost>>? getBlogPosts(String token, {String categoryId = ""}) async {
  BaseApiModel? model = await sendRequest(
    ApiConstants.BLOG_POST,
    token,
    method: "post",
    requestedCategory: categoryId,
  );

  if (model?.data != null) {
    return model!.data!.map((e) => BlogPost.fromJson(e)).toList();
  }

  return <BlogPost>[];
}

Future<List<Category>>? getCategories(String token) async {
  BaseApiModel? model = await sendRequest(
    ApiConstants.BLOG_GET,
    token,
    method: "get",
  );

  if (model?.data != null) {
    return model!.data!.map((e) => Category.fromJson(e)).toList();
  }

  return <Category>[];
}
