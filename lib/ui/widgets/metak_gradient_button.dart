import 'package:flutter/material.dart';
import 'package:test_app/ui/theme/app_theme.dart';

class MetakGradientButton extends StatelessWidget {
  final double? width;
  final double height;
  final LinearGradient? gradient;
  final VoidCallback? onPressed;
  final Widget child;

  const MetakGradientButton({
    Key? key,
    required this.onPressed,
    required this.child,
    this.width,
    this.height = 50.0,
    this.gradient = const LinearGradient(colors: [metakSemiRed, metakRed]),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        gradient: gradient,
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
