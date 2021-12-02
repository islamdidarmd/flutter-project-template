import '../entity/repository.dart';

abstract class GithubRepository {
  Future<List<Repository>> findRepoByKey(String key);
}
