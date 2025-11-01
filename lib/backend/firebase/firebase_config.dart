import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyB6hqRl8wFpV6TxrsVYSnBgmxbJpiX4Qio",
            authDomain: "midapp-21db4.firebaseapp.com",
            projectId: "midapp-21db4",
            storageBucket: "midapp-21db4.firebasestorage.app",
            messagingSenderId: "69909308350",
            appId: "1:69909308350:web:e34c130a55e1b72e4fcfef",
            measurementId: "G-7Q0NNCY394"));
  } else {
    await Firebase.initializeApp();
  }
}
