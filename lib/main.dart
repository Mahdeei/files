import 'package:flutter/material.dart';
import 'package:stubbbb/FirstPage/RequestPage/MyRequests.dart';
import 'file:///D:/proflutter/stubbbb/lib/LoginPage/WelcomePage.dart';
import 'LoginPage/SignUp.dart';
import 'LoginPage/SplashScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new SafeArea(
          top: true,
          bottom: true,
          child: new Directionality(textDirection: TextDirection.rtl, child: new SignUp())),
    );
  }
}
