import 'env.dart';

void main() async {
  final env = DevelopmentEnv();
  env.init();
  env.startApplication();
}

class DevelopmentEnv extends Env {
  @override
  EnvType get envType => EnvType.Development;

  @override
  String get appName => "Demo App Dev";
}
