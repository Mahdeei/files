import 'package:flutter/material.dart';
import 'package:stubbbb/KarAmouziPage/AddIntern.dart';
import 'package:stubbbb/Models/InterShip.dart';
import 'package:stubbbb/Models/Profile.dart';
import 'package:stubbbb/Other/R.dart';
import 'package:stubbbb/Other/widget.dart';
import 'package:stubbbb/http/AddIntern.dart';
import 'package:stubbbb/http/httpInterships.dart';
import 'package:stubbbb/http/maxID.dart';
import 'KaPage.dart';




class KarAmouziPage extends StatefulWidget {
  Profile profile;
  KarAmouziPage({this.profile});

  @override
  _KarAmouziPageState createState() => _KarAmouziPageState();
}

class _KarAmouziPageState extends State<KarAmouziPage> {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        theme: ThemeData(primaryIconTheme: IconThemeData(color: R.color.banafshmain)),
        debugShowCheckedModeBanner: false,
        home: new Directionality(
            textDirection: TextDirection.rtl,
            child: new SafeArea(
              child: new Scaffold(
                floatingActionButton: new FloatingActionButton(
                  onPressed: () {
                    Navigator.of(context).push(new MaterialPageRoute(builder: (ctx)=> AddInternPost(profile: widget.profile,)));
                  },
                  backgroundColor: R.color.banafshmain,
                  child: new Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                ),
                backgroundColor: Color(0xfff2f3f8),
                drawer: DrawerLists(),
                appBar: appBarKaramouziScreen(),
                body: KarAmouziListList(),
              ),
            )));
  }
}



class KarAmouziListList extends StatefulWidget {
  @override
  _KarAmouziListListState createState() => _KarAmouziListListState();
}

class _KarAmouziListListState extends State<KarAmouziListList> {

  List<InterShip> interShips = [];
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
    lastid = await ReceiveMaxid.getInterID();
    setState(() {
      if(onRefresh) interShips.clear();
      if(lastid<10){
        firstid = 1;
      }else{
        firstid = lastid - 10;
      }

    });


    await _getInterships();
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
    await _getInterships();
  }



  _getInterships() async {
    var response = await HttpInterships.getData({'firstid': '$firstid', 'lastid': '$lastid'});
    setState(() {
      interShips.addAll(response['interships']);
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
    var phonesize = MediaQuery.of(context).size;
    return isLoading
        ? RefreshIndicator(
            onRefresh: refreshList,
            child: new ListView.builder(
                controller: scrollController,
                itemCount: interShips.length,
                itemBuilder: (BuildContext context, int index) => new GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => KaPage()),
                    );
                  },
                  child: new Container(
                    margin: const EdgeInsets.only(right: 6.0, bottom: 5.0, top: 10.0, left: 9.0),
                    height: phonesize.height * 0.13,
                    decoration: decorationKaramouziScreen(),
                    child: new Row(
                      children: <Widget>[
                        new Container(
                          margin: const EdgeInsets.only(right: 4.0,left: 3.0),
                          height: phonesize.height * 0.12,
                          width: phonesize.width * 0.30,
                          decoration: boxDecorationKaramouziScreen(),
                        ),
                        new Expanded(
                            child: new Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                new Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    textoneKaramouziScreen(interShips[index].title),
                                    Container(
                                        margin: EdgeInsets.only(right: 5.0),
                                        width: MediaQuery.of(context).size.width*0.6,
                                        child: textTwoKaramouziScreen(interShips[index].description)),
                                    new Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        new Row(
                                          children: [
                                            new Padding(
                                                padding: const EdgeInsets.only(right: 5.0),
                                                child: Container(
                                                    width: MediaQuery.of(context).size.width*0.19,
                                                    child: textthreeKaramouziScreen(interShips[index].company)
                                                )
                                            ),
                                            textlineBetween(),
                                            Container(
                                                margin: EdgeInsets.only(right: 3.0),
                                                width: MediaQuery.of(context).size.width *0.25,
                                                child: textType(interShips[index].type)),
                                          ],
                                        ),
                                        new Padding(
                                            padding:const EdgeInsets.only(left: 5.0,),
                                            child: circleAvatarKaramouziScreen()
                                        )
                                      ],
                                    ),
                                    // new Row(
                                    //   children: <Widget>[
                                    //     new Container(
                                    //         margin: const EdgeInsets.only(right: 10.0),
                                    //         decoration: boxDecorationKaramouziScrenn(),
                                    //         child: new Padding(
                                    //           padding: const EdgeInsets.symmetric(horizontal: 3.0, vertical: 1.0),
                                    //           child: textKarAmouziScreen()
                                    //         )),
                                    //     new Container(
                                    //         margin: const EdgeInsets.only(right: 2.0),
                                    //         decoration: boxDecorationKaramouziScrenn(),
                                    //         child: new Padding(
                                    //           padding: const EdgeInsets.symmetric(horizontal: 3.0, vertical: 1.0),
                                    //           child: textKarAmoziScreen(),
                                    //     )),
                                    //     new Container(
                                    //         margin: const EdgeInsets.only(right: 2.0),
                                    //         decoration: boxDecorationKaramouziScrenn(),
                                    //         child: new Padding(
                                    //           padding: const EdgeInsets.symmetric(horizontal: 3.0, vertical: 1.0),
                                    //           child: textKarAmouzziScreen(),
                                    //         )),
                                    //   ],
                                    // ),
                                  ],
                                ),
                                new Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 4.0),
                                    child: new Row(
                                      children: <Widget>[
                                        iconKarAmouziScreen(),
                                        new SizedBox(width: 1.0),
                                        texKarAmouziScreen()
                                      ],
                                    )),
                              ],
                            ))
                      ],
                    ),
                  ),
                )),
          )
        : Center(child: CircularProgressIndicator());
  }
}
