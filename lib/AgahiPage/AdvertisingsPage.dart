import 'package:flutter/material.dart';
import 'package:stubbbb/Models/AgahiModel.dart';
import 'package:stubbbb/Models/Profile.dart';
import 'package:stubbbb/Other/R.dart';
import 'package:stubbbb/Other/widget.dart';
import 'package:stubbbb/http/httpAdvertisings.dart';
import 'package:stubbbb/http/maxID.dart';
import 'AddPostAgahi.dart';
import 'AgahPage.dart';

class AdvertisingsPage extends StatefulWidget {
  Profile profile;
  AdvertisingsPage({this.profile});

  @override
  _AdvertisingsPageState createState() => _AdvertisingsPageState();
}

class _AdvertisingsPageState extends State<AdvertisingsPage> with SingleTickerProviderStateMixin{


  TabController tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = new TabController(length: 3,vsync: this,);

  }





  @override
  Widget build(BuildContext context) {

    return new Directionality(
          textDirection: TextDirection.rtl,
          child: new SafeArea(
              child: new Scaffold(
                    floatingActionButton: new FloatingActionButton(
                      onPressed: () {
                        Navigator.of(context).push(new MaterialPageRoute(builder: (ctx)=> AddPostAgahi(profile: widget.profile,)));
                      },
                      child: new Icon(Icons.add),
                      backgroundColor: R.color.banafshmain,
                      // child: OpenContainer(
                      //   transitionDuration: Duration(milliseconds: 500),
                      //   closedBuilder: (ctx, action) => new Container(
                      //     color: R.color.banafshmain,
                      //     width: MediaQuery.of(context).size.width,
                      //     child: new Icon(
                      //       Icons.add,
                      //       color: R.color.red,
                      //     ),
                      //   ),
                      //   openBuilder: (ctx, action) => AddPostAgahi(profile: widget.profile,),
                      // ),
                    ),
                    backgroundColor: Color(0xfff2f3f8),
                    drawer: DrawerLists(),
                    appBar:/* appBarAgahiScreen(),*/ new AppBar(
                      bottom: new TabBar(

                        controller: tabController,
                        tabs: [
                          Tab(child: new Icon(Icons.ac_unit),),
                          Tab(child: new Icon(Icons.access_alarm),),
                          Tab(child: new Icon(Icons.ac_unit),),
                        ],

                      ),
                    ),

                    body:ProjectsList(profile: widget.profile,)
            )));
  }


}

class ProjectsList extends StatefulWidget {
  Profile profile;
  ProjectsList({this.profile});
  @override
  _ProjectsListState createState() => _ProjectsListState();
}

class _ProjectsListState extends State<ProjectsList> {
  List<Advertising> advertisings = [];
  bool isLoading = false;
  Map body=new Map();
  ScrollController scrollController = ScrollController();
  bool onRefresh = false;
  int firstid, lastid;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getId();
    scrollController.addListener(() {
      double maxscrol = scrollController.position.maxScrollExtent;
      double currscrol = scrollController.position.pixels;
      if (maxscrol - currscrol >= 200) {
        if (firstid > 0) {
          getDataAgain();
        }
      }
    });

  }



  getId() async {
    lastid = await ReceiveMaxid.getAdID();
    setState(() {
      if(onRefresh) advertisings.clear();
      firstid = lastid - 10;
    });

    await _getAd();
  }

  getDataAgain() async {
    setState(() {
      if (firstid > 10) {
        firstid = firstid - 10;
        lastid = lastid - 10;
      } else if (firstid == 10) {
        firstid = firstid - 9;
        lastid = lastid - 10;
      } else if (true) {
        firstid -= (firstid + 1);
        if (lastid > 10) {
          lastid = lastid - 10;
        }
      }
    });
    await _getAd();
  }



  _getAd() async {
    var response = await HttpAdvertisings.getData({'firstid': '$firstid', 'lastid': '$lastid'});
    setState(() {
      advertisings.addAll(response['advertisings']);
      isLoading = true;
    });
  }

  Future<Null> refreshList() async{
    setState(() {
      onRefresh=true;
    });
    await getId();
    return null;
  }
  @override
  Widget build(BuildContext context) {
    var phoneSize = MediaQuery.of(context).size;
    return isLoading
        ? RefreshIndicator(
            child: new ListView.builder(
              controller: scrollController,
              itemCount: advertisings.length,
              itemBuilder: (BuildContext context, int index) => new GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AdvertisingScreen(advertising: advertisings[index],profile: widget.profile,)),
                  );
                },
                child: new Container(
                  margin: const EdgeInsets.only(
                      right: 6.0, bottom: 5.0, top: 5.0, left: 9.0),
                  height: phoneSize.height * 0.15,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black54,
                            offset: Offset(0.0, 1.0),
                            blurRadius: 5.0)
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(65.0),
                        topRight: Radius.circular(65.0),
                        topLeft: Radius.circular(15.0),
                        bottomLeft: Radius.circular(15.0),
                      )),
                  child: new Row(
                    children: <Widget>[
                      new Container(
                        margin: const EdgeInsets.only(
                          right: 4.0,
                        ),
                        height: phoneSize.height * 0.14,
                        width: phoneSize.width * 0.32,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(65.0),
                                bottomRight: Radius.circular(65.0)),
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage('assets/image/download.jfif'))),
                      ),
                      new Expanded(
                          child: new Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              new Text(
                                advertisings[index].title,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize: 20.0, fontWeight: FontWeight.bold),
                              ),
                              new Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  new Padding(
                                    padding:
                                    const EdgeInsets.symmetric(horizontal: 10.0),
                                    child: Container(
                                      height: 30.0,
                                      width: MediaQuery.of(context).size.width * 0.45,
                                      child: new Text(
                                        advertisings[index].description,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                      ),
                                    ),
                                  ),
                                  new Padding(
                                    padding:
                                    const EdgeInsets.symmetric(horizontal: 5.0),
                                    child: new CircleAvatar(
                                      maxRadius: 9.0,
                                      child: new Icon(
                                        Icons.arrow_forward_ios,
                                        color: Colors.white,
                                        size: 9.0,
                                      ),
                                      backgroundColor: Color(0xff2C003E),
                                    ),
                                  )
                                ],
                              ),
                              new Row(
                                children: <Widget>[
                                  new Container(
                                      margin: const EdgeInsets.only(right: 10.0),
                                      decoration: BoxDecoration(
                                          color: Color(0xffD2FAFB),
                                          shape: BoxShape.rectangle,
                                          borderRadius: BorderRadius.circular(15.0)),
                                      child: new Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 3.0, vertical: 1.0),
                                        child: new Text(
                                          'گرافیک',
                                          maxLines: 1,
                                          style: new TextStyle(
                                            color: Color(0xff2c003e),
                                            fontSize: 11.0,
                                          ),
                                        ),
                                      )),
                                  new Container(
                                      margin: const EdgeInsets.only(right: 2.0),
                                      decoration: BoxDecoration(
                                          color: Color(0xffD2FAFB),
                                          shape: BoxShape.rectangle,
                                          borderRadius: BorderRadius.circular(15.0)),
                                      child: new Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 3.0, vertical: 1.0),
                                        child: new Text(
                                          'ui',
                                          style: new TextStyle(
                                            color: Color(0xff2c003e),
                                            fontSize: 11.0,
                                          ),
                                        ),
                                      )),
                                  new Container(
                                      margin: const EdgeInsets.only(right: 2.0),
                                      decoration: BoxDecoration(
                                          color: Color(0xffD2FAFB),
                                          shape: BoxShape.rectangle,
                                          borderRadius: BorderRadius.circular(15.0)),
                                      child: new Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 3.0, vertical: 1.0),
                                        child: new Text(
                                          'ux',
                                          style: new TextStyle(
                                            color: Color(0xff2c003e),
                                            fontSize: 11.0,
                                          ),
                                        ),
                                      )),
                                ],
                              ),
                              new Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  new Padding(
                                    padding:
                                    const EdgeInsets.symmetric(horizontal: 5.0),
                                    child: new Text('قیمت : توافقی'),
                                  ),
                                  new Padding(
                                    padding:
                                    const EdgeInsets.symmetric(horizontal: 5.0),
                                    child: new Text('دقایقی پیش'),
                                  )
                                ],
                              )
                            ],
                          ))
                    ],
                  ),
                ),
              )), onRefresh:
    refreshList,)

        : new Center(child: CircularProgressIndicator(),);
  }
}
