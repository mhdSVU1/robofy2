import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fire_trips/components/custom_drawer_screen.dart';
import 'package:flutter_fire_trips/constants/controllers.dart';
import 'package:flutter_fire_trips/screens/home/home_contents.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    initializeMessaging();
  }

  void initializeMessaging() {
    FirebaseMessaging.onMessage.listen((RemoteMessage event) {
      print("message received");
      print(event.notification.body);
    });
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      print('Message clicked!');
    });
  }

  @override
  Widget build(BuildContext context) {
    DateTime _lastQuiteTime;


    return WillPopScope(
      onWillPop: () async {
        if (_lastQuiteTime == null ||
            DateTime.now().difference(_lastQuiteTime) >
                Duration(seconds: 1)) {
          Get.snackbar("Alert", "Press again back button to exit!");
          _lastQuiteTime = DateTime.now();
          return false;
        } else {
          authController.signOut();
          /*// To just exit the app
           if (Platform.isAndroid) {
            SystemNavigator.pop();
          } else if (Platform.isIOS) {
            exit(0);
          }      */
          return true;
        }
      },
      child: CustomDrawerScreen(
        screenTitle: "Home Page",
        screenContents: HomeScreenContents(),
      ),
    );
  }
}
