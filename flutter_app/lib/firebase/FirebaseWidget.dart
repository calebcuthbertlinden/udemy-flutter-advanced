import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';

import 'Auth.dart';
import 'Storage.dart';

class FirebaseWidget extends StatefulWidget {
  FirebaseWidget({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _FirebaseWidgetState createState() => _FirebaseWidgetState();
}

class _FirebaseWidgetState extends State<FirebaseWidget> {
  String status = 'Not authenticated';
  FirebaseStorage? storage;
  String location = "";

  @override
  void initState() {
    Firebase.initializeApp().then((value) => {
          signInAnonymous().then((value) => {initialiseFirebaseListeners()})
        });
  }

  void initialiseFirebaseListeners() {
    storage = FirebaseStorage.instance;
    initialiseStateListener().listen((User? user) {
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
  }

  void localUpload() async {
    Directory systemTempDir = Directory.systemTemp;
    File file = await File('${systemTempDir.path}/foo.txt').create();
    await file.writeAsString('Hello world');
    String loc = await upload(file, basename(file.path));
    setState(() {
      location = loc;
      status = 'Uploaded!';
    });
    print('Uploaded to $location');
  }

  void localDownload() async {
    if (this.location.isEmpty) {
      setState(() {
        status = "Please upload first";
      });
    }
    Uri location = Uri.parse(this.location);
    String data = await download(location);
    setState(() {
      status = "Downloaded: $data";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Container(
            padding: EdgeInsets.all(32),
            child: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                  Text(status,
                      style: TextStyle(
                          fontSize: 30.0, fontWeight: FontWeight.bold)),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        ElevatedButton(
                          onPressed: signOut,
                          child: Text("Sign out"),
                        ),
                        ElevatedButton(
                          onPressed: signInAnonymous,
                          child: Text("Sign in"),
                        ),
                        ElevatedButton(
                          onPressed: signInGoogle,
                          child: Text("Sign in with Google"),
                        ),
                      ]),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        ElevatedButton(
                          onPressed: localUpload,
                          child: Text("Upload"),
                        ),
                        ElevatedButton(
                          onPressed: localDownload,
                          child: Text("Download"),
                        ),
                      ])
                ]))));
  }
}
