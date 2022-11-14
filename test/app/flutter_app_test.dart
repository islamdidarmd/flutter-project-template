import 'package:flutter_project_template/app/constants.dart';
import 'package:flutter_project_template/app/flutter_app.dart';
import 'package:flutter_project_template/app/service_locator.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';

void main() {
  final sl = GetIt.asNewInstance();
  setUp(() {
    setUpDependencies(slInstance: sl);
  });

  testWidgets('App runs and Homepage shows', (widgetTester) async {
    await widgetTester
        .pumpWidget(FlutterApp(appName: defaultAppName, envType: defaultEnv));
    final titleFinder = find.text("Home");
    expect(titleFinder, findsOneWidget);
  });

  tearDown(() {
    sl.reset();
  });
}
