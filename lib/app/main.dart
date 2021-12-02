import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(FlutterApp());
}

class FlutterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _createApp();
  }

  Widget _createApp() {
    return MaterialApp(
      title: 'Flutter App',
      themeMode: ThemeMode.light,
      initialRoute: initialRoute,
      routes: appRoutes,
    );
  }
}
