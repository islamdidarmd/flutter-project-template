import 'package:dio/dio.dart';
import 'package:flutter_project_template/data/repository/datasource/github_remote_data_source.dart';
import 'package:flutter_project_template/data/repository/github_repository_impl.dart';
import 'package:flutter_project_template/domain/domain.dart';
import 'package:flutter_project_template/ui/home/home_cubit.dart';
import 'package:get_it/get_it.dart';

late GetIt sl;
void setUpDependencies({required GetIt slInstance}) {
  sl = slInstance;
  sl.registerLazySingleton<Dio>(() => Dio());
  sl.registerFactory<GithubRemoteDataSource>(
      () => GithubRemoteDataSourceImpl());
  sl.registerFactory<GithubRepository>(
      () => GithubRepositoryImpl(dataSource: sl.get<GithubRemoteDataSource>()));
  sl.registerFactory<FindRepoByKeyUseCase>(
      () => FindRepoByKeyUseCase(repository: sl.get<GithubRepository>()));
  sl.registerFactory<HomeCubit>(
      () => HomeCubit(sl.get<FindRepoByKeyUseCase>()));
}
