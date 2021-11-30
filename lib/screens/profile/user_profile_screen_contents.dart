import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fire_trips/Constants/controllers.dart';
import 'package:flutter_fire_trips/components/custom_rounded_button.dart';
import 'package:flutter_fire_trips/components/rounded_input_field.dart';
import 'package:flutter_fire_trips/components/rounded_phone_number_field.dart';
import 'package:flutter_fire_trips/helpers/loading.dart';
import 'package:flutter_fire_trips/screens/home/home_page.dart';
import 'package:get/get.dart';

class UserProfileContents extends StatefulWidget {
  @override
  State<UserProfileContents> createState() => _UserProfileContentsState();
}

class _UserProfileContentsState extends State<UserProfileContents> {
  TextEditingController controller_userName = TextEditingController();
  TextEditingController controller_phoneNumber = TextEditingController();
  String initialDisplayName;
  String initialPhoneNumber;
  String newPhoneNumber;

  @override
  void initState() {
    super.initState();
    controller_userName.text = authController.modelUser.value.name;
    controller_phoneNumber.text = authController.modelUser.value.phoneNumber;

    initialDisplayName = authController.modelUser.value.name;
    initialPhoneNumber = authController.modelUser.value.phoneNumber;
    newPhoneNumber = authController.modelUser.value.phoneNumber;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 40,
            ),
            Center(
                child: Text(
                    "Hello, ${controller_userName.text.capitalizeFirst} ",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 23,
                        color: Colors.purple))),
            SizedBox(
              height: 40,
            ),
            Obx(
              () {
                authController.modelUser.value.name;
                return RoundedInputField(
                  hintText: "Username",
                  controller: controller_userName,
                  onChanged: (value) {
                    setState(() {
                      initialDisplayName =
                          value ?? authController.modelUser.value.name;
                    });
                  },
                );
              },
            ),
            Obx(
              () {
                authController.modelUser.value.phoneNumber;
                return RoundedPhoneNumberField(
                  controller: controller_phoneNumber,
                  onChanged: (value) {
                    setState(() {
                      newPhoneNumber = value;
                    });
                  },
                );
              },
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomRoundedButton(
                  text: "Save",
                  size: 18,
                  onPress: () {
                    authController.updateUserName(controller_userName.text);
                    _changePhoneNumberAsPassword(
                        initialPhoneNumber, newPhoneNumber);
                  },
                  widthFactor: 0.4,
                  heightFactor: 0.07,
                ),
                CustomRoundedButton(
                  text: "Cancel",
                  size: 18,
                  onPress: () {
                    Get.to(() => HomeScreen());
                    Get.snackbar("Canceled!", "Profile Editing Canceled!");
                  },
                  widthFactor: 0.4,
                  heightFactor: 0.07,
                ),
              ],
            ),
            SizedBox(height: size.height * 0.04),
          ],
        ),
      ),
    );
  }

  void _changePhoneNumberAsPassword(
      String currentPassword, String newPassword) async {
    showLoading();

    final cred = EmailAuthProvider.credential(
        email: authController.currentUser.value.email,
        password: currentPassword);

    authController.currentUser.value
        .reauthenticateWithCredential(cred)
        .then((value) {
      authController.currentUser.value.updatePassword(newPassword).then((_) {
        //Success, do something
        authController
            .saveUserProfileDataToDB(
                authController.currentUser.value,
                authController.currentUser.value.email,
                authController.currentUser.value.displayName,
                newPhoneNumber)
            .then((value) {
          dismissLoading();
          Get.snackbar(
              "Successful", "Your account information has been updated!");
          print("updatePassword :Successful");
        }).catchError((error) {
          print("updatePassword :error ${error.toString()}");
        });
      }).catchError((error) {
        //Error, show something
        dismissLoading();
        controller_phoneNumber.text =
            authController.modelUser.value.phoneNumber;
        newPassword = authController.modelUser.value.phoneNumber;

        Get.snackbar("Phone Number Error",
            'Because you are using phone number as a password, ${error.toString().split(']')[1]}');

        print("updatePassword :error ${error.toString()}");
      });
    }); /*.catchError((error) {
      dismissLoading();
      print("reauth :error ${error.toString()}");
       Get.snackbar("Password Error", '${error.toString().split(']')[1]}');


    });*/
  }
}
