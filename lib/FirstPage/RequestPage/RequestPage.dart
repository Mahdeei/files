import 'package:flutter/material.dart';
import 'package:stubbbb/Models/Profile.dart';
import 'package:stubbbb/Models/Request.dart';
import 'package:stubbbb/Models/myData.dart';
import 'package:stubbbb/Other/widget.dart';
import 'package:stubbbb/http/httpRequest.dart';


class MyRequestPage extends StatefulWidget {

  MyData profile;
  MyRequestPage({this.profile});
  @override
  _MyRequestPageState createState() => _MyRequestPageState();
}

class _MyRequestPageState extends State<MyRequestPage> {

  bool isLoading = false;
  List<Request> requests =[];
  List usernames=[];

  @override
  void initState() {
    super.initState();
    _getRequest();
  }


  _getRequest() async {

    usernames= await RequestHttp.getUsernames(widget.profile.id);
    var response = await RequestHttp.getData(widget.profile.id);
    setState(() {
      requests.addAll(response['requests']);
      isLoading = true;
    });

  }

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
          body: isLoading
              ? bodyRequest(phoneSize: phoneSize,requests: requests,usernames: usernames,profile: widget.profile,)
              : new Center(
            child: new CircularProgressIndicator(),
          )),

        );
  }
}


