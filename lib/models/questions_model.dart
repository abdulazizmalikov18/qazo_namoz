// To parse this JSON data, do
//
//     final questionsModel = questionsModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'questions_model.g.dart';

List<QuestionsModel> questionsModelFromJson(String str) =>
    List<QuestionsModel>.from(
        json.decode(str).map((x) => QuestionsModel.fromJson(x)));

String questionsModelToJson(List<QuestionsModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@JsonSerializable()
class QuestionsModel {
  @JsonKey(name: "id")
  final int id;
  @JsonKey(name: "commit")
  final String commit;
  @JsonKey(name: "questions")
  final String questions;
  @JsonKey(name: "title")
  final String title;
  @JsonKey(name: "url")
  final String url;
  @JsonKey(name: "where_did")
  final String whereDid;

  QuestionsModel({
    required this.id,
    required this.commit,
    required this.questions,
    required this.title,
    this.url = "",
    this.whereDid = "",
  });

  factory QuestionsModel.fromJson(Map<String, dynamic> json) =>
      _$QuestionsModelFromJson(json);

  Map<String, dynamic> toJson() => _$QuestionsModelToJson(this);
}
