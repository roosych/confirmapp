import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_app/styles.dart';
import 'package:test_app/widgets/metak_button.dart';
import 'package:test_app/widgets/rich_text.dart';

class MoneyRequestDetail extends StatelessWidget {
  const MoneyRequestDetail({
    super.key,
    required this.requestsData,
  });

  final Map<String, dynamic> requestsData;

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
          'Pul tələbi',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 20,
          ),
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomRichTextWidget(
                    title: 'Mərhələ', text: requestsData['step']),
                const SizedBox(height: 10),
                CustomRichTextWidget(
                    title: 'Tələb nömrəsi',
                    text: requestsData['request_number'].toString()),
                const SizedBox(height: 10),
                CustomRichTextWidget(
                    title: 'Hesab nömrəsi',
                    text: requestsData['amount_number'].toString()),
                const SizedBox(height: 10),
                CustomRichTextWidget(
                    title: 'Tarix', text: requestsData['date']),
                const SizedBox(height: 10),
                CustomRichTextWidget(
                    title: 'Məbləğ',
                    text:
                        "${requestsData['mebleg'].toStringAsFixed(2)} ${requestsData['currency']} ~ ${requestsData['mebleg_azn'].toStringAsFixed(2)} AZN"),
                const SizedBox(height: 10),
                CustomRichTextWidget(
                    title: 'Fəaliyyət sahəsi', text: requestsData['field']),
                const SizedBox(height: 10),
                CustomRichTextWidget(
                    title: 'Əməliyyat tipi',
                    text: requestsData['operation_type']),
                const SizedBox(height: 10),
                CustomRichTextWidget(
                    title: 'Tələbi yaradan', text: requestsData['creator']),
                const SizedBox(height: 10),
                CustomRichTextWidget(title: 'Qeyd', text: requestsData['note']),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 40, left: 5, right: 5),
              child: Row(
                children: <Widget>[
                  const SizedBox(width: 10),
                  Expanded(
                    child: MetakButton(
                      onPressed: () {},
                      width: double.infinity,
                      bgColor: metakGreen,
                      child: const Text(
                        'Təsdiq',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: MetakButton(
                      onPressed: () {},
                      width: double.infinity,
                      bgColor: metakRed,
                      child: const Text(
                        'İmtina',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
