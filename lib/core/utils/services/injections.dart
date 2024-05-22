import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:http/http.dart' as http;

import '../../../features/auth/data/repository/authentication_repository_impl.dart';
import '../../../features/auth/data/source/authentication_source.dart';
import '../../../features/auth/domain/repository/authentication_repository.dart';
import '../../../features/auth/domain/usecases/subscribe_user.dart';
import '../../../features/auth/presentation/bloc/authentication_bloc.dart';
import 'network/internet_info.dart';

final sl = GetIt.instance;

void setup() {
  // Bloc
  sl.registerFactory(
    () => AuthenticationBloc(subscribeUser: sl()),
  );

  // Use cases
  sl.registerLazySingleton<SubscribeUser>(
    () => SubscribeUserImpl(repository: sl()),
  );

  // Repositories
  sl.registerLazySingleton<AuthenticationRepository>(
    () => AuthenticationRepositoryImpl(
      source: sl(),
      internetInfo: sl(),
    ),
  );

  // Data Sources
  sl.registerLazySingleton<AuthenticationSource>(
    () => AuthenticationSourceImpl(client: sl()),
  );

  // Other Services
  sl.registerLazySingleton<InternetInfo>(
    () => InternetInfoImpl(checker: InternetConnectionChecker()),
  );
  sl.registerFactory(() => http.Client());
}
