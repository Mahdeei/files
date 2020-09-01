import 'package:flutter/material.dart';
import 'package:stubbbb/Other/R.dart';
import 'package:stubbbb/Other/widget.dart';
import 'ListCards.dart';

class MyHomePage extends StatelessWidget {
  final Map body;

  MyHomePage({this.body});


  @override
  Widget build(BuildContext context) {
    return new Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          appBar: appBarHomePage(),
          drawer: DrawerLists(),
          drawerEnableOpenDragGesture: true,
          backgroundColor: R.color.backGround1,
          body: new Column(
            children: <Widget>[
              NaviBar(),
              ListCards(),
            ],
          ),
        ));
  }
}

class NaviBar extends StatelessWidget {
  var username;
  @override
  Widget build(BuildContext context) {
    var sizePhone = MediaQuery.of(context).size;
    return new Container(
        decoration: decorationHomePage(),
        height: sizePhone.height * 0.16,
        child: new Column(
          children: <Widget>[
            new Padding(
              padding: const EdgeInsets.only(right: 20.0, top: 0.0),
              child: new Row(
                children: <Widget>[
                  new Container(
                      margin: const EdgeInsets.only(left: 5.0, top: 10.0),
                      height: 70.0,
                      width: 70.0,
                      // child: new Image.asset("assets/image/download.jfif"),
                      decoration: decorationImageHomePage()
                  ),
                  new SizedBox(width: 10.0),
                  new Positioned(
                      child: new Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          new Text('username',style: styleHomePage()),
                        ],
                      )
                  )
                ],
              ),
            )
          ],
        ),
    );
  }
}


// Future userr() async {
//   var response = await http.post(
//     'http://192.168.56.1/Stub/selectUsername.php',
//     body: {'id': '16'},
//   );
//   print(response);
//   username = jsonDecode(response.body);
// }