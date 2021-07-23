import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class GradientBackground extends StatelessWidget {
  final Widget child;
  final bool fillSafeArea;
  final EdgeInsets padding;

  const GradientBackground({
    Key? key,
    required this.child,
    this.fillSafeArea = true,
    this.padding = EdgeInsets.zero,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: this.padding,
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          theme.colorScheme.primaryVariant,
          theme.colorScheme.primary,
          theme.colorScheme.secondaryVariant,
          theme.colorScheme.secondary,
        ], begin: Alignment.bottomLeft, end: Alignment.topRight),
      ),
      child: fillSafeArea ? SafeArea(child: this.child) : this.child,
    );
  }
}
