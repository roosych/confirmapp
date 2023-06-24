import 'package:boxicons/boxicons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:test_app/models/procurement/procurement_request_model.dart';
import 'package:test_app/screens/procurement/requests/procurement_request_detail.dart';
import 'package:test_app/styles.dart';
import 'package:test_app/widgets/rich_text.dart';

class ProcurementRequestDept extends StatelessWidget {
  const ProcurementRequestDept({
    super.key,
    required this.procurementRequest,
  });

  final ProcurementRequest procurementRequest;

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
        title: Text(
          procurementRequest.department,
          overflow: TextOverflow.fade,
          style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () async {},
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListView.builder(
              //временное значение count
              itemCount: 2,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: InkWell(
                    borderRadius: br8,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProcurementRequestDetail(
                            procurementRequest: procurementRequest,
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
                      child: Slidable(
                        closeOnScroll: false,
                        key: const ValueKey(0),

                        // The end action pane is the one at the right or the bottom side.
                        endActionPane: ActionPane(
                          motion: const ScrollMotion(),
                          children: [
                            SlidableAction(
                              // An action can be bigger than the others.
                              flex: 1,
                              // ignore: avoid_print
                              onPressed: (context) {
                                // ignore: avoid_print
                                print(procurementRequest.id);
                              },
                              backgroundColor: metakGreen,
                              foregroundColor: Colors.white,
                              icon: Boxicons.bx_check_circle,
                            ),
                            SlidableAction(
                              borderRadius: const BorderRadius.only(
                                  topRight: Radius.circular(8),
                                  bottomRight: Radius.circular(8)),
                              onPressed: (context) {
                                // ignore: avoid_print
                                print(procurementRequest.id);
                              },
                              backgroundColor: metakRed,
                              foregroundColor: Colors.white,
                              icon: Boxicons.bx_x_circle,
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 10, bottom: 10, left: 10, right: 5),
                          child: Stack(
                            alignment: Alignment.centerRight,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          procurementRequest.date,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                            color: metakRed,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                    ],
                                  ),
                                  const SizedBox(height: 4),
                                  CustomRichTextWidget(
                                      title: 'Tip',
                                      text: procurementRequest.type),
                                  const SizedBox(height: 4),
                                  CustomRichTextWidget(
                                      title: 'Material',
                                      text: procurementRequest.materialTitle),
                                ],
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.grey.withOpacity(0.2),
                                    borderRadius: br8),
                                width: 2,
                                height: 40,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
