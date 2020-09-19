import 'package:flutter/material.dart';
import 'package:stubbbb/AgahiPage/AgahPage.dart';
import 'package:stubbbb/Models/REquestIntern.dart';
import 'package:stubbbb/Models/RequestProfile.dart';
import 'package:stubbbb/Models/myData.dart';
import 'package:stubbbb/Other/R.dart';
import 'package:stubbbb/Other/widget.dart';
import 'package:stubbbb/http/httpRequest.dart';
import 'MyRequests.dart';

class bodyRequestIntern extends StatefulWidget {

  MyData profile;
  var phoneSize;

  bodyRequestIntern({this.phoneSize, this.profile});

  @override
  _bodyRequestInternState createState() => _bodyRequestInternState();
}


class _bodyRequestInternState extends State<bodyRequestIntern> {

  bool isLoading = false;

  List<RequestIntern> requestsIntern =[];
  List<RequestProfile> profiles=[];


  @override
  void initState() {
    super.initState();
    _getRequestIntern();
  }



  _getRequestIntern() async {
    setState(() {

      isLoading = true;
    });
    profiles= await RequestHttp.getProfileIntern(widget.profile.id);
    var response = await RequestHttp.getIntern(widget.profile.id);
    requestsIntern.addAll(response['requests']);
    setState(() {
      isLoading= false;
    });

  }


  @override
  Widget build(BuildContext context) {
    return isLoading
        ? new Center(child: new CircularProgressIndicator(),)
        :requestsIntern.length == 0
        ? new Center(
        child: new Text(
          'در حال حاضر هیچ درخواستی برای کارآموزی های شما وجود ندارد (:',
          style: TextStyle(color: Colors.black),
        ))
        : new ListView.builder(
        padding: const EdgeInsets.only(top: 5.0),
        itemCount: requestsIntern.length,
        itemBuilder: (BuildContext context, int index) =>
        new Column(
          children: <Widget>[
            new GestureDetector(
              onTap: () {
                Navigator.of(context).push(new MaterialPageRoute(
                    builder: (ctx) =>
                    new MyRequests(userName: profiles[index],
                        date: requestsIntern[index].date,
                        text: requestsIntern[index].req_text)));
              },
              child: new Container(
                margin: const EdgeInsets.only(top: 5.0),
                width: widget.phoneSize.width,
                child: new Column(
                  children: <Widget>[
                    new Row(
                      children: <Widget>[
                        //TODO inja az comment dar biad
                        profiles[index].image=="" || profiles[index].image==null
                            ? new CircleAvatar(
                          child: new Text(profiles[index].username.toString().substring(0,1)),
                          backgroundColor: R.color.banafshKamRang,
                        )
                            : new CircleAvatar(
                          backgroundImage: NetworkImage("http://stube.ir/image/${profiles[index].image}"),
                        ),
                        // new Container(
                        //     margin: const EdgeInsets.symmetric(horizontal: 8.0),
                        //     height: widget.phoneSize.height * 0.10,
                        //     width: widget.phoneSize.width * 0.19,
                        //     decoration: decorationImageHomePage()
                        // ),
                        new Column(
                          crossAxisAlignment:
                          CrossAxisAlignment.start,
                          children: <Widget>[

                            new Text(profiles[index].username),
                            new Row(
                              children: <Widget>[
                                new SizedBox(
                                  width: 250.0,
                                  child: new Text(
                                    requestsIntern[index].req_text,
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
                            textTime(requestsIntern[index].date),
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
