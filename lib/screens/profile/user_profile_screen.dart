import 'package:flutter/material.dart';
import 'package:flutter_fire_trips/Screens/Authentication/Signup/components/body.dart';
import 'package:flutter_fire_trips/components/custom_drawer_screen.dart';

import 'user_profile_screen_contents.dart';

class UserProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomDrawerScreen(screenTitle:"My Profile",screenContents: UserProfileContents(),)
    ;
  }
}
