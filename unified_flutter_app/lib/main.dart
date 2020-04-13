import 'package:flutter/material.dart';
import 'package:unifiedflutterapp/loginViewController.dart';
//import 'package:flutter_app/ui/SplashScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Login',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginScreen(key: Key('/login'),),
    );
  }
}