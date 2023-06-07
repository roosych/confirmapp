import 'package:flutter/material.dart';
import 'package:test_app/widgets/empty_results.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: MediaQuery.of(context).size.height * 0.25),
        const EmptyResultsWidget(
          title: 'Bildirişlər yoxdur',
          iconPath: 'asset/images/notify.svg',
        ),
      ],
    );
  }
}
