import 'package:dio/dio.dart';
import 'package:qazo_namoz/core/exceptions/exceptions.dart';
import 'package:qazo_namoz/core/exceptions/failures.dart';

class ErrorHandle {
  Future<R> apiCantrol<T, R>(
      {required Future<Response<T>?> Function() request,
      required R Function(T response) body}) async {
    try {
      final response = await request();
      if (response!.statusCode! >= 200 && response.statusCode! < 300) {
        return body(response.data as T);
      }
      throw ServerException(
        statusCode: response.statusCode ?? 0,
        errorMessage: response.statusMessage ?? "",
      );
    } on ServerException {
      rethrow;
    } on DioException catch (err) {
      final errorMessage = DioExceptions.fromDioError(err).toString();
      throw errorMessage;
    } on Exception catch (e) {
      throw ParsingException(errorMessage: e.toString());
    }
  }
}
