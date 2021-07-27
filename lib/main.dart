import 'package:aplikasi_data_item_mobile_legends/data_item.dart';
import 'package:aplikasi_data_item_mobile_legends/login.dart';
import 'package:flutter/material.dart';
import 'dart:io';

void main() {
  HttpOverrides.global = new MyHttpOverrides();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Aplikasi Data Item Mobile Legends',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Login(),
        routes: <String, WidgetBuilder>{
          '/Home': (BuildContext context) => DataItem(),
          '/Login': (BuildContext context) => Login(),
        });
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
