import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyC9gXPwYWvvvSPi7CEYOvpRsQ2AZkgdJiY",
            authDomain: "moon-tmn2dq.firebaseapp.com",
            projectId: "moon-tmn2dq",
            storageBucket: "moon-tmn2dq.appspot.com",
            messagingSenderId: "289637494704",
            appId: "1:289637494704:web:4632f93fcd134d8d39f075"));
  } else {
    await Firebase.initializeApp();
  }
}
