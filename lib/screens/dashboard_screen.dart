import 'package:awesome_bottom_bar/awesome_bottom_bar.dart';
import 'package:awesome_bottom_bar/widgets/inspired/inspired.dart';
import 'package:boxicons/boxicons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_app/screens/notifications_screen.dart';
import 'package:test_app/styles.dart';
import 'package:test_app/widgets/dashboard_menu_child.dart';
import 'package:test_app/widgets/dashboard_menu_item.dart';
import 'package:test_app/widgets/dashboard_menu_parent.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int selectedTab = 0;
  void onSelectTab(index) {
    if (selectedTab == index) return;
    setState(() {
      selectedTab = index;
    });
  }

  static final List<Widget> _bottomMenuItems = <Widget>[
    const DashboardMenuWidget(),
    const Text(
      'Profil',
    ),
    const NotificationsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        centerTitle: true,
        surfaceTintColor: Colors.transparent,
        title: SvgPicture.asset(
          'asset/images/logo.svg',
          width: 165,
        ),
        // leading: Builder(
        //   builder: (context) => IconButton(
        //     splashColor: Colors.transparent,
        //     highlightColor: Colors.transparent,
        //     hoverColor: Colors.transparent,
        //     icon: const Icon(
        //       Boxicons.bx_menu_alt_left,
        //       color: Colors.grey,
        //       size: 30,
        //     ),
        //     onPressed: () => Scaffold.of(context).openDrawer(),
        //   ),
        // ),
        // actions: [
        //   IconButton(
        //     splashColor: Colors.transparent,
        //     highlightColor: Colors.transparent,
        //     hoverColor: Colors.transparent,
        //     icon: const Icon(
        //       Boxicons.bx_bell,
        //       color: Colors.grey,
        //       size: 30,
        //     ),
        //     onPressed: () => Scaffold.of(context).openDrawer(),
        //   ),
        // ],
      ),
      //drawer: const DrawerWidget(),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _bottomMenuItems[selectedTab],
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomBarInspiredInside(
        elevation: 10,
        height: 25,
        duration: const Duration(milliseconds: 300),
        iconSize: 24,
        chipStyle: const ChipStyle(convexBridge: true, background: metakRed),
        itemStyle: ItemStyle.circle,
        animated: true,
        color: Colors.grey,
        backgroundColor: Colors.white,
        colorSelected: Colors.white,
        indexSelected: selectedTab,
        items: const [
          TabItem(
            icon: Boxicons.bxs_dashboard,
          ),
          TabItem(
            icon: Boxicons.bx_user,
          ),
          TabItem(
            icon: Boxicons.bx_bell,
          ),
        ],
        onTap: onSelectTab,
      ),
    );
  }
}

class DashboardMenuWidget extends StatefulWidget {
  const DashboardMenuWidget({super.key});

  @override
  State<DashboardMenuWidget> createState() => _DashboardMenuWidgetState();
}

class _DashboardMenuWidgetState extends State<DashboardMenuWidget> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Salam, User!',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 20,
          ),
        ),
        SizedBox(height: 20),
        DashboardMenuParentWidget(
          image: 'asset/images/notes.svg',
          title: 'Satınalma',
          childWidgets: [
            DashboardMenuChildWidget(
              title: 'Tələblər',
              count: 3,
              routeName: '/procurement-requests',
              showBadge: true,
            ),
            DashboardMenuChildWidget(
              title: 'Sifarişlər',
              count: 10,
              routeName: '/procurement-orders',
              showBadge: true,
            ),
          ],
        ),
        DashboardMenuParentWidget(
          image: 'asset/images/money-bag.svg',
          title: 'Pul',
          childWidgets: [
            DashboardMenuChildWidget(
              title: 'Tələblər',
              count: 2,
              routeName: '/money-requests',
              showBadge: true,
            ),
            DashboardMenuChildWidget(
              title: 'Xərc',
              count: 17,
              routeName: '/money-spending',
              showBadge: true,
            ),
          ],
        ),
        DashboardMenuItem(
          count: null,
          title: 'Balans',
          routeName: '/balance',
          iconPath: 'asset/images/safe.svg',
          showBadge: false,
        ),
        DashboardMenuItem(
          count: 12,
          title: 'Məzuniyyət',
          routeName: '/vacations',
          iconPath: 'asset/images/holiday.svg',
          showBadge: true,
        ),
        DashboardMenuItem(
          count: null,
          title: 'ƏH təsdiqi',
          routeName: '/salary',
          iconPath: 'asset/images/salary2.svg',
          showBadge: false,
        ),
      ],
    );
  }
}
