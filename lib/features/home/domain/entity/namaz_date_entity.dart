import 'package:equatable/equatable.dart';
import 'package:qazo_namoz/features/home/domain/entity/namaz_entity.dart';

class NamazDataEntity extends Equatable {
  final String dateTime;
  @NamazConverter()
  final List<NamazEntity> namaz;

  const NamazDataEntity({
    this.dateTime = "",
    this.namaz = const [],
  });

  @override
  List<Object?> get props => [dateTime, namaz];
}
