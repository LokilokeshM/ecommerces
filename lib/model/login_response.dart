// To parse this JSON data, do
//
//     final loginResponseBody = loginResponseBodyFromJson(jsonString);

import 'dart:convert';

LoginResponse loginResponseBodyFromJson(String str) =>
    LoginResponse.fromJson(json.decode(str));

String loginResponseBodyToJson(LoginResponse data) =>
    json.encode(data.toJson());

class LoginResponse {
  LoginResponse({
    this.message,
    this.accessToken,
    this.userId,
    this.name,
    this.tokenType,
    this.uuid,
    this.expiresIn,
    this.referalStatus,
  });

  String? message;
  String? accessToken;
  int? userId;
  String? name;
  String? tokenType;
  String? uuid;
  int? expiresIn;
  String? referalStatus;

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        message: json["message"] == null ? null : json["message"],
        accessToken: json["access_token"] == null ? null : json["access_token"],
        userId: json["user_id"] == null ? null : json["user_id"],
        name: json["name"] == null ? null : json["name"],
        tokenType: json["token_type"] == null ? null : json["token_type"],
        uuid: json["uuid"] == null ? null : json["uuid"],
        expiresIn: json["expires_in"] == null ? null : json["expires_in"],
        referalStatus:
            json["referal_status"] == null ? null : json["referal_status"],
      );

  Map<String, dynamic> toJson() => {
        "message": message == null ? null : message,
        "access_token": accessToken == null ? null : accessToken,
        "user_id": userId == null ? null : userId,
        "name": name == null ? null : name,
        "token_type": tokenType == null ? null : tokenType,
        "uuid": uuid == null ? null : uuid,
        "expires_in": expiresIn == null ? null : expiresIn,
        "referal_status": referalStatus == null ? null : referalStatus,
      };
}
