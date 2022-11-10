import 'env.dart';

void main() async {
  final env = ProductionEnv();
  env.init();
  env.startApplication();
}

class ProductionEnv extends Env {
  @override
  EnvType get envType => EnvType.Production;

  @override
  String get appName => "Demo App";
}
