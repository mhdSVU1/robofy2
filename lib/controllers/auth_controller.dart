import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_fire_trips/Models/model_user.dart';
import 'package:flutter_fire_trips/constants/firebase_initialization.dart';
import 'package:flutter_fire_trips/helpers/loading.dart';
import 'package:flutter_fire_trips/screens/authentication/auth_screen.dart';
import 'package:flutter_fire_trips/screens/home/home_page.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  static const String collections_users = 'Users';

  static AuthController instance = Get.find();

  Rx<User> currentUser;
  Rx<ModelUser> modelUser = ModelUser().obs;

  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();

  String topicAllUsers = "all_users";

  @override
  void onReady() {
    super.onReady();
    currentUser = Rx<User>(auth.currentUser);
    currentUser.bindStream(auth.userChanges());
    Get.currentRoute==" ";
    ever(currentUser, _setInitialScreen,);
    modelUser.bindStream(listenToUser());
    ever(modelUser, (modelUser) => initialModelUser(currentUser.value));
  }

  _setInitialScreen(User user) {
    if (user == null) {
      Get.offAll(() => AuthenticationScreen());
    } else {
     // Get.to(() => HomeScreen());

    }
  }

  void signUp() async {
    showLoading();
    await auth
        .createUserWithEmailAndPassword(
            email: email.text.trim(), password: phoneNumber.text.trim())
        .then((result) {
      result.user.updateDisplayName(name.text.trim());

      saveUserProfileDataToDB(
        result.user,
        email.text.trim(),
        name.text.trim(),
        phoneNumber.text.trim(),
      );

      initialModelUser(result.user);

      subscribeUserToTopic(topicAllUsers);

      _clearController();
      dismissLoading();
      Get.offAll(() => HomeScreen());

    }).catchError((error) {
      //Error, show something
      dismissLoading();
      Get.snackbar("Sign Up Error", '${error.toString().split(']')[1]}');
      print("Sign Up  :error ${error.toString()}");
    });
  }

  void signIn() async {
    showLoading();
    await auth
        .signInWithEmailAndPassword(
            email: email.text.trim(), password: phoneNumber.text.trim())
        .then((result) {
      initialModelUser(result.user);
      dismissLoading();
      _clearController();
      Get.offAll(() => HomeScreen());
    }).catchError((error) {
      dismissLoading();
      Get.snackbar("Sign In Error ", '${error.toString().split(']')[1]}');
      print("Sign In Error :error ${error.toString()}");
    });
  }

  void signOut() {
    auth.signOut();
  }

  Future<void> saveUserProfileDataToDB(
    User user,
    String email,
    String name,
    String phoneNumber,
  ) async {
 //   showLoading();
    await firestore.collection(collections_users).doc(user.uid).set({
      ModelUser.ID: user.uid,
      ModelUser.EMAIL: email,
      ModelUser.NAME: name,
      ModelUser.PHONE_NUMBER: phoneNumber,
    }).then((_) {
      //Success, do something

      ;
    }).catchError((error) {
      //Error, show something
    });
  }

  updateUserName(String displayName) {
    currentUser.value.updateDisplayName(displayName);
  }

  initialModelUser(User user) async {
    if (user != null) {
      modelUser.value = await firestore
          .collection(collections_users)
          .doc(user.uid)
          .get()
          .then((result) => ModelUser.fromSnapshot(result));
    }
  }

  void _clearController() {
    name.clear();
    email.clear();
    phoneNumber.clear();
  }

  Stream<ModelUser> listenToUser() => firestore
      .collection(collections_users)
      .doc(currentUser.value?.uid)
      .snapshots()
      .map((snapshot) => ModelUser.fromSnapshot(snapshot));

  void updateUserData(Map<String, dynamic> data) async {
    await firestore
        .collection(collections_users)
        .doc(modelUser.value.id)
        .update(data);
  }

  Future<void> subscribeUserToTopic(String topic) async {
    await messaging.subscribeToTopic(topic);
  }

  void getUserToken() {
    messaging.getToken().then((value) {
      print('Your token is: $value'); //this is the push notification token
    });
  }
}
