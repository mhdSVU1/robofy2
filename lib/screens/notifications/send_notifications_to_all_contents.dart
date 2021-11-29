import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fire_trips/components/custom_rounded_button.dart';
import 'package:flutter_fire_trips/constants/const_functions.dart';
import 'package:flutter_fire_trips/helpers/loading.dart';
import 'package:get/get.dart';

class SendNotificationsContents extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(15.0),
      child: Container(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomRoundedButton(
              text: "Send Hello Notification",
              onPress: sendNotificationToAllUsers,
            ),
          ),
        ),
      ),
    );
  }

  Future<void> sendNotificationToAllUsers() async {
    HttpsCallable callable =
        FirebaseFunctions.instanceFor(region: FUNCTION_REGION_EUROPE_CENTRAL2)
            .httpsCallable(FUNCTION_NAME_HELLO);

    final results = await callable({
      "data": {
        "displayName": "Mohammed",
      }
    }).then((value) {
      dismissLoading();
      Get.snackbar("Successful", "Your Hello notification has been sent successfully!");
      print("Hello notification :Successful");
    }).catchError((error) {
      print("Hello notification :error ${error.toString()}");
    });;
    List data = results?.data;
    print("Cloud Data  $data");
  }
}
