import 'package:flutter/material.dart';
import 'package:flutter_project_template/widget/gradient_background.dart';
import 'package:flutter_project_template/widget/top_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  static const ROUTE = "/home";

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: GradientBackground(
        padding: EdgeInsets.all(16),
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              child: Column(
                children: [
                  TopBar(title: 'Welcome', canGoBack: false),
                  SizedBox(height: 16),
                  Expanded(
                    child: Text('Logged In'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
