import 'package:flutter/material.dart';
import 'package:stubbbb/Models/AgahiModel.dart';
import 'package:stubbbb/Models/Profile.dart';
import 'package:stubbbb/Other/widget.dart';
import 'package:stubbbb/http/httpAdvertisings.dart';
import 'AgahPage.dart';

class AdvertisingsPage extends StatefulWidget {
  Profile profile;
  AdvertisingsPage({this.profile});

  @override
  _AdvertisingsPageState createState() => _AdvertisingsPageState();
}

class _AdvertisingsPageState extends State<AdvertisingsPage> {

  List<Advertising> advertisings = [];
  bool isLoading = false;
  Map body=new Map();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _getAdvertisings();
  }

  _getAdvertisings() async {
    var response = await HttpAdvertisings.getData();
    setState(() {
      advertisings.addAll(response['advertisings']);
    });
    setState(() {
      isLoading = true;
    });
  }


  @override
  Widget build(BuildContext context) {

    return new Directionality(
          textDirection: TextDirection.rtl,
          child: new SafeArea(
              child: new DefaultTabController(
                  length: 3,
                  child: new Scaffold(
                    floatingActionButton: floatingActionButtonAgahiScreen(context),
                    backgroundColor: Color(0xfff2f3f8),
                    drawer: DrawerLists(),
                    appBar: appBarAgahiScreen(),
                    body: TabBarView(
                      children: [
                        ProjectList(advertisings: advertisings,profile: widget.profile,),
                        Icon(Icons.directions_transit),
                        Icon(Icons.directions_bike),
                      ],
                    ),
            ))),
        );
  }
}

class ProjectList extends StatefulWidget {
  Profile profile;
  List<Advertising> advertisings = [];
  ProjectList({this.profile,this.advertisings});
  @override
  _ProjectListState createState() => _ProjectListState();
}

class _ProjectListState extends State<ProjectList> {
  @override
  Widget build(BuildContext context) {


    var phonesize = MediaQuery.of(context).size;
    return new ListView.builder(
        itemCount: widget.advertisings.length,
        itemBuilder: (BuildContext context, int index) => new GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AdvertisingScreen(advertising: widget.advertisings[index],profile: widget.profile,)),
                );
              },
              child: new Container(
                margin: const EdgeInsets.only(
                    right: 6.0, bottom: 5.0, top: 5.0, left: 9.0),
                height: phonesize.height * 0.15,
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
                      height: phonesize.height * 0.14,
                      width: phonesize.width * 0.32,
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
                              widget.advertisings[index].title,
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
                                      widget.advertisings[index].description,
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
            ));
  }
}
