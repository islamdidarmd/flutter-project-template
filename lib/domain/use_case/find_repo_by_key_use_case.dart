import 'package:either_dart/either.dart';
import 'package:flutter_project_template/domain/core/error/app_error.dart';

import '../core/usecase/base_use_case.dart';
import '../repository/github_repository.dart';
import '../entity/repository.dart';

class FindRepoByKeyUseCase
    extends BaseUseCase<String, Future<Either<AppError, List<Repository>>>> {
  final GithubRepository repository;

  FindRepoByKeyUseCase({required this.repository});

  @override
  Future<Either<AppError, List<Repository>>> call(String param) async {
    return await repository.findRepoByKey(param);
  }
}
