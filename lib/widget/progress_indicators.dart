import 'package:flutter/material.dart';

class AdaptiveCircularProgressIndicator extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator.adaptive(
        backgroundColor: Colors.white,
      ),
    );
  }
}