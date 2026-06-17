import 'package:equatable/equatable.dart';
import 'package:qazo_namoz/core/exceptions/failures.dart';
import 'package:qazo_namoz/core/utils/either.dart';

abstract class UseCase<T, Params> {
  Future<Either<Failure, T>> call(Params params);
}

abstract class StreamUseCase<T, Params> {
  Stream<T> call(Params params);
}

class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}
