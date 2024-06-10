import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyC1b4KI7cWb6P3mJXVOfT1Q-t-wCR-znro",
            authDomain: "dmt-meditations.firebaseapp.com",
            projectId: "dmt-meditations",
            storageBucket: "dmt-meditations.appspot.com",
            messagingSenderId: "537811175722",
            appId: "1:537811175722:web:c89d91b5e0646c29a67653",
            measurementId: "G-WGRTCBW9W8"));
  } else {
    await Firebase.initializeApp();
  }
}
