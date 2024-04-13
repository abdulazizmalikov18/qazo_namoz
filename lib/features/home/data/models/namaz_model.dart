import 'package:json_annotation/json_annotation.dart';
import 'package:qazo_namoz/core/utils/enums.dart';
import 'package:qazo_namoz/features/home/domain/entity/namaz_entity.dart';

part 'namaz_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class NamazModel extends NamazEntity {
  const NamazModel({
    super.flowed,
    super.prayerTime,
  });

  factory NamazModel.fromJson(Map<String, dynamic> json) =>
      _$NamazModelFromJson(json);

  Map<String, dynamic> toJson() => _$NamazModelToJson(this);
}
