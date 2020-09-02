import 'package:flutter/material.dart';
import 'package:stubbbb/Other/R.dart';
import 'package:stubbbb/Other/widget.dart';
import 'package:stubbbb/http/profiles.dart';
import 'package:stubbbb/mahde/profileModels.dart';
import 'ListProfiles.dart';

class ProfilesPages extends StatefulWidget {
  @override
  _ProfilesPagesState createState() => _ProfilesPagesState();
}

class _ProfilesPagesState extends State<ProfilesPages> {

  ScrollController scrollController = ScrollController();

  List<Models> _profiles = [];
  bool isLoading = false;

  int i = 10;
  List<Models> models;
  Map body=new Map();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // scrollController.addListener(() {
    //   double maxscrol = scrollController.position.maxScrollExtent;
    //   double currscrol = scrollController.position.pixels;
    // if (maxscrol - currscrol >= 200) {
    //   // addModel();
    // }
    _getProfiles();
    
  }

  _getProfiles() async {
    var response = await ProfileHttp.getData();
    // print(response);
    setState(() {
      _profiles.addAll(response['profiles']);
    });
    // print('_profiles');
     setState(() {
        isLoading = true;
      });
    print(_profiles);
  }
  // addModel() async {
  //   await Future.delayed(Duration(milliseconds: 5000));
  //   setState(() {
  //     refreshList();
  //   });
  // }

  // Future<Null> refreshList() async {
  //   await Future.delayed(Duration(milliseconds: 50));
  //   setState(() {
  //     models.add(new Models(username: 'sd $i', educational: 'ssssssssss$i'));
  //   });
  //   return null;
  // }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        theme: ThemeData(
            primaryIconTheme: IconThemeData(color: R.color.banafshmain)),
        debugShowCheckedModeBanner: false,
        home: new SafeArea(
          top: true,
          bottom: true,
          child: new Directionality(
            textDirection: TextDirection.rtl,
            child: new Scaffold(
                drawer: DrawerLists(),
                appBar: appBarProfilePage(),
                body: isLoading
                    ? new ListView.builder(
                        itemCount: _profiles.length,
                        itemBuilder: (BuildContext context, int index) =>
                            ListProfiles(model: _profiles[index]),
                      )
                    : new Center(
                        child: new CircularProgressIndicator(),
                      )),
          ),
        ));
  }
}
