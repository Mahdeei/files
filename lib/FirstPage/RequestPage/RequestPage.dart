import 'package:flutter/material.dart';
import 'package:stubbbb/Other/widget.dart';
import 'package:stubbbb/ProfilePage/MyProfileScreen.dart';

class MyRequestPage extends StatefulWidget {
  MyRequestPage({this.data});
  Map data;
  @override
  _MyRequestPageState createState() => _MyRequestPageState();
}

class _MyRequestPageState extends State<MyRequestPage> {

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    var phoneSize = MediaQuery.of(context).size;

    return new Directionality(
        textDirection: TextDirection.rtl,
        child: new Scaffold(
          key: _scaffoldKey,
          drawerEnableOpenDragGesture: true,
          drawer: DrawerLists(),
          appBar: appBarMessagePage(_scaffoldKey),
          body: bodyRequest(phoneSize: phoneSize),
        ));
  }
}


