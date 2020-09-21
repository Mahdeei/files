import 'package:flutter/material.dart';
import 'package:stubbbb/Models/AgahiModel.dart';
import 'package:stubbbb/Models/Profile.dart';
import 'package:stubbbb/Models/myData.dart';
import 'package:stubbbb/Other/R.dart';
import 'package:stubbbb/Other/SizeConfig.dart';
import 'package:stubbbb/Other/widget.dart';
import 'package:stubbbb/http/Authenticate.dart';
import 'package:stubbbb/http/httpAdvertisings.dart';
import 'package:stubbbb/http/maxID.dart';
import 'AddPostAgahi.dart';
import 'AgahPage.dart';

class AdvertisingsPage extends StatefulWidget {
  MyData profile;
  AdvertisingsPage({this.profile});

  @override
  _AdvertisingsPageState createState() => _AdvertisingsPageState();
}


class _AdvertisingsPageState extends State<AdvertisingsPage> with SingleTickerProviderStateMixin{
/*
  TabController tabController;
*/

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
/*
    tabController = new TabController(length: 2,vsync: this,);
*/

  }





  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

    return new Directionality(
        textDirection: TextDirection.rtl,
        child: new SafeArea(
            child: new Scaffold(
              key:_scaffoldKey,
                floatingActionButton: new FloatingActionButton(
                  onPressed: () {
                    Navigator.of(context).push(new MaterialPageRoute(builder: (ctx)=> AddPostAgahi(profile: widget.profile,)));
                  },
                  child: new Icon(Icons.add),
                  backgroundColor: R.color.banafshmain,
                ),
                backgroundColor: Color(0xfff2f3f8),
                drawer: DrawerLists(profile: widget.profile,),
                appBar: appBarMessagePage(_scaffoldKey),

                body: ProjectsList(profile: widget.profile,)
/*
                TabBarView(
                    controller: tabController,
                    children: [
                      ProjectsList(profile: widget.profile,),
                      new Center(child: Text('salam'),),
                    ]
                )
*/
            )));
  }


}

class ProjectsList extends StatefulWidget {
  MyData profile;
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
    if(this.mounted){
      setState(() {
        if(onRefresh) advertisings.clear();
        firstid = lastid - 10;
      });
    }

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
    if(this.mounted){
      setState(() {
        advertisings.addAll(response['advertisings']);
        isLoading = true;
      });
    }
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
        ? advertisings.length != 0 ? RefreshIndicator(
            child: new ListView.builder(
                controller: scrollController,
                itemCount: advertisings.length,
                itemBuilder: (BuildContext context, int index) => new GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>
                          AdvertisingScreen(advertising: advertisings[index],profile: widget.profile,)),
                    );
                  },
                  child: new Container(
                    margin: const EdgeInsets.only(
                        right: 6.0, bottom: 5.0, top: 5.0, left: 9.0),
                    height: SizeConfig.heightMultiplier * 15 ,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black54,
                              offset: Offset(0.0, 1.0),
                              blurRadius: 5.0)
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(SizeConfig.heightMultiplier * 9),
                          topRight: Radius.circular(SizeConfig.heightMultiplier * 9),
                          topLeft: Radius.circular(SizeConfig.heightMultiplier * 2),
                          bottomLeft: Radius.circular(SizeConfig.heightMultiplier * 2),
                        )),
                    child: new Row(
                      children: <Widget>[
                        Expanded(
                          flex: 4,
                          child: new Container(
                            margin: EdgeInsets.only(
                              right: SizeConfig.imageSizeMultiplier,
                            ),
                            height: phoneSize.height * 0.14,
                            width: phoneSize.width * 0.32,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(SizeConfig.heightMultiplier * 9),
                                    bottomRight: Radius.circular(SizeConfig.heightMultiplier * 9)),
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: advertisings[index].image==""
                                        ? AssetImage('assets/image/drawing.png')
                                        : NetworkImage("http://stube.ir/image/${advertisings[index].image}")
                                )),
                          ),
                        ),
                        new Expanded(
                          flex: 7,
                            child: new Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Expanded(
                                  flex: 1,
                                  child: Padding(
                                    padding: EdgeInsets.only(right:SizeConfig.imageSizeMultiplier *1.5),
                                    child: new Text(
                                      advertisings[index].title,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontSize: SizeConfig.heightMultiplier * 2.7, fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: new Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Expanded(
                                        flex: 5,
                                        child: new Padding(
                                          padding:
                                           EdgeInsets.symmetric(horizontal: SizeConfig.imageSizeMultiplier * 2.5),
                                          child: Container(
                                            height: MediaQuery.of(context).size.height*0.07,
                                            width: MediaQuery.of(context).size.width * 0.45,
                                            child: new Text(
                                              advertisings[index].description,
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 2,
                                              style: TextStyle(fontSize: SizeConfig.heightMultiplier * 2),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: new Padding(
                                          padding:
                                           EdgeInsets.symmetric(horizontal: SizeConfig.imageSizeMultiplier *0.0,vertical: 0),
                                          child: new CircleAvatar(
                                            maxRadius: SizeConfig.imageSizeMultiplier *2.5,
                                            child: new Icon(
                                              Icons.arrow_forward_ios,
                                              color: Colors.white,
                                              size: SizeConfig.imageSizeMultiplier *2,
                                            ),
                                            backgroundColor: Color(0xff2C003E),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                // new Row(
                                //   children: <Widget>[
                                //     new Container(
                                //         margin: const EdgeInsets.only(right: 10.0),
                                //         decoration: BoxDecoration(
                                //             color: Color(0xffD2FAFB),
                                //             shape: BoxShape.rectangle,
                                //             borderRadius: BorderRadius.circular(15.0)),
                                //         child: new Padding(
                                //           padding: const EdgeInsets.symmetric(
                                //               horizontal: 3.0, vertical: 1.0),
                                //           child: new Text(
                                //             'گرافیک',
                                //             maxLines: 1,
                                //             style: new TextStyle(
                                //               color: Color(0xff2c003e),
                                //               fontSize: 11.0,
                                //             ),
                                //           ),
                                //         )),
                                //     new Container(
                                //         margin: const EdgeInsets.only(right: 2.0),
                                //         decoration: BoxDecoration(
                                //             color: Color(0xffD2FAFB),
                                //             shape: BoxShape.rectangle,
                                //             borderRadius: BorderRadius.circular(15.0)),
                                //         child: new Padding(
                                //           padding: const EdgeInsets.symmetric(
                                //               horizontal: 3.0, vertical: 1.0),
                                //           child: new Text(
                                //             'ui',
                                //             style: new TextStyle(
                                //               color: Color(0xff2c003e),
                                //               fontSize: 11.0,
                                //             ),
                                //           ),
                                //         )),
                                //     new Container(
                                //         margin: const EdgeInsets.only(right: 2.0),
                                //         decoration: BoxDecoration(
                                //             color: Color(0xffD2FAFB),
                                //             shape: BoxShape.rectangle,
                                //             borderRadius: BorderRadius.circular(15.0)),
                                //         child: new Padding(
                                //           padding: const EdgeInsets.symmetric(
                                //               horizontal: 3.0, vertical: 1.0),
                                //           child: new Text(
                                //             'ux',
                                //             style: new TextStyle(
                                //               color: Color(0xff2c003e),
                                //               fontSize: 11.0,
                                //             ),
                                //           ),
                                //         )),
                                //   ],
                                // ),
                                Expanded(
                                  flex: 1,
                                  child: new Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      new Padding(
                                        padding:
                                        const EdgeInsets.only(right: 7.0),
                                        child: new Text('بودجه : ${advertisings[index].price}',style: TextStyle(fontSize:SizeConfig.textMultiplier *1.7,color: R.color.banafshKamRang),),
                                      ),
                                      new Padding(
                                        padding: EdgeInsets.symmetric(horizontal: 5.0),
                                        child: new Text(
                                            textTime(advertisings[index].date),
                                          style: TextStyle(fontSize: phoneSize.height*0.014,color: R.color.banafshKamRang),),
                                        ),

                                    ],
                                  ),
                                )
                              ],
                            ))
                      ],
                    ),
                  ),
                )), onRefresh:
    refreshList,)
    : new Center(child: Text('در حال حاضر آگهی برای نمایش وجود ندارد.'),)

        : new Center(child: CircularProgressIndicator(),);
  }
}
