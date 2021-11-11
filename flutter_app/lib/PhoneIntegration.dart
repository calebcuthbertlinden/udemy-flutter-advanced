import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:async';

class PhoneIntegration extends StatefulWidget {
  PhoneIntegration({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _PhoneIntegrationState createState() => _PhoneIntegrationState();
}

class _PhoneIntegrationState extends State<PhoneIntegration> {

  void showUrl() {
    _launch("https://www.cookiecut.co.za");
  }

  void showEmail() {
    _launch("mailto://caleblinden1@gmail.com");
  }

  void showTelephone() {
    _launch("tel:999-999-9999");
  }

  void showSMS() {
    _launch("sms:999-999-9999");
  }

  void _launch(String urlString) async {
    if (await canLaunch(urlString)) {
      launch(urlString);
    } else {
      throw "Could not launch $urlString";
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
          padding: EdgeInsets.all(8.0),
          child: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    ElevatedButton(onPressed: showUrl, child: Text("Url")),
                    ElevatedButton(onPressed: showEmail, child: Text("Email")),
                    ElevatedButton(onPressed: showSMS, child: Text("SMS")),
                    ElevatedButton(onPressed: showTelephone, child: Text("Telephone")),
                  ]))),
    );
  }
}
