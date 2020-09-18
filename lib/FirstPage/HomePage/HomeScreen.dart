import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ff_navigation_bar/ff_navigation_bar.dart';
import 'package:stubbbb/FirstPage/MessagePage/MessagePage.dart';
import 'package:stubbbb/FirstPage/RequestPage/RequestPage.dart';
import 'package:stubbbb/Models/Profile.dart';
import 'package:stubbbb/Models/myData.dart';
import 'package:stubbbb/http/Authenticate.dart';
import '../../Other/R.dart';
import 'HomePage.dart';

class HomePage extends StatefulWidget {
  String id;
  HomePage({this.id});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{

  MyData profile;
  bool isLoading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getMyData();
  }

  int currentindex = 1;

  changePage(int indexpage) {
    setState(() {
      currentindex = indexpage;
    });
  }

  _getMyData() async {
    MyData body = await AuthenticateService.getMyData(widget.id);
    setState(() {
      profile = body;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? new Scaffold(
            body: new Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  new Text('استیوب',style: TextStyle(fontSize: 30),),
                  CircularProgressIndicator(),
                ],
              ),
            ),
          )
        : new Scaffold(
            resizeToAvoidBottomInset: false,
            bottomNavigationBar: FFNavigationBar(
              theme: FFNavigationBarTheme(
                barBackgroundColor: Colors.white,
                selectedItemBackgroundColor: R.color.red,
                selectedItemIconColor: Colors.white,
                selectedItemLabelColor: R.color.banafshtire,
              ),
              selectedIndex: currentindex,
              onSelectTab: (index) {
                setState(() {
                  currentindex = index;
                });
              },
              items: [
                FFNavigationBarItem(
                  iconData: Icons.mail,
                  label: 'جعبه',
                ),
                FFNavigationBarItem(
                  iconData: Icons.home,
                  label: 'خانه',
                ),
                FFNavigationBarItem(
                  iconData: Icons.chat,
                  label: 'پیام ها',
                ),
              ],
            ),
            body: currentindex == 1
                ? MyHomePage(
                    profile: profile,
                  )
                : currentindex == 0
                    ? MyRequestPage(
                        profile: profile,
                      )
                    : MyMessagePage(),
          );
  }
}
