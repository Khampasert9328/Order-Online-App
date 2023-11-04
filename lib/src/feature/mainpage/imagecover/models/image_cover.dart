// To parse this JSON data, do
//
//     final imageCoverModels = imageCoverModelsFromJson(jsonString);

import 'dart:convert';

import 'package:flutter/src/widgets/image.dart';

ImageCoverModels imageCoverModelsFromJson(String str) => ImageCoverModels.fromJson(json.decode(str));

String imageCoverModelsToJson(ImageCoverModels data) => json.encode(data.toJson());

class ImageCoverModels {
    List<Datum> data;

    ImageCoverModels({
        required this.data,
    });

    factory ImageCoverModels.fromJson(Map<String, dynamic> json) => ImageCoverModels(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };

  map(Image Function(dynamic e) param0) {}
}

class Datum {
    String seq;
    String coverImage;

    Datum({
        required this.seq,
        required this.coverImage,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        seq: json["seq"],
        coverImage: json["coverImage"],
    );

    Map<String, dynamic> toJson() => {
        "seq": seq,
        "coverImage": coverImage,
    };
}
