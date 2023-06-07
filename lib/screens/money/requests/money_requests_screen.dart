import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:badges/badges.dart' as badges;
import 'package:test_app/screens/money/requests/money_request_amount.dart';
import 'package:test_app/styles.dart';
import 'package:test_app/widgets/empty_results.dart';

class MoneyRequestsScreen extends StatelessWidget {
  MoneyRequestsScreen({super.key});

  final List<Map<String, dynamic>> requestsData = [
    {
      'id': 1,
      'step': 'Rəhbərlik',
      'request_number': 00000124,
      'amount_number': 985678,
      'amount_title': 'Hesab 001',
      'date': '02.03.2023',
      'mebleg': 560.20,
      'currency': 'USD',
      'mebleg_azn': 952.34,
      'field': 'Kənd təsərrüfatı',
      'operation_type': 'Əməliyyat tipi 1',
      'creator': 'Rəşad Həsənov',
      'note': 'Təcili sorğu',
      //временное свойство count
      'count': 1,
    },
    {
      'id': 2,
      'step': 'Rəhbərlik',
      'request_number': 00000128,
      'amount_number': 254875,
      'amount_title': 'Hesab 005',
      'date': '22.10.2023',
      'mebleg': 100.00,
      'currency': 'USD',
      'mebleg_azn': 170.20,
      'field': 'Kənd təsərrüfatı',
      'operation_type': 'Əməliyyat tipi 2',
      'creator': 'Ruslan Kandıba',
      'note': 'без комментариев',
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
          'Pul tələbləri',
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
            child: requestsData.isNotEmpty
                ? ListView.builder(
                    itemCount: requestsData.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 14),
                        child: InkWell(
                          borderRadius: br8,
                          onTap: () {
                            // Navigator.pushNamed(
                            //     context, '/procurement-request-dept');
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MoneyRequestAmount(
                                  requestsData: requestsData[index],
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
                                      requestsData[index]['amount_title'],
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
                                      requestsData[index]['count'].toString(),
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
                : const EmptyResultsWidget(
                    title: 'Pul tələbləri yoxdur',
                    iconPath: 'asset/images/empty.svg',
                  ),
          ),
        ),
      ),
    );
  }
}
