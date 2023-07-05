// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:test_app/styles.dart';

class NotificationSettingsScreen extends StatefulWidget {
  const NotificationSettingsScreen({super.key});

  @override
  State<NotificationSettingsScreen> createState() =>
      _NotificationSettingsScreenState();
}

class _NotificationSettingsScreenState
    extends State<NotificationSettingsScreen> {
  List<UserNotificationModel> userNotifications = [];

  @override
  void initState() {
    super.initState();
    getUserNotifications();
  }

  void getUserNotifications() async {
    // final response = await http.get(
    //   Uri.parse("http://localhost:8000/"),
    // );
    // final metadata = PetHealthsMetadata.fromJson(jsonDecode(response.body));
    //This above is the same where you get the data

    final notifications = [
      UserNotificationModel(id: 1, title: 'Satınalma', status: false),
      UserNotificationModel(id: 1, title: 'Pul', status: false),
    ];
    setState(() => userNotifications = notifications);
  }

  void setUserNotification(userId, id, status) {
    final params = {"id": id, "user_id": userId, "status": status};
    print(params);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10),
        const Text(
          'Bildirişlər',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 20),
        userNotifications.isNotEmpty
            ? Container(
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
                child: Column(
                  children: userNotifications.map((notification) {
                    return CheckboxListTile(
                        contentPadding:
                            const EdgeInsets.only(left: 15, right: 5),
                        side: const BorderSide(
                          width: 1,
                          color: Color(0xffb4b5b5),
                        ),
                        checkColor: metakRed,
                        activeColor: metakGrey.withOpacity(0.1),
                        tileColor: Colors.white,
                        title: Text(
                          notification.title,
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                        value: notification.isSelected,
                        onChanged: (bool? value) {
                          setState(() {
                            notification.isSelected = value!;
                          });
                          //send post data to server
                          setUserNotification(
                              100641, notification.id, notification.isSelected);
                        });
                  }).toList(),
                ),
              )
            : Container(),
      ],
    );
  }
}

class UserNotificationModel {
  final int id;
  final String title;
  final bool status;
  bool isSelected;

  UserNotificationModel({
    required this.id,
    required this.title,
    required this.status,
    this.isSelected = true,
  });

  factory UserNotificationModel.fromJson(Map<String, dynamic> json) =>
      UserNotificationModel(
        id: json["id"],
        title: json["title"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "status": status,
      };
}
