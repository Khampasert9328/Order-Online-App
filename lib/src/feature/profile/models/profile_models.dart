// To parse this JSON data, do
//
//     final profileModels = profileModelsFromJson(jsonString);

import 'dart:convert';

ProfileModels profileModelsFromJson(String str) => ProfileModels.fromJson(json.decode(str));

String profileModelsToJson(ProfileModels data) => json.encode(data.toJson());

class ProfileModels {
    List<Datum> data;

    ProfileModels({
        required this.data,
    });

    factory ProfileModels.fromJson(Map<String, dynamic> json) => ProfileModels(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    int id;
    String phone;
    String email;
    String fullname;
    String fname;
    String lname;
    String province;
    String provName;
    String district;
    String distName;
    String village;
    String villageName;
    String userType;
    dynamic profileImage;

    Datum({
        required this.id,
        required this.phone,
        required this.email,
        required this.fullname,
        required this.fname,
        required this.lname,
        required this.province,
        required this.provName,
        required this.district,
        required this.distName,
        required this.village,
        required this.villageName,
        required this.userType,
        required this.profileImage,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        phone: json["phone"],
        email: json["email"],
        fullname: json["fullname"],
        fname: json["fname"],
        lname: json["lname"],
        province: json["province"],
        provName: json["prov_name"],
        district: json["district"],
        distName: json["dist_name"],
        village: json["village"],
        villageName: json["village_name"],
        userType: json["user_type"],
        profileImage: json["profile_image"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "phone": phone,
        "email": email,
        "fullname": fullname,
        "fname": fname,
        "lname": lname,
        "province": province,
        "prov_name": provName,
        "district": district,
        "dist_name": distName,
        "village": village,
        "village_name": villageName,
        "user_type": userType,
        "profile_image": profileImage,
    };
}
