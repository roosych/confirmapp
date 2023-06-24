import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_app/styles.dart';
import 'package:test_app/widgets/dashboard_menu_child.dart';
import 'package:badges/badges.dart' as badges;

class DashboardMenuParentWidget extends StatelessWidget {
  final String title;
  final String image;
  final int? count;
  final bool showBadge;

  final List<DashboardMenuChildWidget> childWidgets;
  const DashboardMenuParentWidget({
    super.key,
    required this.title,
    required this.image,
    required this.childWidgets,
    this.count,
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
        child: ExpansionTile(
          trailing: SvgPicture.asset(
            'asset/images/chevron-down.svg',
            width: 20,
          ),
          backgroundColor: Colors.white,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              badges.Badge(
                position: badges.BadgePosition.topEnd(top: -12, end: -12),
                showBadge: true,
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
                  image,
                  width: 50,
                ),
              ),
              const SizedBox(width: 20),
              Text(
                title,
                style:
                    const TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
              ),
            ],
          ),
          children: childWidgets,
        ),
      ),
    );
  }
}
