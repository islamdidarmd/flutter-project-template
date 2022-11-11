import 'package:flutter/material.dart';
import 'package:flutter_project_template/app/env.dart';
import 'routes.dart';

class FlutterApp extends StatelessWidget {
  final String appName;
  final EnvType envType;

  const FlutterApp({
    required this.appName,
    required this.envType,
  });

  @override
  Widget build(BuildContext context) {
    return _createApp();
  }

  Widget _createApp() {
    return MaterialApp(
      title: appName,
      themeMode: ThemeMode.light,
      initialRoute: initialRoute,
      routes: appRoutes,
    );
  }
}
