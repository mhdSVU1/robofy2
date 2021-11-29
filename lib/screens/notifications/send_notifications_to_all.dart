import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fire_trips/components/custom_drawer_screen.dart';
import 'package:flutter_fire_trips/screens/notifications/send_notifications_to_all_contents.dart';
import 'package:foldable_sidebar/foldable_sidebar.dart';

class SendNotificationsScreen extends StatefulWidget {
  @override
  _SendNotificationsScreenState createState() =>
      _SendNotificationsScreenState();
}

class _SendNotificationsScreenState extends State<SendNotificationsScreen> {
  FSBStatus drawerStatus;

  @override
  void initState() {
    super.initState();
    initializeMessaging();
  }

  void initializeMessaging() {
    FirebaseMessaging.onMessage.listen((RemoteMessage event) {
      print("message recieved");
      print(event.notification.body);
    });
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      print('Message clicked!');
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomDrawerScreen(
      screenTitle: " Send Notifications",
      screenContents: SendNotificationsContents(),
    );
  }
}
