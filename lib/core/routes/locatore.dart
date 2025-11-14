
import 'package:get_it/get_it.dart';

import 'routes_services.dart';


GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => RoutesService());
}