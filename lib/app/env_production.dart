import 'package:flutter_project_template/app/constants.dart';
import 'package:get_it/get_it.dart';

import 'env.dart';

void main() async {
  final env = ProductionEnv();
  env.init(slInstance: GetIt.instance);
  env.startApplication();
}

class ProductionEnv extends Env {
  @override
  EnvType get envType => prodEnv;

  @override
  String get appName => prodAppName;
}
