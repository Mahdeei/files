import 'package:flutter/material.dart';
import 'package:stubbbb/Models/myData.dart';
import 'package:stubbbb/Models/profileModels.dart';
import 'package:stubbbb/Other/R.dart';
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
    return new Column(
      children: <Widget>[
        new GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => widget.profile.id != widget.model.id
                      ? ProPage(user: widget.model, profile: widget.profile)
                      : MyProfileStudentScreen(
                          id: widget.profile.id,
                        )),
            );
          },
          child: Card(
            // shape: ShapeBorder.lerp(2.0, ShapeBorder, 3.0),
            // elevation: 2.0,
            color: Colors.grey[100],
            child: new Row(
              children: <Widget>[
                new Padding(
                  padding: const EdgeInsets.only(top: 20.0, right: 15.0),
                  child: new Container(
                    height: phoneSize.height * 0.1,
                    width: phoneSize.width * 0.7,
                    child: new Column(
                      children: <Widget>[
                        new Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              margin: const EdgeInsets.only(top: 3),
                              width: phoneSize.width * .3,
                              child: new Text(widget.profile.name,
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.0)),
                            ),
                            Container(margin: const EdgeInsets.only(left: 5),
                              alignment: Alignment.centerLeft,
                              width: phoneSize.width * .35,
                              child: new Text(
                                widget.model.username,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.0),
                              ),
                            ),
                          ],
                        ),
                        new Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
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
                                width: phoneSize.width * 0.6,
                                height: phoneSize.height * 0.03,
                                child: new Align(
                                  alignment: Alignment.topRight,
                                  child: new Padding(
                                    padding: EdgeInsets.only(right: 8.0),
                                    child: Container(
                                      width: phoneSize.width*.6,
                                      child: new Text(
                                        widget.model.moarefinameh,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(fontSize: 17.0),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ]),
                        new Expanded(child: new Container()),
                        Padding(
                          padding:
                              const EdgeInsets.only(bottom: 3.0, right: 8.0),
                          child: new Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              new Icon(
                                Icons.location_on,
                                size: 13.0,
                                color: Colors.red,
                              ),
                              Container(
                                padding: EdgeInsets.only(right: 2.0),
                                child: new Text(
                                  widget.model.address,
                                  style: TextStyle(fontSize: 10.0),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                new Padding(
                  padding: const EdgeInsets.only(top: 5.0, right: 0.0),
                  child: new Container(
                    height: phoneSize.height * 0.11,
                    width: phoneSize.width * 0.21,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: new AssetImage(R.images.axGoshi),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.all(Radius.circular(45)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        // new Divider(),
      ],
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
