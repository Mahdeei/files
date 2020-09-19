import 'package:flutter/material.dart';
import 'package:stubbbb/Models/Profile.dart';
import 'package:stubbbb/Models/myData.dart';
import 'package:stubbbb/Models/profileModels.dart';
import 'package:stubbbb/Other/R.dart';
import 'package:stubbbb/Other/widget.dart';
import 'package:stubbbb/ProfilePage/MyProfileScreen.dart';
import 'package:stubbbb/http/Authenticate.dart';
import 'package:stubbbb/http/httpProfiles.dart';
import 'package:stubbbb/http/maxID.dart';
import 'ListStudents.dart';

class ProfilesPages extends StatefulWidget {
  MyData profile;
  ProfilesPages({this.profile});
  @override
  _ProfilesPagesState createState() => _ProfilesPagesState();
}

class _ProfilesPagesState extends State<ProfilesPages> {
  ScrollController scrollController = ScrollController();
  List<User> _profiles = [];
  bool isLoading = false;
  bool onRefresh = false;
  List<User> models;
  Map body = new Map();
  int firstid, lastid;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getId();
    scrollController.addListener(() {
      double maxscrol = scrollController.position.maxScrollExtent;
      double currscrol = scrollController.position.pixels;
      if (maxscrol - currscrol >= 100) {
        if (firstid > 0) {
          getDataAgain();
        }
      }
    });
  }

  getId() async {
    lastid = await ReceiveMaxid.getId();
    setState(() {
      if(onRefresh) _profiles.clear();
      firstid = lastid - 10;
    });

   await _getProfiles();
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
   await _getProfiles();
  }

  _getProfiles() async {
    var response =
        await ProfileHttp.getData({'firstid': '$firstid', 'lastid': '$lastid'});
    if(this.mounted){
      setState(() {
        _profiles.addAll(response['profiles']);
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
    return new MaterialApp(
        theme: ThemeData(primaryIconTheme: IconThemeData(color: R.color.banafshmain)),
        debugShowCheckedModeBanner: false,
        home: new SafeArea(
          top: true,
          bottom: true,
          child: new Directionality(
            textDirection: TextDirection.rtl,
            child: new Scaffold(
                drawer: DrawerLists(profile: widget.profile,),
                appBar: appBarProfilePage(),
                body: isLoading
                    ? RefreshIndicator(
                        child: new Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: new ListView.builder(
                            controller: scrollController,
                            itemCount: _profiles.length,
                            itemBuilder: (BuildContext context, int index) =>
                               ListProfiles(model: _profiles[index],
                                profile: widget.profile,)

                            ),
                        ),
                        onRefresh: refreshList
                )
                    : new Center(
                        child: new CircularProgressIndicator(),
                      )),
          ),
        ));
  }
}

class TextfieldSearch extends StatefulWidget {
  @override
  _TextfieldSearchState createState() => _TextfieldSearchState();
}

class _TextfieldSearchState extends State<TextfieldSearch> {
  FocusNode focusNode = FocusNode();
  String hintText = 'جستجو ...';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        hintText = '';
      } else {
        hintText = 'جستجو ...';
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Row(
      children: <Widget>[
        new Expanded(
          child: new TextField(
            decoration: InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 10.0),
              suffixIcon: new Icon(
                Icons.search,
                color: Color(0xff2c003e),
              ),
              enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
                borderSide: const BorderSide(
                  color: Color(0xffF2F3F8),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
                borderSide: BorderSide(color: Colors.white),
              ),
              fillColor: Color(0xffF2F3F8),
              hintText: hintText,
              filled: true,
            ),
          ),
        ),
        new GestureDetector(
          child: new Icon(
            Icons.filter_list,
            color: Colors.black,
          ),
          onTap: () {
            showModalBottomSheet(
                context: context,
                builder: (builder) => Container(
                        child: new Column(
                      children: <Widget>[
                        new Container(
                          color: R.color.red,
                          child: new Text(
                            'فیلتر دسته بندی ها',
                            textDirection: TextDirection.rtl,
                            style: TextStyle(
                                fontSize: 20.0, fontWeight: FontWeight.bold),
                          ),
                        ),
//                                              new Row(
//                                                children: <Widget>[
//
////                                    CustomRadio<int, double>(
////                                        value: value,
////                                        groupValue: widget.radioValue,
////                                        duration: Duration(milliseconds: 400),
////                                        animsBuilder: (AnimationController controller) => [
////                                          CurvedAnimation(
////                                              parent: controller,
////                                              curve: Curves.ease
////                                          )
////                                        ],
////                                        builder: ({ BuildContext context, List<double> animValues, Function updateState, bool checked }) {
////                                          return GestureDetector(
////                                              onTapDown: (TapDownDetails details) {
////                                                setState(() {
////                                                  if (_controller.status != AnimationStatus.completed)
////                                                    _controller.forward();
////                                                });
////                                              },
////                                              onTapUp: (TapUpDetails details) {
////                                                setState(() {
////                                                  if (_controller.status != AnimationStatus.dismissed)
////                                                    _controller.reverse();
////                                                });
////                                              },
////                                              onTap: () {
////                                                setState(() {
////                                                  widget.radioValue = value;
////                                                });
////                                              },
////                                              child: Container(
////                                                margin: EdgeInsets.all(8.0),
////                                                width: 38.0,
////                                                height: 38.0,
////                                                alignment: Alignment.center,
////                                                decoration: BoxDecoration(
////                                                  shape: BoxShape.circle,
////                                                ),
////                                                child: Stack(
////                                                    alignment: Alignment.center,
////                                                    children: <Widget>[
////                                                      Container(
////                                                        width: 38.0 * _animation.value,
////                                                        height: 38.0 * _animation.value,
////                                                        decoration: BoxDecoration(
////                                                            shape: BoxShape.circle,
////                                                            color: Theme.of(context).primaryColor.withAlpha(40)
////                                                        ),
////                                                      ),
////                                                      Container(
////                                                        width: 18.0,
////                                                        height: 18.0,
////                                                        decoration: BoxDecoration(
////                                                            shape: BoxShape.circle,
////                                                            color: Colors.transparent,
////                                                            border: Border.all(
////                                                                color: checked ? Theme.of(context).primaryColor : Theme.of(context).hintColor,
////                                                                width: 2.0
////                                                            )
////                                                        ),
////                                                      ),
////                                                      Container(
////                                                        width: 11.0 * animValues[0],
////                                                        height: 11.0 * animValues[0],
////                                                        decoration: BoxDecoration(
////                                                          shape: BoxShape.circle,
////                                                          color: Theme.of(context).primaryColor,
////                                                        ),
////                                                      ),
////                                                    ]
////                                                ),
////                                              )
////                                          );
////                                        }
////                                    ),
//                                                ],
//                                              )
                      ],
                    )));
          },
        ),
      ],
    );
  }
}
