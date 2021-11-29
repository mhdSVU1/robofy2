import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fire_trips/Constants/controllers.dart';
import 'package:flutter_fire_trips/constants/const_colors.dart';
import 'package:flutter_fire_trips/screens/home/home_contents.dart';
import 'package:flutter_fire_trips/screens/home/home_page.dart';
import 'package:flutter_fire_trips/screens/notifications/send_notifications_to_all.dart';
import 'package:flutter_fire_trips/screens/profile/user_profile_screen.dart';
import 'package:flutter_fire_trips/screens/profile/user_profile_screen_contents.dart';
import 'package:flutter_fire_trips/components/custom_text.dart';
import 'package:get/get.dart';

class CustomDrawer extends StatelessWidget {
  final Function closeDrawer;

  const CustomDrawer({Key key, this.closeDrawer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    return Container(
      color: Colors.white60,
      width: mediaQuery.size.width * 0.80,
      height: mediaQuery.size.height,
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(color: myPrimaryColor),
            accountName: CustomText(
              text: authController.modelUser.value?.name??"",
              color: Colors.white,
              size: 19.0,
            ),
            accountEmail: CustomText(
              text: authController.modelUser.value?.email??"",
              color: Colors.white60,
              size: 16.0,
            ),
            currentAccountPicture: CircleAvatar(
              child: CustomText(
                text: authController.currentUser.value?.email?.substring(0,1)?.toUpperCase()??"U",
                size: 40.0,
                color: myPrimaryColor,
              ),
              backgroundColor: Colors.white,
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.home,
              color: myPrimaryLightColor1,
            ),
            title: CustomText(
              text: "Home Page",
              color: myPrimaryLightColor1,
            ),
            onTap: () {
              closeDrawer();

              Get.to(() => HomeScreen());
            },
          ),
          ListTile(
            leading: Icon(
              Icons.account_circle,
              color: myPrimaryLightColor1,
            ),
            title: CustomText(
              text: "Edit My Profile",
              color: myPrimaryLightColor1,
            ),
            onTap: () {
              closeDrawer();

              Get.to(() => UserProfileScreen());
            },
          ),
          ListTile(
            leading: Icon(
              Icons.send,
              color: myPrimaryLightColor1,
            ),
            title: CustomText(
              text: 'Send Hello',
              color: myPrimaryLightColor1,
            ),
            onTap: () {
              closeDrawer();

              Get.to(() => SendNotificationsScreen());
            },
          ),
          ListTile(
            leading: Icon(
              Icons.exit_to_app,
              color: myPrimaryLightColor1,
            ),
            title: CustomText(
              text: 'Sign out',
              color: myPrimaryLightColor1,
            ),
            onTap: () => authController.signOut(),

          ),


        ],
      ),
    );
  }
}
