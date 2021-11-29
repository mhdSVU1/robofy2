import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

final Future<FirebaseApp> initialization = Firebase.initializeApp(
    options: const FirebaseOptions(
  apiKey: 'AIzaSyAi8xkJCtuiaaqrAz0VJjCBTNr_qN8DvQE',
  appId: '1:525686125620:android:89374f07b3ad392beb4661',
  messagingSenderId: '525686125620',
  projectId: 'mypie-94a26',
));
FirebaseFirestore firestore = FirebaseFirestore.instance;
FirebaseAuth auth = FirebaseAuth.instance;
FirebaseMessaging messaging = FirebaseMessaging.instance;



