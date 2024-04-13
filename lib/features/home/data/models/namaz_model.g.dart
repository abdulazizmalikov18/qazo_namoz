// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'namaz_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NamazModel _$NamazModelFromJson(Map<String, dynamic> json) => NamazModel(
      flowed: json['flowed'] as bool? ?? false,
      prayerTime:
          $enumDecodeNullable(_$PrayerTimeEnumMap, json['prayer_time']) ??
              PrayerTime.None,
    );

Map<String, dynamic> _$NamazModelToJson(NamazModel instance) =>
    <String, dynamic>{
      'prayer_time': _$PrayerTimeEnumMap[instance.prayerTime]!,
      'flowed': instance.flowed,
    };

const _$PrayerTimeEnumMap = {
  PrayerTime.None: 'None',
  PrayerTime.Fajr: 'Fajr',
  PrayerTime.Dhuhr: 'Dhuhr',
  PrayerTime.Asr: 'Asr',
  PrayerTime.Maghrib: 'Maghrib',
  PrayerTime.Isha: 'Isha',
};
