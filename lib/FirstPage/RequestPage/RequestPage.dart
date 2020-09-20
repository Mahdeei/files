import 'package:flutter/material.dart';
import 'package:stubbbb/FirstPage/RequestPage/bodyRequestIntern.dart';
import 'package:stubbbb/FirstPage/RequestPage/bodyRequestUser.dart';
import 'package:stubbbb/Models/REquestIntern.dart';
import 'package:stubbbb/Models/Request.dart';
import 'package:stubbbb/Models/myData.dart';
import 'package:stubbbb/Other/R.dart';
import 'package:stubbbb/Other/widget.dart';

class MyRequestPage extends StatefulWidget {
  MyData profile;

  MyRequestPage({this.profile});

  @override
  _MyRequestPageState createState() => _MyRequestPageState();
}

class _MyRequestPageState extends State<MyRequestPage>
    with SingleTickerProviderStateMixin {
  bool isLoading = false;
  List<RequestAd> requestsAd = [];
  List<RequestIntern> requestsIntern = [];

  // List usernamesAd=[];

  // List<dynamic> requests=[];
  TabController tabController;

  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    // _getRequestAd();
    // _getRequestIntern();
    tabController = new TabController(
      length: 3,
      vsync: this,
    );
  }

  // _getRequestAd() async {
  //
  //   usernamesAd= await RequestHttp.getUsernames(widget.profile.id);
  //   var response = await RequestHttp.getAd(widget.profile.id);
  //   setState(() {
  //     requestsAd.addAll(response['requests']);
  //     isLoading = true;
  //   });
  //
  // }

  //
  // _getRequestIntern() async {
  //
  //   // usernamesIntern= await RequestHttp.getUsernames(widget.profile.id);
  //   var response = await RequestHttp.getIntern(widget.profile.id);
  //   setState(() {
  //     requestsIntern.addAll(response['requests']);
  //     isLoading = true;
  //   });
  //
  // }

  @override
  Widget build(BuildContext context) {
    var phoneSize = MediaQuery.of(context).size;

    return new Directionality(
      textDirection: TextDirection.rtl,
      child: new Scaffold(
          key: _scaffoldKey,
          drawerEnableOpenDragGesture: true,
          drawer: DrawerLists(
            profile: widget.profile,
          ),
          appBar: new AppBar(
            bottom: TabBar(
              labelColor: Theme.of(context).accentColor,
              indicatorColor: R.color.banafshmain,
              controller: tabController,
              tabs: [
                Tab(
                    icon: new Text(
                  'آگهی ها',
                  style: TextStyle(color: Colors.black),
                )),
                Tab(
                    icon: new Text(
                  'شخصی',
                  style: TextStyle(color: Colors.black),
                )),
                Tab(
                    icon: new Text(
                  'کارآموزی',
                  style: TextStyle(color: Colors.black),
                )),
              ],
            ),
            leading: IconButton(
              icon: Icon(
                Icons.menu,
                color: R.color.banafshmain,
              ),
              onPressed: () => _scaffoldKey.currentState.openDrawer(),
            ),
            //            title: this.cusSearchBar,
            backgroundColor: Colors.white,
            elevation: 5.0,
            // bottomOpacity: 25.0,
            // shape: RoundedRectangleBorder(
            //   borderRadius: BorderRadius.vertical(
            //     bottom: Radius.circular(30),
            //   ),
            // ),
          ),
          body: TabBarView(controller: tabController, children: [
            new bodyRequest(
              phoneSize: phoneSize,
              profile: widget.profile,
            ),
            new bodyRequestUser(phoneSize: phoneSize, profile: widget.profile),
            new bodyRequestIntern(phoneSize: phoneSize, profile: widget.profile)
          ])),
    );
  }
}
