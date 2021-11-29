import 'package:flutter/material.dart';
import 'package:flutter_fire_trips/constants/controllers.dart';
import 'package:flutter_fire_trips/screens/authentication/login/login_screen.dart';
import 'package:flutter_fire_trips/screens/authentication/signup/signup_screen.dart';
import 'package:get/get.dart';

class AuthenticationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.white ,
        body:Obx(() =>
             SingleChildScrollView(child:  Column(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 Visibility(
                   visible: appController.signInWidgetIsDisplayed.value,
                   child: LoginScreen(),
                 ),
                 Visibility(
                   visible: !appController.signInWidgetIsDisplayed.value,
                   child: SignUpScreen(),
                 ),
                 SizedBox(height: 30,),


               ],
             ),)
         ),
    );
  }
}
