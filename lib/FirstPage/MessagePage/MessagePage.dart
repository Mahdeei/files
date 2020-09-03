import 'package:flutter/material.dart';
import 'package:stubbbb/AgahiPage/AgahPage.dart';
import 'package:stubbbb/Other/widget.dart';

class MyMessagePage extends StatelessWidget {
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  MyMessagePage({this.data});
  Map data;


  @override
  Widget build(BuildContext context) {
    return new Directionality(
        textDirection: TextDirection.rtl,
        child: new Scaffold(
          key: _scaffoldKey,
          drawer: DrawerLists(),
          drawerEnableOpenDragGesture: true,
          appBar: appBarMessagePage(_scaffoldKey),
          body: bodyMessage()
        ));
  }
}


