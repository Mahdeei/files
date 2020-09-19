import 'package:flutter/material.dart';
import 'package:stubbbb/AgahiPage/AgahPage.dart';
import 'package:stubbbb/Models/RequestProfile.dart';
import 'package:stubbbb/Models/RequestUser.dart';
import 'package:stubbbb/Models/myData.dart';
import 'package:stubbbb/Other/widget.dart';
import 'package:stubbbb/http/httpRequest.dart';
import 'MyRequests.dart';

class bodyRequestUser extends StatefulWidget {

  MyData profile;
  var phoneSize;

  bodyRequestUser({this.phoneSize, this.profile});

  @override
  _bodyRequestUserState createState() => _bodyRequestUserState();
}


class _bodyRequestUserState extends State<bodyRequestUser> {

  bool isLoading = false;

  List<RequestUser> requestsUser =[];
  List<RequestProfile> requestProfile=[];


  @override
  void initState() {
    super.initState();
    _getRequestUser();
  }



  _getRequestUser() async {
    setState(() {
      isLoading = true;
    });
    requestProfile= await RequestHttp.getProfile(widget.profile.id);
    var response = await RequestHttp.getReqUser(widget.profile.id);
    requestsUser.addAll(response);
    setState(() {
      isLoading= false;
    });

  }


  @override
  Widget build(BuildContext context) {
    return isLoading
        ? new Center(child: new CircularProgressIndicator(),)
        :requestsUser.length == 0
        ? new Center(
        child: new Text(
          'در حال حاضر هیچ درخواستی برای کارآموزی های شما وجود ندارد (:',
          style: TextStyle(color: Colors.black),
        ))
        : new ListView.builder(
        padding: const EdgeInsets.only(top: 5.0),
        itemCount: requestsUser.length,
        itemBuilder: (BuildContext context, int index) =>
        new Column(
          children: <Widget>[
            new GestureDetector(
              onTap: () {
                Navigator.of(context).push(new MaterialPageRoute(
                    builder: (ctx) =>
                    new MyRequests(userName: requestProfile[index].username,
                        date: requestsUser[index].date,
                        text: requestsUser[index].req_text)));
              },
              child: new Container(
                margin: const EdgeInsets.only(top: 5.0),
                width: widget.phoneSize.width,
                child: new Column(
                  children: <Widget>[
                    new Row(
                      children: <Widget>[
                        //TODO inja az comment dar biad
                        requestProfile[index].image =="" || requestProfile[index].image==null
                            ? new CircleAvatar(
                          backgroundColor: Colors.blue,
                        )
                            :new Container(
                            margin: const EdgeInsets.symmetric(horizontal: 8.0),
                            height: widget.phoneSize.height * 0.10,
                            width: widget.phoneSize.width * 0.19,
                            decoration: BoxDecoration(shape: BoxShape.circle,image: DecorationImage(fit: BoxFit.cover,image: NetworkImage("http://stube.ir/image/${requestProfile[index].image}")))
                        ),
                        new Column(
                          crossAxisAlignment:
                          CrossAxisAlignment.start,
                          children: <Widget>[
                            new Text(requestProfile[index].username),
                            new Row(
                              children: <Widget>[
                                new SizedBox(
                                  width: 250.0,
                                  child: new Text(
                                    requestsUser[index].req_text,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                ButtonMore(),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                    new Row(
                      mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        new Padding(
                          padding: const EdgeInsets.only(right: 80.0),
                          child: new Text(
                            textTime(requestsUser[index].date),
                            style: TextStyle(fontSize: 12.0),
                          ),
                        ),
                        new Padding(
                          padding: const EdgeInsets.only(left: 27.0),
                          child: new Row(
                            children: <Widget>[
                              new Text(
                                'khorasan,mashhad',
                                style: TextStyle(fontSize: 8.0),
                              ),
                              new Icon(
                                Icons.location_on,
                                size: 10.0,
                              )
                            ],
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            Line()
          ],
        )
    );
  }
}
