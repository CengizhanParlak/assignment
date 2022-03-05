import 'dart:convert';

import 'package:assignment/core/base/model/base_api_model.dart';
import 'package:assignment/core/constants/api_constants.dart';
import 'package:assignment/core/service/INetwork_service.dart';
import 'package:assignment/core/service/log.dart';
import 'package:assignment/core/service/network_helper.dart';
import 'package:assignment/view/home/profile/model/account.dart';
import 'package:http/http.dart' as http;

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
        // if (url == ApiConstants.BLOG_POST) {
        //   response = await sendPostRequest(
        //     url: url,
        //     token: authToken,
        //     body: body,
        //   ).catchError((err) {
        //     Log.onError(
        //       err,
        //       "sendPostRequestGetCategories",
        //       className: "lib/view/home/home_screen/service/network_request.dart",
        //     );
        //   });
        // } else if (url == ApiConstants.BLOG_POST_FAV) {
        //   response = await sendPostRequest(
        //     url: url,
        //     token: authToken,
        //     body: body,
        //   ).catchError((err) {
        //     Log.onError(
        //       err,
        //       "sendPostRequestToggleFav",
        //       className: "lib/view/home/home_screen/service/network_request.dart",
        //     );
        //   });
        // }
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

  Future<Account>? getAccountInfo(String token) async {
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

  Future<Account>? updateAccountInfo(String token, {Account? account}) async {
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
      return Account.fromJson(model!.data);
    }

    return Account();
  }
}
