// To parse this JSON data, do
//
//     final loginRequestBody = loginRequestBodyFromJson(jsonString);

import 'dart:convert';

LoginRequest loginRequestBodyFromJson(String str) =>
    LoginRequest.fromJson(json.decode(str));

String loginRequestBodyToJson(LoginRequest data) => json.encode(data.toJson());

class LoginRequest {
  LoginRequest({
    required this.phoneNo,
    required this.password,
  });

  String phoneNo;
  String password;

  factory LoginRequest.fromJson(Map<String, dynamic> json) => LoginRequest(
        phoneNo: json["phone_no"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "phone_no": phoneNo,
        "password": password,
      };
}
