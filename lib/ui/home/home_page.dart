import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project_template/app/service_locator.dart';
import 'package:flutter_project_template/domain/domain.dart';
import 'package:flutter_project_template/ui/home/home_cubit.dart';
import 'package:flutter_project_template/ui/home/home_page_content.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  static const ROUTE = "/home";

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<HomeCubit>(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Home'),
        ),
        body: Padding(
          padding: EdgeInsets.all(16),
          child: HomePageContent(),
        ),
      ),
    );
  }
}
