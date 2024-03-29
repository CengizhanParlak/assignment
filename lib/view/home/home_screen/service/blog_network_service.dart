import 'dart:convert';

import 'package:assignment/core/base/model/base_api_model.dart';
import 'package:assignment/core/constants/api_constants.dart';
import 'package:assignment/core/service/INetwork_service.dart';
import 'package:assignment/core/service/log.dart';
import 'package:assignment/core/service/network_helper.dart';
import 'package:assignment/view/home/home_screen/model/blog_post_model.dart';
import 'package:assignment/view/home/home_screen/model/category_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// TODO: auth token'lar kullanıcı class'ında tutulsun. Argüman olarak gönderilmesin. Shared preferences ile lokalde tutulsun.
class BlogNetworkService with NetworkHelper implements INetworkService {
  @override
  Future<BaseApiModel>? sendRequest(
    String url,
    String authToken, {
    required String method,
    Map<String, String>? body,
  }) async {
    http.Response? response;
    switch (method) {
      case "post":
        if (url == ApiConstants.GET_POSTS) {
          response = await sendPostRequest(
            url: url,
            token: authToken,
            body: body,
          ).catchError((err) {
            Log.onError(
              err,
              "sendPostRequestGetCategories",
              className: "lib/view/home/home_screen/service/network_request.dart",
            );
          });
        } else if (url == ApiConstants.FAV_BLOG_POST) {
          response = await sendPostRequest(
            url: url,
            token: authToken,
            body: body,
          ).catchError((err) {
            Log.onError(
              err,
              "sendPostRequestToggleFav",
              className: "lib/view/home/home_screen/service/network_request.dart",
            );
          });
        }
        break;
      case "get":
        if (url == ApiConstants.GET_CATEGORIES) {
          response = await sendGetRequest(
            url: ApiConstants.GET_CATEGORIES,
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
    // TODO: 401 dönerse token eskimiştir deyip kullanıcıyı appten çıkartıp tekrar giriş yapması lazım.
    if (response!.statusCode != 200) {
      return BaseApiModel();
    }
    if (response.body.isEmpty) {
      return BaseApiModel();
    }
    return BaseApiModel.fromJson(json.decode(response.body));
  }

  Future<int> toggleFavoritePOST(String token, {required String articleId}) async {
    var body = {
      "Id": articleId,
    };
    BaseApiModel? model = await sendRequest(
      ApiConstants.FAV_BLOG_POST,
      token,
      method: "post",
      body: body,
    );

    if (model?.data != null) {
      var msg = model!.message!.toLowerCase();
      if (msg.contains("eklendi")) {
        return Future.value(1);
      } else if (msg.contains("kaldırıldı")) {
        return Future.value(0);
      } else {
        return Future.value(-1);
      }
    }

    return Future.value(-1);
  }

  Future<List<BlogPost>>? getBlogPostsPOST(String token, {String categoryId = ""}) async {
    var body = {
      "categoryId": categoryId,
    };
    BaseApiModel? model = await sendRequest(
      ApiConstants.GET_POSTS,
      token,
      method: "post",
      body: body,
    );

    if (model?.data != null) {
      return model!.data!.map<BlogPost>((e) => BlogPost.fromJson(e)).toList();
    }

    return <BlogPost>[];
  }

  Future<List<Category>>? getCategoriesGET(String token) async {
    BaseApiModel? model = await sendRequest(
      ApiConstants.GET_CATEGORIES,
      token,
      method: "get",
    );

    if (model?.data != null) {
      return model!.data!.map<Category>((e) => Category.fromJson(e)).toList();
    }

    return <Category>[];
  }
}
