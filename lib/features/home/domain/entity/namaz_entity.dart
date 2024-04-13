import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:qazo_namoz/core/utils/enums.dart';
import 'package:qazo_namoz/features/home/data/models/namaz_model.dart';

class NamazEntity extends Equatable {
  final PrayerTime prayerTime;
  final bool flowed;

  const NamazEntity({
    this.prayerTime = PrayerTime.None,
    this.flowed = false,
  });

  @override
  List<Object?> get props => [prayerTime, flowed];
}

class NamazConverter
    implements JsonConverter<NamazEntity, Map<String, dynamic>?> {
  const NamazConverter();

  @override
  NamazEntity fromJson(Map<String, dynamic>? json) =>
      NamazModel.fromJson(json ?? {});

  @override
  Map<String, dynamic>? toJson(NamazEntity object) => {};
}


