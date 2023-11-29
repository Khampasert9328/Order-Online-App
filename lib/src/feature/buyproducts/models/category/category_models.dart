// To parse this JSON data, do
//
//     final getCategoryModels = getCategoryModelsFromJson(jsonString);

import 'dart:convert';

GetCategoryModels getCategoryModelsFromJson(String str) => GetCategoryModels.fromJson(json.decode(str));

String getCategoryModelsToJson(GetCategoryModels data) => json.encode(data.toJson());

class GetCategoryModels {
    List<Datum>? data;

    GetCategoryModels({
        this.data,
    });

    factory GetCategoryModels.fromJson(Map<String, dynamic> json) => GetCategoryModels(
        data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class Datum {
    int? typeId;
    String? typeName;

    Datum({
        this.typeId,
        this.typeName,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        typeId: json["type_id"],
        typeName: json["type_name"],
    );

    Map<String, dynamic> toJson() => {
        "type_id": typeId,
        "type_name": typeName,
    };
}
