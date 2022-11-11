import 'package:flutter_project_template/app/constants.dart';
import 'package:flutter_project_template/app/env.dart';
import 'package:flutter_project_template/app/env_development.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final Env env = DevelopmentEnv();

  test('Development env fields', () {
    assert(env.envType == devEnv);
    assert(env.appName == devAppName);
  });
}
