import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:badges/badges.dart' as badges;
import 'package:test_app/screens/procurement/orders/procurement_orders_group.dart';
import 'package:test_app/styles.dart';
import 'package:test_app/widgets/empty_results.dart';

class ProcurementOrdersScreen extends StatelessWidget {
  ProcurementOrdersScreen({super.key});

  final List<Map<String, dynamic>> ordersData = [
    {
      'id': 1,
      'step': 'Rəhbərlik',
      'type': 'Kompyüter avadanlıqları',
      'number': 032548,
      'vendor': 'Baku Electronics',
      'date': '02.03.2023',
      'amount': 250.40,
      'currency': 'USD',
      'amount_azn': 425.13,
      'vendor_activity': 'Elektronika və məişət avadanlığı',
      'creator': 'Seymur Şirinov',
      'payment_terms': '50 % öncədən ödəniş',
      'scpec_number': 658,
      'note': 'Canon printeri üçün kartric dəsti',
      //временное свойство count
      'count': 1,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: SvgPicture.asset(
            'asset/images/chevron-l.svg',
            width: 20,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        toolbarHeight: 80,
        centerTitle: true,
        surfaceTintColor: Colors.transparent,
        title: const Text(
          'Satınalma sifarişləri',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 22,
          ),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () async {},
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: ordersData.isNotEmpty
                ? ListView.builder(
                    itemCount: ordersData.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 14),
                        child: InkWell(
                          borderRadius: br8,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProcurementOrdersGroup(
                                  ordersData: ordersData[index],
                                ),
                              ),
                            );
                          },
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
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 10, bottom: 10, left: 14, right: 14),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(
                                    child: Text(
                                      ordersData[index]['creator'],
                                      overflow: TextOverflow.fade,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 15),
                                  badges.Badge(
                                    position: badges.BadgePosition.topEnd(
                                        top: -12, end: -12),
                                    showBadge: true,
                                    badgeContent: Text(
                                      ordersData[index]['count'].toString(),
                                      style: const TextStyle(
                                          fontSize: 18, color: Colors.white),
                                    ),
                                    badgeAnimation:
                                        const badges.BadgeAnimation.fade(
                                      animationDuration: Duration(seconds: 1),
                                      colorChangeAnimationDuration:
                                          Duration(seconds: 1),
                                      loopAnimation: false,
                                      curve: Curves.fastOutSlowIn,
                                      colorChangeAnimationCurve:
                                          Curves.easeInCubic,
                                    ),
                                    badgeStyle: badges.BadgeStyle(
                                      shape: badges.BadgeShape.square,
                                      borderRadius: BorderRadius.circular(5),
                                      padding: const EdgeInsets.all(4),
                                      badgeGradient:
                                          const badges.BadgeGradient.linear(
                                        colors: [metakRed, metakSemiRed],
                                        begin: Alignment.centerRight,
                                        end: Alignment.centerLeft,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  )
                : const EmptyResultsWidget(title: 'Satınalma sifarişləri yoxdur', iconPath: 'asset/images/empty.svg',),
          ),
        ),
      ),
    );
  }
}
