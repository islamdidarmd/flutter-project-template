import 'package:flutter_project_template/app/constants.dart';
import 'package:flutter_project_template/app/env.dart';
import 'package:flutter_project_template/app/env_production.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final Env env = ProductionEnv();

  test('Production env fields', () {
    assert(env.envType == prodEnv);
    assert(env.appName == prodAppName);
  });
}
