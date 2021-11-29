import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fire_trips/controllers/app_controller.dart';
import 'package:flutter_fire_trips/controllers/auth_controller.dart';
import 'package:get/get.dart';

import 'Constants/firebase_initialization.dart';
import 'controllers/app_controller.dart';
import 'controllers/auth_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    await initialization.then((value) {
      Get.put(AppController());
      Get.put(AuthController());
    });
  } on FirebaseException catch (e) {
    if (e.code == 'duplicate-app') {
      Get.put(AppController());
      Get.put(AuthController());
// you can choose not to do anything here or either
// In a case where you are assigning the initializer instance to a FirebaseApp variable, // do something like this:
//
//   app = Firebase.app('SecondaryApp');
//
    } else {
      throw e;
    }
  } catch (e) {
    rethrow;
  }

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Robofy Assignment',
        theme: ThemeData(
            primarySwatch: Colors.purple,
            appBarTheme: AppBarTheme(
              color: const Color(0xFF947CE3),
            )),
        home: Splash());
  }
}

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}
