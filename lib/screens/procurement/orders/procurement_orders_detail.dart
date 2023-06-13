import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_app/styles.dart';
import 'package:test_app/widgets/metak_button.dart';
import 'package:test_app/widgets/rich_text.dart';

class ProcurementOrdersDetail extends StatelessWidget {
  const ProcurementOrdersDetail({
    super.key,
    required this.ordersData,
  });

  final Map<String, dynamic> ordersData;

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
          'Satınalma sifarişi',
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
                    title: 'Mərhələ', text: ordersData['step']),
                const SizedBox(height: 10),
                CustomRichTextWidget(
                    title: 'Sifariş tipi', text: ordersData['type']),
                const SizedBox(height: 10),
                CustomRichTextWidget(
                    title: 'Sifariş nömrəsi',
                    text: ordersData['number'].toString()),
                const SizedBox(height: 10),
                CustomRichTextWidget(
                    title: 'Sifarişi yaradan', text: ordersData['creator']),
                const SizedBox(height: 10),
                CustomRichTextWidget(title: 'Tarix', text: ordersData['date']),
                const SizedBox(height: 10),
                CustomRichTextWidget(
                    title: 'Vendor', text: ordersData['vendor']),
                const SizedBox(height: 10),
                CustomRichTextWidget(
                    title: 'Məbləğ',
                    text:
                        "${ordersData['amount'].toStringAsFixed(2)} ${ordersData['currency']} ~ ${ordersData['amount_azn'].toStringAsFixed(2)} AZN"),
                const SizedBox(height: 10),
                CustomRichTextWidget(
                    title: 'Ödəniş şərti', text: ordersData['payment_terms']),
                const SizedBox(height: 10),
                CustomRichTextWidget(
                    title: 'Spesifikasiya nömrəsi',
                    text: ordersData['scpec_number'].toString()),
                const SizedBox(height: 10),
                CustomRichTextWidget(title: 'Qeyd', text: ordersData['note']),
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
