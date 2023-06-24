// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_app/styles.dart';
import 'package:test_app/widgets/money_rich_text.dart';

class BalanceScreen extends StatelessWidget {
  const BalanceScreen({super.key});

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
          'Balans',
          overflow: TextOverflow.fade,
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: IconButton(
              onPressed: () {
                print('Refresh data...');
              },
              icon: SvgPicture.asset(
                'asset/images/reload.svg',
                width: 22,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Kassada ümumi qalıq',
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 20),
                      ),
                      const SizedBox(height: 5),
                      const MoneyRichTextWidget(
                        value: '124,524',
                        symbol: 'AZN',
                        valueFontSize: 26,
                        currencyFontSize: 16,
                      ),
                      Divider(
                        color: metakGrey.withOpacity(0.2),
                      ),
                      const MoneyRichTextWidget(
                        value: '254,075',
                        symbol: 'RUB',
                        valueFontSize: 20,
                        currencyFontSize: 16,
                      ),
                      const MoneyRichTextWidget(
                        value: '75,854',
                        symbol: 'USD',
                        valueFontSize: 20,
                        currencyFontSize: 16,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(top: 0, bottom: 0, left: 16, right: 16),
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
                  title: const Text(
                    'Kassalar üzrə qalıqlar',
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                  ),
                  children: [
                    // Padding(
                    //   padding:
                    //       const EdgeInsetsDirectional.symmetric(horizontal: 16),
                    //   child: Divider(
                    //     color: metakGrey.withOpacity(0.2),
                    //   ),
                    // ),
                    Padding(
                      padding: const EdgeInsets.only(
                          right: 16, left: 16, bottom: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'AZN',
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.w600),
                          ),
                          const Row(
                            children: [
                              Text(
                                'Baş ofis',
                                style: TextStyle(fontSize: 18),
                              ),
                              Spacer(),
                              Text(
                                '105,458',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w600),
                              )
                            ],
                          ),
                          const Row(
                            children: [
                              Text(
                                'Langu',
                                style: TextStyle(fontSize: 18),
                              ),
                              Spacer(),
                              Text(
                                '23,854',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w600),
                              )
                            ],
                          ),
                          const Row(
                            children: [
                              Text(
                                'Balaxanı',
                                style: TextStyle(fontSize: 18),
                              ),
                              Spacer(),
                              Text(
                                '48,854',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w600),
                              )
                            ],
                          ),
                          const Row(
                            children: [
                              Text(
                                'Satış',
                                style: TextStyle(fontSize: 18),
                              ),
                              Spacer(),
                              Text(
                                '95,523',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w600),
                              )
                            ],
                          ),
                          Divider(
                            color: metakGrey.withOpacity(0.2),
                          ),
                          const Text(
                            'USD',
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.w600),
                          ),
                          const Row(
                            children: [
                              Text('Baş ofis', style: TextStyle(fontSize: 18)),
                              Spacer(),
                              Text(
                                '102,236',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w600),
                              )
                            ],
                          ),
                          Divider(
                            color: metakGrey.withOpacity(0.2),
                          ),
                          const Text(
                            'RUB',
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.w600),
                          ),
                          const Row(
                            children: [
                              Text('Baş ofis', style: TextStyle(fontSize: 18)),
                              Spacer(),
                              Text(
                                '315,745',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w600),
                              )
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
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
                child: const Padding(
                  padding:
                      EdgeInsets.only(top: 10, bottom: 10, left: 14, right: 14),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hesablarda ümumi qalıq',
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 20),
                      ),
                      SizedBox(height: 5),
                      MoneyRichTextWidget(
                        value: '68,981',
                        symbol: 'AZN',
                        valueFontSize: 28,
                        currencyFontSize: 16,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
