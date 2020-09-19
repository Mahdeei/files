import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stubbbb/FirstPage/HomePage/HomeScreen.dart';
import 'package:stubbbb/LoginPage/SignIn.dart';
import 'package:stubbbb/Models/Profile.dart';
import 'package:stubbbb/Models/myData.dart';
import 'package:stubbbb/Other/widget.dart';
import 'package:stubbbb/http/Authenticate.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final skaffoldKey = new GlobalKey<ScaffoldState>();
  Map boody;
  Profile profile ;
  @override
  void initState() {
    super.initState();
    checkinternet();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: skaffoldKey,
      body: new Stack(
        fit: StackFit.expand,
        children: <Widget>[
          new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              containerSplash(),
              textSplashScreen()
            ],
          )
        ],
      ),
    );
  }

  checkinternet() async {
    if (await netConnet()) {
      checkLogin();
    } else {
      print('not connected internet');
      skaffoldKey.currentState.showSnackBar(new SnackBar(
          duration: Duration(hours: 2),
          content: new GestureDetector(
              onTap: () {
                checkinternet();
                skaffoldKey.currentState
                    .hideCurrentSnackBar();
                // reason: SnackBarClosedReason.hide
              },
              child: row()
          )));
    }
  }

  Row row(){
    return new Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        new Text('اینترنت وصل نیست'),
        new Icon(Icons.wifi_lock,color: Colors.white,)],
    );
  }

  Future<bool> netConnet() async {
    var connectivityResult = await (new Connectivity().checkConnectivity());
    return connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi;
  }
  checkLogin() async{
    SharedPreferences perfs = await SharedPreferences.getInstance();
    String apiToken =  perfs.getString('user_apiToken');
    String username =  perfs.getString('user_username');
    String password =  perfs.getString('user_password');
    if(false/*apiToken != null*/){
      boody = await AuthenticateService.checkLog(apiToken);

      if(boody['status'] == 'Defined'){
        Navigator.of(context).pushReplacement(
            new MaterialPageRoute(builder: (context) => new HomePage(id:boody['id'] ))
        );



      }else{

        Navigator.of(context).pushReplacement(
            new MaterialPageRoute(builder: (context) => new SignIn()));

      }}else{
      await perfs.remove('user_apiToken');
      await perfs.remove('user_username');
      await perfs.remove('user_password');
      Navigator.of(context).pushReplacement(
          new MaterialPageRoute(builder: (context) => new SignIn()));
    }

  }




}
