// To parse this JSON data, do
//
//     final sweepstakesList = sweepstakesListFromJson(jsonString);

import 'dart:convert';

SweepstakesList sweepstakesListFromJson(String str) =>
    SweepstakesList.fromJson(json.decode(str));

String sweepstakesListToJson(SweepstakesList data) =>
    json.encode(data.toJson());

class SweepstakesList {
  SweepstakesList({
    this.message,
    this.code,
    this.data,
    this.pages,
    this.states,
  });

  String? message;
  int? code;
  List<Datum>? data;
  int? pages;
  List<State>? states;

  factory SweepstakesList.fromJson(Map<String, dynamic> json) =>
      SweepstakesList(
        message: json["message"],
        code: json["code"],
        data: json["data"] == null
            ? null
            : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        pages: json["pages"],
        states: json["states"] == null
            ? null
            : List<State>.from(json["states"].map((x) => State.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "code": code,
        "data": data == null
            ? null
            : List<dynamic>.from(data!.map((x) => x.toJson())),
        "pages": pages,
        "states": states == null
            ? null
            : List<dynamic>.from(states!.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    this.id,
    this.uuid,
    this.name,
    this.address,
    this.state,
    this.fieldOfExpertise,
    this.bio,
    this.level,
    this.hoursLogged,
    this.phoneNo,
    this.email,
    this.areasOfPractise,
    this.serviceOffered,
    this.profilePicture,
    this.rating,
    this.ranking,
  });

  int? id;
  String? uuid;
  String? name;
  String? address;
  String? state;
  String? fieldOfExpertise;
  String? bio;
  String? level;
  String? hoursLogged;
  String? phoneNo;
  String? email;
  List<dynamic>? areasOfPractise;
  List<dynamic>? serviceOffered;
  String? profilePicture;
  String? rating;
  String? ranking;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        uuid: json["uuid"],
        name: json["name"],
        address: json["address"],
        state: json["state"],
        fieldOfExpertise: json["field_of_expertise"],
        bio: json["bio"],
        level: json["level"],
        hoursLogged: json["hours_logged"],
        phoneNo: json["phone_no"],
        email: json["email"],
        areasOfPractise: json["areas_of_practise"] == null
            ? null
            : List<dynamic>.from(json["areas_of_practise"].map((x) => x)),
        serviceOffered: json["service_offered"] == null
            ? null
            : List<dynamic>.from(json["service_offered"].map((x) => x)),
        profilePicture: json["profile_picture"],
        rating: json["rating"],
        ranking: json["ranking"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "uuid": uuid,
        "name": name,
        "address": address,
        "state": state,
        "field_of_expertise": fieldOfExpertise,
        "bio": bio,
        "level": level,
        "hours_logged": hoursLogged,
        "phone_no": phoneNo,
        "email": email,
        "areas_of_practise": areasOfPractise == null
            ? null
            : List<dynamic>.from(areasOfPractise!.map((x) => x)),
        "service_offered": serviceOffered == null
            ? null
            : List<dynamic>.from(serviceOffered!.map((x) => x)),
        "profile_picture": profilePicture,
        "rating": rating,
        "ranking": ranking,
      };
}

class State {
  State({
    this.stateName,
    this.id,
  });

  String? stateName;
  int? id;

  factory State.fromJson(Map<String, dynamic> json) => State(
        stateName: json["state_name"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "state_name": stateName,
        "id": id,
      };
}
