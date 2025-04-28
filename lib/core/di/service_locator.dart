import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:book_app/core/networking/api_service.dart';
import 'package:book_app/features/home/data/data_sources/home_remote_data_source.dart';
import 'package:book_app/features/home/data/repo/home_repo_impl.dart';
import 'package:book_app/features/home/presentation/cubit/home_cubit.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  // External
  getIt.registerLazySingleton<Dio>(() => Dio());

  // Core
  getIt.registerLazySingleton<ApiService>(() => ApiService(getIt<Dio>()));

  // Data sources
  getIt.registerLazySingleton<HomeRemoteDataSourceImpl>(
    () => HomeRemoteDataSourceImpl(getIt<ApiService>()),
  );

  // Repository
  getIt.registerLazySingleton<HomeRepoImpl>(() => HomeRepoImpl(getIt<HomeRemoteDataSourceImpl>()));

  // Cubit
  getIt.registerFactory<HomeCubit>(() => HomeCubit(getIt<HomeRepoImpl>()));
}
