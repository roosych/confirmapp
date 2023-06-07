import 'package:flutter/material.dart';
import 'package:test_app/styles.dart';

class MetakButton extends StatelessWidget {
  final double? width;
  final double height;
  final Color? bgColor;
  final VoidCallback? onPressed;
  final Widget child;

  const MetakButton({
    Key? key,
    required this.onPressed,
    required this.child,
    this.width,
    this.height = 50.0,
    this.bgColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: br8,
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(borderRadius: br8),
        ),
        child: child,
      ),
    );
  }
}
