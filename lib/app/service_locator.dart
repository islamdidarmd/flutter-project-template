import 'package:flutter_project_template/data/network/networking_client.dart';
import 'package:flutter_project_template/data/repository/datasource/github_remote_data_source.dart';
import 'package:flutter_project_template/data/repository/github_repository_impl.dart';
import 'package:flutter_project_template/domain/domain.dart';
import 'package:flutter_project_template/ui/home/home_cubit.dart';
import 'package:get_it/get_it.dart';

late GetIt sl;

void setUpDependencies({required GetIt slInstance}) {
  sl = slInstance;

  sl.registerSingleton<NetworkingClient>(NetworkingClientImpl());
  sl.registerFactory<GithubRemoteDataSource>(
      () => GithubRemoteDataSourceImpl(networkingClient: sl()));
  sl.registerFactory<GithubRepository>(
      () => GithubRepositoryImpl(dataSource: sl()));
  sl.registerFactory<FindRepoByKeyUseCase>(
      () => FindRepoByKeyUseCase(repository: sl()));
  sl.registerFactory<HomeCubit>(() => HomeCubit(sl()));
}
