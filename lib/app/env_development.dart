import 'package:get_it/get_it.dart';

import 'env.dart';

void main() async {
  final env = DevelopmentEnv();
  env.init(slInstance: GetIt.instance);
  env.startApplication();
}

class DevelopmentEnv extends Env {
  @override
  EnvType get envType => EnvType.Development;

  @override
  String get appName => "Demo App Dev";
}
