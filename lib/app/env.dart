import 'package:flutter/material.dart';

import 'flutter_app.dart';
import 'service_locator.dart';

enum EnvType { Development, Production }

class Env {
  final EnvType envType = EnvType.Development;
  final String appName = "Flutter App";

  void init() {
    WidgetsFlutterBinding.ensureInitialized();
    setUpDependencies();
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
