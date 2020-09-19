import 'package:flutter/material.dart';
import 'package:stubbbb/Models/myData.dart';
import 'package:stubbbb/Models/profileModels.dart';
import 'package:stubbbb/Other/R.dart';
import 'package:stubbbb/Other/SizeConfig.dart';
import 'package:stubbbb/ProfilePage/MyProfileScreen.dart';
import 'Moshakhsat.dart';

class ListProfiles extends StatefulWidget {
  User model;
  MyData profile;

  ListProfiles({this.profile, this.model});

  final controller = new PageController();

  @override
  _ListProfilesState createState() => _ListProfilesState();
}

class _ListProfilesState extends State<ListProfiles>
    with AutomaticKeepAliveClientMixin<ListProfiles> {
  @override
  Widget build(BuildContext context) {
    var phoneSize = MediaQuery.of(context).size;
    return new Container(
      height: SizeConfig.heightMultiplier * 14,
      child:
        new GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => widget.profile.id != widget.model.id
                      ? ProPage(user: widget.model, profile: widget.profile)
                      : MyProfileStudentScreen(id: widget.profile.id,)),
            );
          },
          child: Card(
            color: Colors.grey[100],
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  flex: 3,
                  child: new Padding(
                    padding: EdgeInsets.only(top: SizeConfig.heightMultiplier *2.8, right: SizeConfig.heightMultiplier *3.6),
                      child: new Column(
                        children: <Widget>[
                          Expanded(
                            flex: 2,
                            child: new Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    alignment: Alignment.centerRight,
                                    child: new Text(widget.model.name,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: SizeConfig.textMultiplier *2.7)),
                                  ),
                                ),
                                new SizedBox(
                                  width: SizeConfig.imageSizeMultiplier*1.7,
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Container(margin: const EdgeInsets.only(left: 5),
                                    alignment: Alignment.centerLeft,
                                    width: phoneSize.width * .35,
                                    child: new Text(
                                      widget.model.username,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: SizeConfig.textMultiplier * 2.7),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: widget.model.moarefinameh ==null || widget.model.moarefinameh == "" ? 0 : 2,
                            child: new Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  // new Row(
                                  //   crossAxisAlignment: CrossAxisAlignment.start,
                                  //   children: <Widget>[
                                  //     // new Container(
                                  //     //     decoration: BoxDecoration(
                                  //     //         color: Color(0xffD2FAFB),
                                  //     //         shape: BoxShape.rectangle,
                                  //     //         borderRadius:
                                  //     //             BorderRadius.circular(15.0)),
                                  //     //     child: new Padding(
                                  //     //       padding: const EdgeInsets.symmetric(
                                  //     //           horizontal: 3.0, vertical: 1.0),
                                  //     //       child: new Text(
                                  //     //         'ml,,,,,',
                                  //     //         style: new TextStyle(
                                  //     //           color: Color(0xff2c003e),
                                  //     //           fontSize: 10.0,
                                  //     //         ),
                                  //     //       ),
                                  //     //     )),
                                  //     // new Container(
                                  //     //     decoration: BoxDecoration(
                                  //     //         color: Color(0xffD2FAFB),
                                  //     //         shape: BoxShape.rectangle,
                                  //     //         borderRadius:
                                  //     //             BorderRadius.circular(15.0)),
                                  //     //     child: new Padding(
                                  //     //       padding: const EdgeInsets.symmetric(
                                  //     //           horizontal: 3.0, vertical: 1.0),
                                  //     //       child: new Text(
                                  //     //         'برنامه نویسی موبایل',
                                  //     //         style: new TextStyle(
                                  //     //           color: Color(0xff2c003e),
                                  //     //           fontSize: 10.0,
                                  //     //         ),
                                  //     //       ),
                                  //     //     ))
                                  //   ],
                                  // ),
                                  Container(
                                    child: new Align(
                                      alignment: Alignment.topRight,
                                      child: new Padding(
                                        padding: EdgeInsets.only(right: 8.0),
                                        child: Container(
                                          width: phoneSize.width*.6,
                                          child:
                                          widget.model.moarefinameh ==null || widget.model.moarefinameh == ""
                                          ? new SizedBox(height: 0,)
                                          : new Text(
                                            widget.model.moarefinameh,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(fontSize: SizeConfig.textMultiplier * 2.3),
                                          )
                                        ),
                                      ),
                                    ),
                                  )
                                ]),
                          ),
                          // new Expanded(child: new Container()),
                          Expanded(
                            flex: 2,
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(/*bottom: 3.0*/ right: 8.0),
                              child: new Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.only(bottom: SizeConfig.textMultiplier * 0.5),
                                    child: new Icon(
                                      Icons.location_on,
                                      size: SizeConfig.textMultiplier*1.8,
                                      color: Colors.red,
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(right: 2.0,),
                                    child: new Text(
                                      widget.model.address ==null || widget.model.address == ""
                                          ? "نامشخص"
                                          : widget.model.address,
                                      style: TextStyle(fontSize: SizeConfig.textMultiplier*1.7),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),

                Expanded(
                  flex: 1,
                  child: new Padding(
                    padding: const EdgeInsets.only(top: 5.0, left: 7.0),
                    child: widget.model.image=="" || widget.model.image==null
                    ?Container(
                      height: phoneSize.height * 0.10,
                      width: phoneSize.width * 0.19,
                      child: new CircleAvatar(
                          child: new Text(widget.model.username.toString().substring(0,1),style: TextStyle(fontSize: 25.0,color: Colors.white),),
                          backgroundColor: R.color.banafshKamRang,
                          // minRadius: 30.0
                      ),
                    ):new Container(
                      height: phoneSize.height * 0.10,
                      width: phoneSize.width * 0.19,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: new NetworkImage("http://stube.ir/image/${widget.model.image}"),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.all(Radius.circular(45)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        // new Divider(),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
