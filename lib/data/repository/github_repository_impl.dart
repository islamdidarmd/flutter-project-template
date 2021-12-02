import 'datasource/github_remote_data_source.dart';
import 'package:flutter_project_template/domain/domain.dart';

class GithubRepositoryImpl implements GithubRepository {
  final GithubRemoteDataSource dataSource;

  const GithubRepositoryImpl({
    required this.dataSource,
  });

  @override
  Future<List<Repository>> findRepoByKey(String key) async {
    final result = await dataSource.findRepoByKey(key);
    return result.fold((left) => [], (right) => right.toEntity());
  }
}
