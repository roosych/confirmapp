import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:test_app/styles.dart';

class DashboardMenuChildWidget extends StatelessWidget {
  final String title;
  final int? count;
  final String routeName;
  final bool showBadge;
  const DashboardMenuChildWidget({
    super.key,
    required this.title,
    required this.count,
    required this.routeName,
    required this.showBadge,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: InkWell(
        borderRadius: br8,
        child: ListTile(
          shape: RoundedRectangleBorder(
            borderRadius: br8,
          ),
          onTap: () {
            Navigator.pushNamed(context, routeName);
            // ignore: avoid_print
            //print(routeName);
          },
          title: Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
          ),
          trailing: badges.Badge(
            showBadge: showBadge,
            badgeContent: Text(
              '$count',
              style: const TextStyle(fontSize: 18, color: Colors.white),
            ),
            badgeAnimation: const badges.BadgeAnimation.fade(
              animationDuration: Duration(seconds: 1),
              colorChangeAnimationDuration: Duration(seconds: 1),
              loopAnimation: false,
              curve: Curves.fastOutSlowIn,
              colorChangeAnimationCurve: Curves.easeInCubic,
            ),
            badgeStyle: badges.BadgeStyle(
              shape: badges.BadgeShape.square,
              borderRadius: BorderRadius.circular(5),
              padding: const EdgeInsets.all(4),
              badgeGradient: const badges.BadgeGradient.linear(
                colors: [metakRed, metakSemiRed],
                begin: Alignment.centerRight,
                end: Alignment.centerLeft,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
