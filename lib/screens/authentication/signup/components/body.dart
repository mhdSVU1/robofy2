import 'package:flutter/material.dart';
import 'package:flutter_fire_trips/components/custom_rounded_button.dart';
import 'package:flutter_fire_trips/components/custom_text.dart';
import 'package:flutter_fire_trips/components/rounded_input_field.dart';
import 'package:flutter_fire_trips/components/rounded_phone_number_field.dart';
import 'package:flutter_fire_trips/constants/controllers.dart';
import 'package:flutter_fire_trips/screens/authentication/already_have_an_account_acheck.dart';
import 'package:flutter_fire_trips/screens/authentication/signup/components/social_icon.dart';

import 'background.dart';
import 'or_divider.dart';

class BodySignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: (){},
      child: BackgroundSignUp(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
           Stack(
             children: [

               ConstrainedBox(
                    constraints: BoxConstraints(minHeight: 200, minWidth: 400),
                    child: Image.asset(
                   "assets/images/logo.png",
                   height: size.height * 0.35,
                   width: double.infinity,
                 ),
               ),
               Positioned(
                 top: 0,
                 left: 0,
                 child: Image.asset(
                   "assets/images/main_top.png",
                   width: size.width * 0.35,
                 ),
               ),
               Positioned(child: CustomText(text:"SIGN UP",font: FontWeight.bold,size: 23.0,color:Colors.purple  )
                   ,top: 40,left:160),
             ],
           ),
              RoundedInputField(
                controller: authController.name,
                hintText: "Your Name",
                onChanged: (value) {},
              ),
              RoundedInputField(
                controller: authController.email,
                hintText: "Your Email",
                icon: Icons.email,
                onChanged: (value) {},
              ),
              RoundedPhoneNumberField(
                controller: authController.phoneNumber,
                onChanged: (value) {},

              ),
              CustomRoundedButton(
                text: "SIGNUP",
                onPress: () => authController.signUp(),
              ),
              SizedBox(height: size.height * 0.03),
              AlreadyHaveAnAccountCheck(
                login: false,
                press: () => appController.changelogInIsDisplayed(),
              ),
              OrDivider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SocalIcon(
                    iconSrc: "assets/icons/facebook.svg",
                    press: () {},
                  ),
                  SocalIcon(
                    iconSrc: "assets/icons/twitter.svg",
                    press: () {},
                  ),
                  SocalIcon(
                    iconSrc: "assets/icons/google-plus.svg",
                    press: () {},
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
