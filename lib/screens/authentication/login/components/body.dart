import 'package:flutter/material.dart';
import 'package:flutter_fire_trips/components/custom_rounded_button.dart';
import 'package:flutter_fire_trips/components/rounded_input_field.dart';
import 'package:flutter_fire_trips/components/rounded_phone_number_field.dart';
import 'package:flutter_fire_trips/constants/controllers.dart';
import 'package:flutter_fire_trips/screens/authentication/already_have_an_account_acheck.dart';

import '../../../../components/custom_text.dart';
import 'background.dart';

class BodySignIn extends StatelessWidget {
  const BodySignIn({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () {print('Back pressed');},
      child: BackgroundSignIn(
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
                      child: CustomText(
                          text: "SIGN IN",
                          font: FontWeight.bold,
                          size: 23.0,
                          color: Colors.purple),
                      top: 40,
                      left: 160),
                ],
              ),
              RoundedInputField(
                icon: Icons.email,
                controller: authController.email,
                hintText: "Your Email",
                onChanged: (value) {},
              ),
              RoundedPhoneNumberField(
                controller: authController.phoneNumber,
                onChanged: (value) {},
              ),
              CustomRoundedButton(
                text: "LOGIN",
                onPress: () => authController.signIn(),
              ),
              SizedBox(height: size.height * 0.03),
              AlreadyHaveAnAccountCheck(
                press: () => appController.changelogInIsDisplayed(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
