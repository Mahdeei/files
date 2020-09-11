import 'package:flutter/material.dart';
import 'package:stubbbb/Models/Profile.dart';
import 'package:stubbbb/Other/R.dart';
import 'package:stubbbb/Other/widget.dart';
import 'ListCards.dart';


class MyHomePage extends StatefulWidget {


  Profile profile;

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
          appBar: appBarHomePage(context,widget.profile),
          drawer: DrawerLists(),
          drawerEnableOpenDragGesture: true,
          backgroundColor: R.color.backGround1,
          body: new Column(
            children: <Widget>[
              Headers(profile: widget.profile,),
              ListCards(profile: widget.profile,),
            ],
          ),
        ));
  }
}

