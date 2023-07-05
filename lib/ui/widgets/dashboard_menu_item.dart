import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:badges/badges.dart' as badges;
import 'package:test_app/ui/theme/app_theme.dart';

class DashboardMenuItem extends StatelessWidget {
  final int? count;
  final String title;
  final String routeName;
  final String iconPath;
  final bool showBadge;

  const DashboardMenuItem({
    super.key,
    required this.count,
    required this.title,
    required this.routeName,
    required this.iconPath,
    required this.showBadge,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: br8,
          boxShadow: const [
            BoxShadow(
              color: Color.fromARGB(255, 240, 240, 240),
              blurRadius: 12.0,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: InkWell(
          splashColor: Colors.grey.withOpacity(0.1),
          borderRadius: br8,
          onTap: () {
            Navigator.pushNamed(context, routeName);
          },
          child: Padding(
            padding:
                const EdgeInsets.only(top: 10, bottom: 10, left: 14, right: 14),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                badges.Badge(
                  position: badges.BadgePosition.topEnd(top: -12, end: -12),
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
                      colors: [Color(0xffed1c24), metakSemiRed],
                      begin: Alignment.centerRight,
                      end: Alignment.centerLeft,
                    ),
                  ),
                  child: SvgPicture.asset(
                    iconPath,
                    width: 50,
                  ),
                ),
                const SizedBox(width: 20),
                Text(
                  title,
                  style: const TextStyle(
                      fontWeight: FontWeight.w500, fontSize: 20),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
