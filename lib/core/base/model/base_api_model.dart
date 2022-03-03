// To parse this JSON data, do
//
//     final baseApiModel = baseApiModelFromJson(jsonString);

import 'dart:convert';

BaseApiModel baseApiModelFromJson(String str) => BaseApiModel.fromJson(json.decode(str));

String baseApiModelToJson(BaseApiModel data) => json.encode(data.toJson());

class BaseApiModel<T> {
  BaseApiModel({
    this.validationErrors,
    this.hasError,
    this.message,
    this.data,
  });

  List<ValidationError>? validationErrors;
  bool? hasError;
  String? message;
  T? data;

  factory BaseApiModel.fromJson(Map<String, dynamic> json) => BaseApiModel(
        validationErrors: parseValidationErrors(json["ValidationErrors"]),
        hasError: json["HasError"] ?? "",
        message: json["Message"] ?? "",
        data: json["Data"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "ValidationErrors": List<dynamic>.from(validationErrors!.map((x) => x.toJson())),
        "HasError": hasError,
        "Message": message,
        "Data": jsonEncode(data),
      };

  static List<ValidationError>? parseValidationErrors(json) {
    return List<ValidationError>.from(json.map((x) => ValidationError.fromJson(x)));
  }
}

class ValidationError {
  ValidationError({
    this.key,
    this.value,
  });

  String? key;
  String? value;

  factory ValidationError.fromJson(Map<String, dynamic> json) => ValidationError(
        key: json["Key"],
        value: json["Value"],
      );

  Map<String, dynamic> toJson() => {
        "Key": key,
        "Value": value,
      };
}
