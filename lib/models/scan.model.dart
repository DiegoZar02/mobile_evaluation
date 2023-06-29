import 'dart:convert';

List<ScanModel> scanModelFromJson(String str) =>
    List<ScanModel>.from(json.decode(str).map((x) => ScanModel.fromJson(x)));

String scanModelToJson(List<ScanModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ScanModel {
  int id;
  String title;
  List<String> description;
  String image;

  ScanModel({
    required this.id,
    required this.title,
    required this.description,
    required this.image,
  });

  factory ScanModel.fromJson(Map<String, dynamic> json) => ScanModel(
        id: json["id"],
        title: json["title"],
        description: List<String>.from(json["description"].map((x) => x)),
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": List<dynamic>.from(description.map((x) => x)),
        "image": image,
      };
}
