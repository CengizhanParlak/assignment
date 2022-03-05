import 'dart:convert';
import 'dart:io';

import 'package:assignment/core/base/model/base_api_model.dart';
import 'package:assignment/core/components/custom_alert_dialog.dart';
import 'package:assignment/core/constants/api_constants.dart';
import 'package:assignment/core/service/INetwork_service.dart';
import 'package:assignment/core/service/log.dart';
import 'package:assignment/core/service/network_helper.dart';
import 'package:assignment/view/home/profile/model/account.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

class AccountNetworkService with NetworkHelper implements INetworkService {
  @override
  Future<BaseApiModel>? sendRequest(
    String url,
    String authToken, {
    required String method,
    Map<String, Object>? body,
  }) async {
    http.Response? response;
    switch (method) {
      case "post":
        if (url == ApiConstants.UPDATE_ACCOUNT) {
          response = await sendPostRequest(
            url: url,
            token: authToken,
            body: body,
          ).catchError((err) {
            Log.onError(
              err,
              "sendPostRequestUpdateAccountInfo",
              className: "lib/view/home/home_screen/service/network_request.dart",
            );
          });
        }
        break;
      case "get":
        if (url == ApiConstants.GET_ACCOUNT) {
          response = await sendGetRequest(
            url: url,
            token: authToken,
          ).catchError((err) {
            Log.onError(
              err,
              "sendGetRequest -> getAccountInfo",
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

  Future<Account>? getAccountInfo(BuildContext context, String token) async {
    BaseApiModel? model = await sendRequest(
      ApiConstants.GET_ACCOUNT,
      token,
      method: "get",
    );

    if (model?.data != null) {
      return Account.fromJson(model!.data);
    }

    return Account();
  }

  Future<String> uploadAccountImage(context, token, {required Account account, required String imagePath}) async {
    // BaseApiModel? model = await sendRequest(
    //   ApiConstants.UPDATE_ACCOUNT,
    //   token,
    //   method: "post",
    //   body: {},
    // );
    var model;
    var postUri = Uri.parse(ApiConstants.UPLOAD_IMAGE);
    var request = http.MultipartRequest("POST", postUri);
    request.files.add(http.MultipartFile.fromBytes('file', await File.fromUri(Uri.parse(imagePath)).readAsBytes(),
        contentType: MediaType('image', 'jpeg')));

    await request.send().then((response) {
      if (response.statusCode == 200) print("Uploaded!");
      model = response;
    });

    if (model?.data != null) {
      if (!model!.hasError!) {
        return account.image = model.data;
      }
    }
    return '';
  }

  Future<bool> updateAccountInfo(BuildContext context, String token, {Account? account}) async {
    var body = {
      "Image": account?.image ?? "",
      "Location": {
        "Longtitude": account?.location?.longtitude ?? "",
        "Latitude": account?.location?.latitude ?? "",
      },
    };
    BaseApiModel? model = await sendRequest(
      ApiConstants.UPDATE_ACCOUNT,
      token,
      method: "post",
      body: body,
    );

    if (model?.data != null) {
      if (model!.data) {
        showApiErrorDialog(context, model);
        return await Future.value(true);
      }
    }
    return Future.value(false);
  }
}
