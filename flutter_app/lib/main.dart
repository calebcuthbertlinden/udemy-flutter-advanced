import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'Maps.dart';
import 'PhoneIntegration.dart';
import 'firebase/FirebaseWidget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FirebaseWidget(title: 'Flutter Advanced - Udemy'),
    );
  }
}