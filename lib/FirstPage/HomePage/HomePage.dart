import 'package:flutter/material.dart';
import 'package:stubbbb/Models/myData.dart';
import 'package:stubbbb/Other/R.dart';
import 'package:stubbbb/Other/SizeConfig.dart';
import 'package:stubbbb/Other/widget.dart';
import 'package:stubbbb/ProfilePage/MyProfileScreen.dart';
import 'package:stubbbb/ProfilePage/MyProfileUserNormalScreen.dart';
import 'ListCards.dart';


class MyHomePage extends StatefulWidget {
  MyData profile;
  MyHomePage({this.profile});
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {

    // print("username : ${widget.profile.username}");
    return new Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: new AppBar(actions: <Widget>[

            new Padding(
                padding: EdgeInsets.only(
                    left: SizeConfig.heightMultiplier * 2,
                    top: SizeConfig.heightMultiplier * 0.5),
                child: new Stack(
                  children: [
                    new IconButton(
                        icon: Icon(
                          Icons.person,
                          color: Colors.white,
                          size: SizeConfig.heightMultiplier * 4.0,
                        ),
                        onPressed: () {
                          Future<MyData> answer = Navigator.push(
                              context,
                              new MaterialPageRoute(
                                  builder: (context) => widget.profile.type == "2"
                                      ? new MyProfileUserNormalScreen(id: widget.profile.id,profile: widget.profile,)
                                      : new MyProfileStudentScreen(profile: widget.profile)));
                          answer.then((MyData value) {
                            setState(() {
                              print(widget.profile.name);
                            });
                            return value != null? widget.profile= value: 'empty';
                          });

                        }),
                    widget.profile.image == null ||
                        widget.profile.title == null ||
                        widget.profile.moarefiNameh == null ||
                        widget.profile.skills == null ||
                        widget.profile.certificates == null ||
                        widget.profile.fieldUni == null ||
                        widget.profile.languages == null ||
                        widget.profile.resumes == null ||
                        widget.profile.educational == null ||
                        widget.profile.image == null ||
                        widget.profile.image == ''
                        ? new Positioned(
                        bottom: SizeConfig.heightMultiplier * 2.4,
                        right: SizeConfig.heightMultiplier * 1.3,
                        child: new CircleAvatar(
                          backgroundColor: Colors.red,
                          maxRadius: 4,
                        ))
                        : new SizedBox()
                  ],
                ))
          ], elevation: 0.0, backgroundColor: R.color.banafshmain),
          drawer: DrawerLists(profile: widget.profile,),
          drawerEnableOpenDragGesture: true,
          backgroundColor: R.color.backGround1,
          body: new Column(
            children: <Widget>[
              Expanded(
                  flex: 1,
                  child: Headers(profile: widget.profile,)),
              Expanded(
                  flex: 4,
                  child: ListCards(profile: widget.profile,)),
            ],
          ),
        ));
  }
}

