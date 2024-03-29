import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'constants.dart';

import 'flutter_app.dart';
import 'service_locator.dart';

enum EnvType { Development, Production }

class Env {
  final EnvType envType = defaultEnv;
  final String appName = defaultAppName;

  void init({required GetIt slInstance}) {
    WidgetsFlutterBinding.ensureInitialized();
    setUpDependencies(slInstance: slInstance);
  }

  void startApplication() {
    runApp(
      FlutterApp(
        envType: envType,
        appName: appName,
      ),
    );
  }
}
