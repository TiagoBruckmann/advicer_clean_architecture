// gerencia de estado
import 'package:advicer/application/pages/home/cubit/home_cubit.dart';
import 'package:advicer/data/datasources/home_remote_source.dart';

// import dos data
import 'package:advicer/data/repositories/home_repo_impl.dart';

// import dos domain
import 'package:advicer/domain/repositories/home_repo.dart';
import 'package:advicer/domain/usecases/home_usecases.dart';

// import dos pacotes
import 'package:http/http.dart' as http;
import 'package:get_it/get_it.dart';

final sl = GetIt.I;

Future<void> init() async {

  // application layer
  sl.registerFactory(() => HomeCubit(homeUseCases: sl()));

  // domain layer
  sl.registerFactory(() => HomeUseCases(homeRepo: sl()));

  // data layer
  sl.registerFactory<HomeRepo>(() => HomeRepoImpl(homeRemoteDatasource: sl()));
  sl.registerFactory<HomeRemoteDatasource>(() => HomeRemoteSourceImpl(client: sl()));

  // extern
  sl.registerFactory(() => http.Client());
}