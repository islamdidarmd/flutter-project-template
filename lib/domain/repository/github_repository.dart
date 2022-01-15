import 'package:either_dart/either.dart';
import 'package:flutter_project_template/domain/core/error/app_error.dart';

import '../entity/repository.dart';

abstract class GithubRepository {
  Future<Either<AppError, List<Repository>>> findRepoByKey(String key);
}
