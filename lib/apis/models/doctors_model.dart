// To parse this JSON data, do
//
//     final doctorsModel = doctorsModelFromJson(jsonString);

import 'dart:convert';

List<DoctorsModel> doctorsModelFromJson(String str) => List<DoctorsModel>.from(
    json.decode(str).map((x) => DoctorsModel.fromJson(x)));

String doctorsModelToJson(List<DoctorsModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DoctorsModel {
  Address address;
  String id;
  String name;
  String email;
  String mobile;
  String about;
  int age;
  int yearofExperience;
  ConsultationTime consultationTime;
  String imgUrl;
  String gender;
  List<String> qualifications;
  String specialization;
  int v;
  String? pdf;

  DoctorsModel({
    required this.address,
    required this.id,
    required this.name,
    required this.email,
    required this.mobile,
    required this.about,
    required this.age,
    required this.yearofExperience,
    required this.consultationTime,
    required this.imgUrl,
    required this.gender,
    required this.qualifications,
    required this.specialization,
    required this.v,
    this.pdf,
  });

  factory DoctorsModel.fromJson(Map<String, dynamic> json) => DoctorsModel(
        address: Address.fromJson(json["address"]),
        id: json["_id"],
        name: json["name"],
        email: json["email"],
        mobile: json["mobile"],
        about: json["about"],
        age: json["age"],
        yearofExperience: json["yearofExperience"],
        consultationTime: ConsultationTime.fromJson(json["consultationTime"]),
        imgUrl: json["imgUrl"],
        gender: json["gender"],
        qualifications: List<String>.from(json["qualifications"].map((x) => x)),
        specialization: json["specialization"],
        v: json["__v"],
        pdf: json["pdf"],
      );

  Map<String, dynamic> toJson() => {
        "address": address.toJson(),
        "_id": id,
        "name": name,
        "email": email,
        "mobile": mobile,
        "about": about,
        "age": age,
        "yearofExperience": yearofExperience,
        "consultationTime": consultationTime.toJson(),
        "imgUrl": imgUrl,
        "gender": gender,
        "qualifications": List<dynamic>.from(qualifications.map((x) => x)),
        "specialization": specialization,
        "__v": v,
        "pdf": pdf,
      };
}

class Address {
  String building;
  String location;
  String country;

  Address({
    required this.building,
    required this.location,
    required this.country,
  });

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        building: json["building"],
        location: json["location"],
        country: json["country"],
      );

  Map<String, dynamic> toJson() => {
        "building": building,
        "location": location,
        "country": country,
      };
}

class ConsultationTime {
  int start;
  int end;

  ConsultationTime({
    required this.start,
    required this.end,
  });

  factory ConsultationTime.fromJson(Map<String, dynamic> json) =>
      ConsultationTime(
        start: json["start"],
        end: json["end"],
      );

  Map<String, dynamic> toJson() => {
        "start": start,
        "end": end,
      };
}
