import 'package:get_it/get_it.dart';
import 'package:qazo_namoz/core/singletons/dio_settings.dart';

final serviceLocator = GetIt.I;

void setupLocator() {
  serviceLocator.registerLazySingleton(DioSettings.new);
}

Future resetLocator() async {
  await serviceLocator.reset();
  setupLocator();
}
