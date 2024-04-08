import 'package:equatable/equatable.dart';
import 'package:qazo_namoz/core/exceptions/failures.dart';
import 'package:qazo_namoz/core/utils/either.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

abstract class StreamUseCase<Type, Params> {
  Stream<Type> call(Params params);
}

class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}
