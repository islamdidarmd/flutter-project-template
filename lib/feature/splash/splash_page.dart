import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project_template/feature/authentication/bloc/auth_bloc.dart';
import 'package:flutter_project_template/feature/authentication/bloc/auth_event.dart';
import 'package:flutter_project_template/feature/authentication/bloc/auth_state.dart';
import 'package:flutter_project_template/feature/home/home_page.dart';
import 'package:flutter_project_template/feature/login/login_page.dart';
import 'package:flutter_project_template/widget/gradient_background.dart';

class SplashPage extends StatelessWidget {
  static const ROUTE = "/splash";

  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBackground(
        child: Center(
          child: BlocListener<AuthBloc, AuthState>(
            listener: (context, state) {
              if (state is AuthAuthenticatedState) {
                Navigator.popAndPushNamed(context, HomePage.ROUTE);
              } else if (state is AuthUnAuthenticatedState) {
                Navigator.popAndPushNamed(context, LoginPage.ROUTE);
              }
            },
            child: SplashScreenContentWidget(),
          ),
        ),
      ),
    );
  }
}

class SplashScreenContentWidget extends StatelessWidget {
  const SplashScreenContentWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration.zero).then((value) {
      final bloc = BlocProvider.of<AuthBloc>(context);
      bloc.add(CheckAuthStateEvent());
    });
    return Image.asset('assets/icon/app_logo.png', height: 140, width: 140);
  }
}
