import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_notification_tutorial/main.dart';

class Notification01 extends StatefulWidget {
  const Notification01({Key? key}) : super(key: key);

  @override
  State<Notification01> createState() => _Notification01();
}

class _Notification01 extends State<Notification01> {
  Future<void> _showNotification() async {
    const AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(
      'nextflow_noti_001',
      // * type การแจ้งเตือน
      'แจ้งเตือนทั่วไป',
      importance: Importance.max,
      priority: Priority.high,
      // * รองรับ Android รุ่นเก่า
      ticker: 'ticker',
    );
    const NotificationDetails platformChannelDetails = NotificationDetails(
      android: androidNotificationDetails,
    );
    await flutterLocalNotificationsPlugin.show(
      0,
      'Notification',
      'คุณกำลังได้รับ Iphone เพียงกด ยืนยัน',
      platformChannelDetails,
    );
    print("Notification");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              child: Container(
                height: 80,
                width: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black54,
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    ),
                  ],
                  color: Colors.black,
                ),
                child: const Center(
                  child: Text(
                    "Notification",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              onTap: () {
                _showNotification();
              },
            ),
          ],
        ),
      ),
      backgroundColor: Colors.grey[300],
    );
  }
}
