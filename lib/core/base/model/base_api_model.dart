// To parse this JSON data, do
//
//     final baseApiModel = baseApiModelFromJson(jsonString);

import 'dart:convert';

BaseApiModel baseApiModelFromJson(String str) => BaseApiModel.fromJson(json.decode(str));

String baseApiModelToJson(BaseApiModel data) => json.encode(data.toJson());

class BaseApiModel {
  BaseApiModel({
    this.validationErrors,
    this.hasError,
    this.message,
    this.data,
  });

  List<ValidationError>? validationErrors;
  bool? hasError;
  dynamic message;
  List<dynamic>? data;

  factory BaseApiModel.fromJson(Map<String, dynamic> json) => BaseApiModel(
        validationErrors: List<ValidationError>.from(json["ValidationErrors"].map((x) => ValidationError.fromJson(x))),
        hasError: json["HasError"],
        message: json["Message"],
        data: json["Data"] == null ? [] : List<dynamic>.from(json["Data"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "ValidationErrors": List<dynamic>.from(validationErrors!.map((x) => x.toJson())),
        "HasError": hasError,
        "Message": message,
        "Data": data == null ? [].map((x) => x) : List<dynamic>.from(data!.map((x) => x)),
      };
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
