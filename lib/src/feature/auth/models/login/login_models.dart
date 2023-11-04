// To parse this JSON data, do
//
//     final loginModels = loginModelsFromJson(jsonString);

import 'dart:convert';

LoginModels loginModelsFromJson(String str) => LoginModels.fromJson(json.decode(str));

String loginModelsToJson(LoginModels data) => json.encode(data.toJson());

class LoginModels {
    bool success;
    String email;
    String message;
    String token;

    LoginModels({
        required this.success,
        required this.email,
        required this.message,
        required this.token,
    });

    factory LoginModels.fromJson(Map<String, dynamic> json) => LoginModels(
        success: json["success"],
        email: json["email"],
        message: json["message"],
        token: json["token"],
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "email": email,
        "message": message,
        "token": token,
    };
}
