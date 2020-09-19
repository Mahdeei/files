import 'package:flutter/material.dart';
import 'package:stubbbb/Models/myData.dart';
import 'package:stubbbb/Other/R.dart';
import 'package:stubbbb/Other/widget.dart';
import 'ListCards.dart';


class MyHomePage extends StatefulWidget {
  MyData profile;
  MyHomePage({this.profile});
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {

    // print("username : ${widget.profile.username}");
    return new Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: appBarHomePage(context, widget.profile),
          drawer: DrawerLists(profile: widget.profile,),
          drawerEnableOpenDragGesture: true,
          backgroundColor: R.color.backGround1,
          body: new Column(
            children: <Widget>[
              Expanded(
                  flex: 1,
                  child: Headers(profile: widget.profile,)),
              Expanded(
                  flex: 4,
                  child: ListCards(profile: widget.profile,)),
            ],
          ),
        ));
  }
}

