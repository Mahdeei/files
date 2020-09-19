import 'package:flutter/material.dart';
import 'package:stubbbb/Models/myData.dart';
import 'package:stubbbb/Other/widget.dart';



class StudentPerfectScreen extends StatefulWidget {
  MyData profile;
  StudentPerfectScreen({this.profile});
  @override
  _StudentPerfectScreenState createState() => _StudentPerfectScreenState();
}

class _StudentPerfectScreenState extends State<StudentPerfectScreen> {

  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override

  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        key: _scaffoldKey,
        drawer: DrawerLists(profile: widget.profile,),
        appBar: appBarMessagePage(_scaffoldKey),
        body: new Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              new Text("در حال حاضر این نسخه ازمایشی است",style: TextStyle(fontSize: 20.0),),
              new Text("...منتظر این قسمت جذاب در اینده باشید",style: TextStyle(fontSize: 20.0),),
            ],
          ),
        ),
      ),
    );
  }
}
