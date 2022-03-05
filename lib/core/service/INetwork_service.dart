import 'package:assignment/core/base/model/base_api_model.dart';

abstract class INetworkService {
  Future<BaseApiModel>? sendRequest(
    String url,
    String authToken, {
    required String method,
    Map<String, String>? body,
  });
}
