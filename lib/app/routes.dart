import 'package:flutter_project_template/feature/home/home_page.dart';
import 'package:flutter_project_template/feature/login/login_page.dart';
import 'package:flutter_project_template/feature/signup/signup_page.dart';
import 'package:flutter_project_template/feature/splash/splash_page.dart';

final initialRoute = SplashPage.ROUTE;
final appRoutes = {
  SplashPage.ROUTE: (context) => SplashPage(),
  LoginPage.ROUTE: (context) => LoginPage(),
  SignupPage.ROUTE: (context) => SignupPage(),
  HomePage.ROUTE: (context) => HomePage(),
};
