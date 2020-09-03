import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ff_navigation_bar/ff_navigation_bar.dart';
import 'package:stubbbb/FirstPage/MessagePage/MessagePage.dart';
import 'package:stubbbb/FirstPage/RequestPage/RequestPage.dart';
import 'package:stubbbb/Models/Profile.dart';
import 'package:stubbbb/Other/R.dart';
import 'FirstPage/HomePage/ListCards.dart';
import 'Other/widget.dart';



class HomePage extends StatefulWidget {
  Profile profile=new Profile();
  HomePage({this.profile});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
    });
  }

  Map data ;
  int currentindex = 1;
  List listwidget = [
    MyRequestPage(),
    MyHomePage(),
    MyMessagePage(),
  ];

  changePage(int indexpage) {
    setState(() {
      currentindex = indexpage;
    });
  }



  void function(){

  }
  

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
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
      body: listwidget[currentindex],
    );
  }






}



class MyHomePage extends StatelessWidget {

  var body;

  MyHomePage({this.body});


  @override
  Widget build(BuildContext context) {
    return new Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          appBar: appBarHomePage(context),
          drawer: DrawerLists(),
          drawerEnableOpenDragGesture: true,
          backgroundColor: R.color.backGround1,
          body: new Column(
            children: <Widget>[
              Headers(),
              ListCards(),
            ],
          ),
        ));
  }
}


