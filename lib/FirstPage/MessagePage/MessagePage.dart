import 'package:flutter/material.dart';
import 'package:stubbbb/Models/myData.dart';
import 'package:stubbbb/Other/SizeConfig.dart';
import 'package:stubbbb/Other/widget.dart';

class MyMessagePage extends StatelessWidget {
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  MyData profile;
  MyMessagePage({this.profile,this.data});
  Map data;


  @override
  Widget build(BuildContext context) {
    return new Directionality(
        textDirection: TextDirection.rtl,
        child: new Scaffold(
          key: _scaffoldKey,
          drawer: DrawerLists(profile: profile,),
          drawerEnableOpenDragGesture: true,
          appBar: appBarMessagePage(_scaffoldKey),
          body: /*bodyMessage()*/
          Center(child: new Container(
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FittedBox(child: new Text('نسخه فعلی ازمایشی است',style: TextStyle(fontSize: SizeConfig.textMultiplier*3),)),
                FittedBox(child: new Text('این قسمت در نسخه اصلی تکمیل می شود',style: TextStyle(fontSize: SizeConfig.textMultiplier*3),)),
              ],
            )
          ))
        ));
  }
}


