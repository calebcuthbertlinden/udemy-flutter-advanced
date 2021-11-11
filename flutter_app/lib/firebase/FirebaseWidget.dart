import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'Auth.dart';

class FirebaseWidget extends StatefulWidget {
  FirebaseWidget({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _FirebaseWidgetState createState() => _FirebaseWidgetState();
}

class _FirebaseWidgetState extends State<FirebaseWidget> {

  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  String status = 'Not authenticated';

  @override
  void initState() {
  }

  void upload() async {

  }

  void download() async {

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body:

      Container(
        padding: EdgeInsets.all(32),
        child: Center(
          child: FutureBuilder(
          // Initialize FlutterFire:
          future: _initialization,
          builder: (context, snapshot) {
            // Check for errors
            if (snapshot.hasError) {
              return Text(status,
                  style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold));
            }

            // Once complete, show your application
            if (snapshot.connectionState == ConnectionState.done) {
              initialiseStateListener()
                  .listen((User? user) {
                if (user == null) {
                  setState(() {
                    status = "Signed out";
                  });
                } else if (!user.isAnonymous) {
                  setState(() {
                    status = "Signed in with Google";
                  });
                } else {
                  setState(() {
                    status = "Signed in anonymously";
                  });
                }
              });

              return Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(status,
                        style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold)),
                    Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget> [
                          ElevatedButton(onPressed: signOut, child: Text("Sign out"),),
                          ElevatedButton(onPressed: signInAnonymous, child: Text("Sign in"),),
                          ElevatedButton(onPressed: signInGoogle, child: Text("Sign in with Google"),),
                        ]),
                    Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget> [
                          ElevatedButton(onPressed: null, child: Text("Upload"),),
                          ElevatedButton(onPressed: null, child: Text("Download"),),
                        ])
                  ]
              );
            }

            // Otherwise, show something whilst waiting for initialization to complete
            return Text(status,
                style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold));
          },
        )
        )
      ),
    );
  }
}
