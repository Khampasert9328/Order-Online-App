// To parse this JSON data, do
//
//     final registerModels = registerModelsFromJson(jsonString);

import 'dart:convert';

RegisterModels registerModelsFromJson(String str) => RegisterModels.fromJson(json.decode(str));

String registerModelsToJson(RegisterModels data) => json.encode(data.toJson());

class RegisterModels {
    int status;
    String message;
    int registerId;

    RegisterModels({
        required this.status,
        required this.message,
        required this.registerId,
    });

    factory RegisterModels.fromJson(Map<String, dynamic> json) => RegisterModels(
        status: json["status"],
        message: json["message"],
        registerId: json["register_id"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "register_id": registerId,
    };
}
