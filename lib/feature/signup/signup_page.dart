import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project_template/common/constants.dart';
import 'package:flutter_project_template/common/data/model/result.dart';
import 'package:flutter_project_template/feature/home/home_page.dart';
import 'package:flutter_project_template/feature/signup/bloc/sign_up_bloc.dart';
import 'package:flutter_project_template/util/ui_utils.dart';
import 'package:flutter_project_template/util/url_utils.dart';
import 'package:flutter_project_template/widget/gradient_background.dart';
import 'package:flutter_project_template/widget/input_field.dart';
import 'package:flutter_project_template/widget/multi_state_widget.dart';
import 'package:flutter_project_template/widget/rotated_rectangle_fab.dart';
import 'package:flutter_project_template/widget/top_bar.dart';

import 'bloc/sign_up_event.dart';
import 'bloc/sign_up_state.dart';

class SignupPage extends StatelessWidget {
  static const ROUTE = "/sign-up";

  SignupPage({Key? key}) : super(key: key);

  final _emailEditingController = TextEditingController();
  final _passwordEditingController = TextEditingController();
  final _rePasswordEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SignUpBloc>(
      create: (context) => SignUpBloc(),
      child: Scaffold(
        body: GradientBackground(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                TopBar(title: 'Sign Up'),
                SizedBox(height: 16),
                Expanded(
                  child: BlocConsumer<SignUpBloc, SignUpState>(
                    builder: _buildWidgetForState,
                    listener: _listenToAuthState,
                  ),
                ),
              ],
            )),
      ),
    );
  }

  Widget _buildWidgetForState(BuildContext context, SignUpState state) {
    int widgetState = MultiStateWidget.Content;
    Widget? child;

    if (state is SignUpLoadingState) {
      widgetState = MultiStateWidget.Loading;
    } else {
      child = _createForm(context);
    }

    return MultiStateWidget(
      state: widgetState,
      contentWidget: child,
    );
  }

  void _listenToAuthState(BuildContext context, SignUpState state) {
    if (state is SignUpSuccessState) {
      Future.delayed(Duration.zero).then(
        (value) => Navigator.pushNamedAndRemoveUntil(
          context,
          HomePage.ROUTE,
          (route) => false,
        ),
      );
    } else if (state is SignUpFailedState) {
      final error = state.data as Error;
      if (error.showSnackBar == true && error.info?.message != null) {
        showSnackbar(context, Text(error.info!.message!));
      }
    }
  }

  Widget _createForm(BuildContext context) {
    _passwordEditingController.clear();
    _rePasswordEditingController.clear();

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CredentialInputWidget(
          hint: 'Email',
          textEditingController: _emailEditingController,
          textInputAction: TextInputAction.next,
          prefixIcon: Icon(
            Icons.email,
            color: Theme.of(context).colorScheme.onPrimary,
          ),
        ),
        SizedBox(height: 8),
        CredentialInputWidget(
          hint: 'Password',
          textEditingController: _passwordEditingController,
          textInputAction: TextInputAction.next,
          prefixIcon: Icon(
            Icons.lock,
            color: Theme.of(context).colorScheme.onPrimary,
          ),
          obscureText: true,
        ),
        SizedBox(height: 8),
        CredentialInputWidget(
          hint: 'Repeat Password',
          textEditingController: _rePasswordEditingController,
          textInputAction: TextInputAction.next,
          prefixIcon: Icon(
            Icons.lock,
            color: Theme.of(context).colorScheme.onPrimary,
          ),
          obscureText: true,
        ),
        SizedBox(height: 16),
        _createTermsView(context),
        SizedBox(height: 16),
        SubmitButton(
          text: 'Sign Up',
          onPressed: () {
            final signUpBloc = BlocProvider.of<SignUpBloc>(context);
            if (!signUpBloc.isTermsAccepted) {
              showSnackbar(context, Text('Please Accept Terms'));
              return;
            }

            signUpBloc.add(EmailPassSignUpEvent(
              email: _emailEditingController.text,
              password: _passwordEditingController.text,
              rePassword: _rePasswordEditingController.text,
            ));
          },
        ),
      ],
    );
  }

  Widget _createTermsView(BuildContext context) {
    final signUpBloc = BlocProvider.of<SignUpBloc>(context);
    return Row(
      children: [
        Checkbox(
          value: signUpBloc.isTermsAccepted,
          onChanged: (newValue) {
            signUpBloc.add(TermsClickedEvent(isAccepted: newValue ?? false));
          },
        ),
        SizedBox(width: 4),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('I Accept Terms'),
              RotatedRectangleFab(
                onPressed: () async {
                  final isLaunched = await launchUrl(AppConstants.terms_url);
                  if (!isLaunched)
                    showSnackbar(context, Text('Unable to open url'));
                },
                child: Icon(Icons.arrow_forward),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
