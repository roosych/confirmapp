import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_app/styles.dart';
import 'package:test_app/widgets/dashboard_menu_child.dart';

class DashboardMenuParentWidget extends StatelessWidget {
  final String title;
  final String image;
  final List<DashboardMenuChildWidget> childWidgets;
  const DashboardMenuParentWidget({
    super.key,
    required this.title,
    required this.image,
    required this.childWidgets,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
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
        child: ClipRRect(
          borderRadius: br8,
          child: ExpansionTile(
            trailing: SvgPicture.asset(
              'asset/images/chevron-down.svg',
              width: 20,
            ),
            backgroundColor: Colors.white,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SvgPicture.asset(
                  image,
                  width: 50,
                ),
                const SizedBox(width: 15),
                Text(
                  title,
                  style: const TextStyle(
                      fontWeight: FontWeight.w500, fontSize: 20),
                ),
              ],
            ),
            children: childWidgets,
          ),
        ),
      ),
    );
  }
}
