import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project_template/common/bloc/bloc_observer.dart';
import 'package:flutter_project_template/feature/authentication/bloc/auth_bloc.dart';
import 'package:flutter_project_template/feature/authentication/resource/user_repository.dart';
import 'package:flutter_project_template/theme/themes.dart';
import 'package:flutter_project_template/util/logger.dart';
import 'routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Log.init(shouldLog: true);
  Bloc.observer = FlutterBlocObserver();
  runApp(FlutterApp());
}

class FlutterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: _getRepositoryProviders(),
      child: MultiBlocProvider(
        providers: _getBlocProviders(),
        child: _createApp(),
      ),
    );
  }

  List<RepositoryProvider> _getRepositoryProviders() {
    return [
      RepositoryProvider<UserRepository>(
        create: (context) => UserRepository(),
      ),
    ];
  }

  List<BlocProvider> _getBlocProviders() {
    return [
      BlocProvider<AuthBloc>(
        create: (BuildContext context) => AuthBloc(),
      )
    ];
  }

  Widget _createApp() {
    return MaterialApp(
      title: 'Flutter App',
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: ThemeMode.light,
      initialRoute: initialRoute,
      routes: appRoutes,
    );
  }
}
