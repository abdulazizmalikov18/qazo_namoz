// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'questions_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuestionsModel _$QuestionsModelFromJson(Map<String, dynamic> json) =>
    QuestionsModel(
      id: (json['id'] as num).toInt(),
      commit: json['commit'] as String,
      questions: json['questions'] as String,
      title: json['title'] as String,
      url: json['url'] as String? ?? "",
      whereDid: json['where_did'] as String? ?? "",
    );

Map<String, dynamic> _$QuestionsModelToJson(QuestionsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'commit': instance.commit,
      'questions': instance.questions,
      'title': instance.title,
      'url': instance.url,
      'where_did': instance.whereDid,
    };
