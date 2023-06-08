import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_app/styles.dart';

class EmptyResultsWidget extends StatelessWidget {
  final String title;
  final String iconPath;
  const EmptyResultsWidget(
      {super.key, required this.title, required this.iconPath});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            iconPath,
            width: 60,
          ),
          const SizedBox(height: 15),
          Text(
            title,
            style: const TextStyle(fontSize: 16, color: metakGrey),
          ),
        ],
      ),
    );
  }
}
