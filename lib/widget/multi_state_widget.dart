import 'package:flutter/material.dart';

import 'progress_indicators.dart';

class MultiStateWidget extends StatelessWidget {
  static const int Loading = 0;
  static const int Content = 1;
  static const int Error = 2;

  const MultiStateWidget(
      {Key? key,
      required this.state,
      this.loadingWidget,
      this.contentWidget,
      this.errorWidget})
      : super(key: key);

  final int state;
  final Widget? loadingWidget;
  final Widget? contentWidget;
  final Widget? errorWidget;

  @override
  Widget build(BuildContext context) {
    Widget? content;

    switch (state) {
      case Loading:
        content = loadingWidget ?? AdaptiveCircularProgressIndicator();
        break;
      case Content:
        content = contentWidget ?? Container();
        break;
      case Error:
        content = errorWidget ?? ErrorWidget();
        break;
      default:
        content = Container();
    }
    return content;
  }
}

class ErrorWidget extends StatelessWidget {
  const ErrorWidget({Key? key, this.icon, this.message}) : super(key: key);

  final Widget? icon;
  final Widget? message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          icon ?? Icon(Icons.error, color: Theme.of(context).colorScheme.error),
          message ?? Text('Something went wrong')
        ],
      ),
    );
  }
}
