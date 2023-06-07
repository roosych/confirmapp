import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:badges/badges.dart' as badges;
import 'package:test_app/screens/procurement/requests/procurement_request_dept.dart';
import 'package:test_app/styles.dart';
import 'package:test_app/widgets/empty_results.dart';

class ProcurementRequestsScreen extends StatelessWidget {
  ProcurementRequestsScreen({super.key});

  final List<Map<String, dynamic>> requestsData = [
    {
      'id': 1,
      'step': 'Rəhbərlik',
      'type': 'Cari qulluq və avadanlıq təmiri',
      'number': '021545',
      'material_code': '12345',
      'material_title': 'Tros 024',
      'quantity': 77,
      'unit': 'M',
      'date': '02.03.2023',
      'owner': 'Hakim Sarıyev',
      'dept': 'Mühəndislik şöbəsi',
      'creator': 'İmanquli İmanquliyev',
      'note': 'KP 300kranı üçün',
      //временное свойство count
      'count': 1,
    },
    {
      'id': 2,
      'step': 'Rəhbərlik',
      'type': 'Cari qulluq və avadanlıq təmiri',
      'number': '032548',
      'material_code': '45876',
      'material_title': 'Kartric',
      'quantity': 1,
      'unit': 'ƏD',
      'date': '02.03.2023',
      'owner': 'Sergey Yejov',
      'dept': 'İnformasiya Texnoloqiyaları Departamenti',
      'creator': 'Seymur Şirinov',
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
          'Satınalma tələbləri',
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
                          splashColor: metakGrey.withOpacity(0.1),
                          borderRadius: br8,
                          onTap: () {
                            // Navigator.pushNamed(
                            //     context, '/procurement-request-dept');
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProcurementRequestDept(
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
                                      requestsData[index]['dept'],
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
                    title: 'Satınalma tələbləri yoxdur',
                    iconPath: 'asset/images/empty.svg',
                  ),
          ),
        ),
      ),
    );
  }
}
