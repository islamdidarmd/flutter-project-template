import 'package:flutter/material.dart';

class RotatedRectangleFab extends StatelessWidget {
  RotatedRectangleFab({
    Key? key,
    required this.child,
    required this.onPressed,
  }) : super(key: key);

  final Widget child;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: this.onPressed,
      child: Stack(
        children: [
          RotationTransition(
            turns: AlwaysStoppedAnimation(45 / 360),
            child: FloatingActionButton(
              mini: true,
              onPressed: this.onPressed,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          Positioned(
            bottom: 0.0,
            left: 0.0,
            top: 0.0,
            right: 0.0,
            child: this.child,
          )
        ],
      ),
    );
  }
}
