

import 'package:flutter_firebase/Movies_App/core/apis/dio_client.dart';
import 'package:flutter_firebase/Movies_App/core/common/data/datasoures/global_info_local_data_source.dart';
import 'package:flutter_firebase/Movies_App/core/common/data/repositories/global_repository_impl.dart';
import 'package:flutter_firebase/Movies_App/core/common/domain/repositories/global_repository.dart';
import 'package:flutter_firebase/Movies_App/core/common/domain/usecases/global_infor_usecases.dart';
import 'package:flutter_firebase/Movies_App/features/home/data/datasources/movie_remote_data_source.dart';
import 'package:flutter_firebase/Movies_App/features/home/data/repositories/movie_repository_impl.dart';
import 'package:flutter_firebase/Movies_App/features/home/domain/repositories/movie_repository.dart';
import 'package:flutter_firebase/Movies_App/features/home/domain/usecases/movie_usecase.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

Future<void> initDI() async {
  //! Đăng ký SharedPreferences
  final sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerLazySingleton<SharedPreferences>(() => sharedPreferences);

  //! Dio Client
  getIt.registerLazySingleton<DioClient>(() => DioClient());

  //! Data Source
  getIt.registerLazySingleton<MovieRemoteDataSource>(
      () => MovieRemoteDataSourceImpl(dio: getIt<DioClient>().dio));
  getIt.registerLazySingleton<GlobalInfoLocalDatasource>(
      () => GlobalInfoLocalDataSourceImpl(sharedPreferences: getIt()));

  //! Repository
  getIt.registerLazySingleton<MovieRepository>(
      () => MovieRepositoryImpl(remoteDataSource: getIt()));
  getIt.registerLazySingleton<GlobalRepository>(
      () => GlobalRepositoryImpl(localDatasource: getIt()));

  //! Use cases
  getIt.registerLazySingleton<GlobalInfoUsecases>(() => GlobalInfoUsecases(
        repository: getIt(),
        globalRepository: getIt(),
      ));
  getIt.registerLazySingleton<GetMovies>(() => GetMovies(getIt()));
}