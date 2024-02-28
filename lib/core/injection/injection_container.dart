import 'package:get_it/get_it.dart';
import 'package:open_ai_app/core/endpoint/network.dart';

final locator = GetIt.instance;

void setup() {
  locator.registerLazySingleton<ApiEndpoint>(() => ApiEndpoint());
  locator.registerLazySingleton<DioConfiguration>(() => DioConfiguration());
}
