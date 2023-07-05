import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:badges/badges.dart' as badges;
import 'package:test_app/data/models/procurement/procurement_request_model.dart';
import 'package:test_app/ui/screens/procurement/requests/procurement_request_dept.dart';
import 'package:test_app/ui/theme/app_theme.dart';
import 'package:test_app/ui/widgets/empty_results.dart';

class ProcurementRequestsScreen extends StatelessWidget {
  ProcurementRequestsScreen({super.key});

  final List<ProcurementRequest> procurementRequests = [
    ProcurementRequest(
        1,
        'Rəhbərlik',
        'Cari qulluq və avadanlıq təmiri',
        021545,
        12345,
        'Tros 024',
        33,
        'M',
        '02.03.2023',
        'Hakim Sarıyev',
        'Energetika departamenti',
        'İmanquli İmanquliyev',
        'KP 300kranı üçün'),
    ProcurementRequest(
        2,
        'Rəhbərlik',
        'Cari qulluq və avadanlıq təmiri',
        032548,
        45876,
        'Kartric',
        1,
        'ƏD',
        '02.03.2023',
        'Sergey Yejov',
        'İnformasiya Texnoloqiyaları Departamenti',
        'Seymur Şirinov',
        'Canon printeri üçün kartric dəsti')
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
            fontSize: 20,
          ),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () async {},
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: procurementRequests.isNotEmpty
                ? ListView.builder(
                    itemCount: procurementRequests.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 14),
                        child: InkWell(
                          splashColor: metakGrey.withOpacity(0.1),
                          borderRadius: br8,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProcurementRequestDept(
                                  procurementRequest:
                                      procurementRequests[index],
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
                                      procurementRequests[index].department,
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
                                    badgeContent: const Text(
                                      //requestsData[index]['count'].toString(),
                                      '3',
                                      style: TextStyle(
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
