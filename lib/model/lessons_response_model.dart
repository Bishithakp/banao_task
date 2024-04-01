// To parse this JSON data, do
//
//     final lessonsResponseModel = lessonsResponseModelFromJson(jsonString);

import 'dart:convert';

LessonsResponseModel lessonsResponseModelFromJson(String str) =>
    LessonsResponseModel.fromJson(json.decode(str));

String lessonsResponseModelToJson(LessonsResponseModel data) =>
    json.encode(data.toJson());

class LessonsResponseModel {
  String requestId;
  List<LessonsItem> lessonItems;
  int count;
  String anyKey;

  LessonsResponseModel({
    required this.requestId,
    required this.lessonItems,
    required this.count,
    required this.anyKey,
  });

  factory LessonsResponseModel.fromJson(Map<String, dynamic> json) =>
      LessonsResponseModel(
        requestId: json["requestId"],
        lessonItems: List<LessonsItem>.from(
            json["items"].map((x) => LessonsItem.fromJson(x))),
        count: json["count"],
        anyKey: json["anyKey"],
      );

  Map<String, dynamic> toJson() => {
        "requestId": requestId,
        "items": List<dynamic>.from(lessonItems.map((x) => x.toJson())),
        "count": count,
        "anyKey": anyKey,
      };
}

class LessonsItem {
  DateTime createdAt;
  String name;
  int duration;
  String category;
  bool locked;
  String id;

  LessonsItem({
    required this.createdAt,
    required this.name,
    required this.duration,
    required this.category,
    required this.locked,
    required this.id,
  });

  factory LessonsItem.fromJson(Map<String, dynamic> json) => LessonsItem(
        createdAt: DateTime.parse(json["createdAt"]),
        name: json["name"],
        duration: json["duration"],
        category: json["category"],
        locked: json["locked"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "createdAt": createdAt.toIso8601String(),
        "name": name,
        "duration": duration,
        "category": category,
        "locked": locked,
        "id": id,
      };
}
