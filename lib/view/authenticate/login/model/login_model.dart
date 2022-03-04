// To parse this JSON data, do
//
//     final login = loginFromJson(jsonString);

class LoginModel {
  String? email;
  String? password;

  LoginModel({
    this.email,
    this.password,
  });
}
