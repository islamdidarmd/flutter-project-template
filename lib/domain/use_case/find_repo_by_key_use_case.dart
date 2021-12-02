import 'package:flutter_project_template/core/usecase/base_use_case.dart';
import '../repository/github_repository.dart';
import '../entity/repository.dart';

class FindRepoByKeyUseCase
    extends BaseUseCase<String, Future<List<Repository>>> {
  final GithubRepository repository;

  FindRepoByKeyUseCase({required this.repository});

  @override
  Future<List<Repository>> call(String param) async {
    return await repository.findRepoByKey(param);
  }
}
