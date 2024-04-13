// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'namaz_date_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NamazDataModel _$NamazDataModelFromJson(Map<String, dynamic> json) =>
    NamazDataModel(
      dateTime: json['date_time'] as String? ?? "",
      namaz: (json['namaz'] as List<dynamic>?)
              ?.map((e) =>
                  const NamazConverter().fromJson(e as Map<String, dynamic>?))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$NamazDataModelToJson(NamazDataModel instance) =>
    <String, dynamic>{
      'date_time': instance.dateTime,
      'namaz': instance.namaz.map(const NamazConverter().toJson).toList(),
    };
