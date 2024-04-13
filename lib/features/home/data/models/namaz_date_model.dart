import 'package:json_annotation/json_annotation.dart';
import 'package:qazo_namoz/features/home/domain/entity/namaz_date_entity.dart';
import 'package:qazo_namoz/features/home/domain/entity/namaz_entity.dart';

part 'namaz_date_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class NamazDataModel extends NamazDataEntity {
  const NamazDataModel({
    super.dateTime,
    super.namaz,
  });

  factory NamazDataModel.fromJson(Map<String, dynamic> json) =>
      _$NamazDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$NamazDataModelToJson(this);
}
