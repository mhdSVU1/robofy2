import 'package:flutter/material.dart';
import 'package:flutter_fire_trips/constants/const_colors.dart';
import '../../components/custom_text.dart';

class HomeScreenContents extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(15.0),
      child: Center(
        child: Container(
            child: CustomText(
          text: "This is the home page!",
              color: kPrimaryColor,
        )),
      ),
    );
  }
}
