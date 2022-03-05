import 'dart:convert';

import 'package:assignment/core/base/model/base_api_model.dart';
import 'package:assignment/core/components/custom_alert_dialog.dart';
import 'package:assignment/core/constants/api_constants.dart';
import 'package:assignment/core/service/INetwork_service.dart';
import 'package:assignment/core/service/log.dart';
import 'package:assignment/core/service/network_helper.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoginNetworkService with NetworkHelper implements INetworkService {
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
        if (url == ApiConstants.SIGN_IN) {
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
        } else if (url == ApiConstants.SIGN_UP) {
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

  Future<BaseApiModel> signInPOST(context, {required String email, required String password}) async {
    var body = {
      "Email": email,
      "Password": password,
    };

    BaseApiModel? model = await sendRequest(
      ApiConstants.SIGN_IN,
      "",
      method: "post",
      body: body,
    );

    if (model?.data != null) {
      if (model!.hasError!) {
        showApiErrorDialog(context, model);
      } else {
        String authToken = model.data!["Token"];
        debugPrint("resultAuthToken $authToken");
        debugPrint("response model: ${model.toString()}");
        ApiConstants.TEST_TOKEN = authToken;
        return model;
      }
    }
    return BaseApiModel();
  }

// TODO: POST GET suffixlerini çıkar
  Future<BaseApiModel> signUpPOST({required String email, required String password}) async {
    var body = {
      "Email": email,
      "Password": password,
      "PasswordRetry": password,
    };

    BaseApiModel? model = await sendRequest(
      ApiConstants.SIGN_UP,
      "",
      method: "post",
      body: body,
    );

    if (model?.data != null) {
      String authToken = model!.data!["Token"];
      debugPrint("resultAuthToken $authToken");
      debugPrint("response model: ${model.toString()}");
      ApiConstants.TEST_TOKEN = authToken;
      return model;
    }
    return BaseApiModel();
  }
}
