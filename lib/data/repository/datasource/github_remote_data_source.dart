import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:flutter_project_template/app/service_locator.dart';
import 'package:flutter_project_template/domain/domain.dart';
import '../../model/models.dart';

abstract class GithubRemoteDataSource {
  Future<Either<AppError, RepoSearchResponse>> findRepoByKey(String key);
}

class GithubRemoteDataSourceImpl implements GithubRemoteDataSource {
  @override
  Future<Either<AppError, RepoSearchResponse>> findRepoByKey(String key) async {
    final dio = sl<Dio>();
    try {
      final response =
          await dio.get("https://api.github.com/search/repositories?q=$key");

      if (response.data != null) {
        final decoded = json.decode(response.toString());
        final parsed = RepoSearchResponse.fromJson(decoded);
        return Right(parsed);
      } else {
        return Left(
            AppError(type: ErrorType.Unknown, message: 'Unknown error'));
      }
    } catch (e) {
      return Left(AppError(type: ErrorType.Unknown, message: e.toString()));
    }
  }
}
