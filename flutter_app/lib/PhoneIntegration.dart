import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:async';
// import 'package:simple_permissions/simple_permissions.dart';

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
  //
  // requestPermission() async {
  //   final res = await SimplePermissions.requestPermission(permission);
  //   print("Permission result is ${res.toString()}");
  //   setState(() {
  //     status = '${permission.toString()} = ${res.toString()}';
  //   });
  // }
  //
  // checkPermission() async {
  //   final res = await SimplePermissions.checkPermission(permission);
  //   print("Permission result it ${res.toString()}");
  //   setState(() {
  //     status = "${permission.toString()} = ${res.toString()}";
  //   });
  // }
  //
  // getPermissionStatus() async {
  //   final res = await SimplePermissions.getPermissionStatus(permission);
  //   print("Permission result it ${res.toString()}");
  //   setState(() {
  //     status = "${permission.toString()} = ${res.toString()}";
  //   });
  // }
  //
  // onDropDownChanged(Permission permission) {
  //   setState(() {
  //     this.permission = permission;
  //     status = 'Click a button below';
  //   });
  //   print(permission);
  // }
  //
  // List<DropdownMenuItem<Permission>> getDropDownItems() {
  //   List<DropdownMenuItem<Permission>> items = <DropdownMenuItem<Permission>>[];
  //   Permission.values.forEach((element) {
  //     var item = DropdownMenuItem(child: Text(getPermissionString(permission)), value: permission);
  //     items.add(item);
  //   });
  //   return items;
  // }

  // late String status;
  // late Permission permission;

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

                    // .19 - Phone integration
                    // ElevatedButton(onPressed: showUrl, child: Text("Url")),
                    // ElevatedButton(onPressed: showEmail, child: Text("Email")),
                    // ElevatedButton(onPressed: showSMS, child: Text("SMS")),
                    // ElevatedButton(onPressed: showTelephone, child: Text("Telephone")),
                    // .20 - Permissions
                    // Text(status),
                    // DropdownButton(items: getDropDownItems(), value: permission, onChanged: onDropDownChanged(permission),),
                    // ElevatedButton(onPressed: checkPermission, child: Text("Check permission")),
                    // ElevatedButton(onPressed: requestPermission, child: Text("Request permission")),
                    // ElevatedButton(onPressed: getPermissionStatus, child: Text("Get status")),
                    // ElevatedButton(onPressed: SimplePermissions.openSettings, child: Text("Open settings")),

                  ]))),
    );
  }
}
