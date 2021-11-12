import 'dart:io';
import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:http/http.dart' as http;
import 'Auth.dart';

Future<String> upload(File file, String basename) async {
  await ensureLoggedIn();
  Reference ref = FirebaseStorage.instance.ref().child('file/test/${basename}');
  ref.putFile(file);
  String name = ref.name;
  String bucket = ref.bucket;
  String path = ref.fullPath;

  print('name: $name');
  print('bucket: $bucket');
  print('path: $path');

  return path;
}

Future<String> download(Uri location) async {
  http.Response data = await http.get(location);
  return data.body;
}