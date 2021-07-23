import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project_template/util/logger.dart';

class FlutterBlocObserver extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    Log.info("onCreate: ${bloc.runtimeType}");
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    Log.info("onEvent: ${event.runtimeType} => ${bloc.runtimeType}");
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    Log.info("onChange: $change => ${bloc.runtimeType}");
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    Log.info("onTransition: $transition => ${bloc.runtimeType}");
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    Log.info("onError: $error => ${bloc.runtimeType}");
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    Log.info("onClose: ${bloc.runtimeType}");
  }
}
