// ignore_for_file: avoid_print

import 'package:awesome_bottom_bar/awesome_bottom_bar.dart';
import 'package:awesome_bottom_bar/widgets/inspired/inspired.dart';
import 'package:boxicons/boxicons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_app/screens/notifications_settings_screen.dart';
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
    const NotificationSettingsScreen(),
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
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: IconButton(
              onPressed: () => showDialog<String>(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  backgroundColor: Colors.white,
                  title: const Text(
                    'Çıxış etməyə əminsiniz?',
                    style: TextStyle(fontSize: 18),
                  ),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text(
                        'Xeyr',
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                    ),
                    TextButton(
                      onPressed: () => print('Logout process...'),
                      child: const Text(
                        'Bəli',
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ),
              icon: SvgPicture.asset(
                'asset/images/logout.svg',
                width: 22,
              ),
            ),
          ),
        ],
      ),
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
        SizedBox(height: 10),
        Text(
          'Salam, Aydın Kərimov!',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        ),
        SizedBox(height: 20),

        DashboardMenuParentWidget(
          count: 13,
          showBadge: true,
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
          count: 19,
          showBadge: true,
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
              title: 'Xərclər',
              count: 17,
              routeName: '/money-spending',
              showBadge: true,
            ),
          ],
        ),
        DashboardMenuItem(
          count: null,
          title: 'Balans',
          routeName: 'balance',
          iconPath: 'asset/images/safe.svg',
          showBadge: false,
        ),
        // DashboardMenuItem(
        //   count: 12,
        //   title: 'Отпуска',
        //   routeName: '/vacations',
        //   iconPath: 'asset/images/holiday.svg',
        //   showBadge: true,
        // ),
        // DashboardMenuItem(
        //   count: null,
        //   title: 'Зарплата',
        //   routeName: '/salary',
        //   iconPath: 'asset/images/salary2.svg',
        //   showBadge: false,
        // ),
      ],
    );
  }
}
