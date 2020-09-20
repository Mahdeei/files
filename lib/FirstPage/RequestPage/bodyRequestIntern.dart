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
    if(this.mounted){
      setState(() {
        isLoading = true;
      });
    }
    profiles= await RequestHttp.getProfileIntern(widget.profile.id);
    var response = await RequestHttp.getIntern(widget.profile.id);
    requestsIntern.addAll(response['requests']);
    if(this.mounted){
      setState(() {
        isLoading= false;
      });
    }

  }


  @override
  Widget build(BuildContext context) {
    var phoneSize = MediaQuery.of(context).size;
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
                    new MyRequests(userName: profiles[index].username,
                        date: requestsIntern[index].date,
                        text: requestsIntern[index].req_text)));
              },
              child: new Container(
                margin: const EdgeInsets.only(top: 5.0),
                width: widget.phoneSize.width,
                child: new Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(right:8.0),
                      child: new Row(
                        children: <Widget>[
                          //TODO inja az comment dar biad
                          profiles[index].image =="" || profiles[index].image==null
                              ? Container(
                            height: phoneSize.height * 0.10,
                            width: phoneSize.width * 0.19,
                            child: new CircleAvatar(
                              child: new Text(profiles[index].username.toString().substring(0,1),style: TextStyle(fontSize: 25.0,color: Colors.white),),
                              backgroundColor: R.color.banafshKamRang,
                              // minRadius: 30.0
                            ),
                          )
                              : Center(
                            child: new CircleAvatar(radius: 37,
                              backgroundImage: new NetworkImage("http://stube.ir/image/${profiles[index].image}",),
                              backgroundColor: R.color.banafshKamRang,
                              // minRadius: 30.0
                            ),
                          ),
                          new Column(
                            crossAxisAlignment:
                            CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                MainAxisAlignment.spaceEvenly,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top:12.0,right:8.0),
                                    child: new Text(profiles[index].username,style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.w800),),
                                  ),
                                  // new Expanded(),
                                  Padding(
                                    padding: const EdgeInsets.only(top:12.0,right: 120.0),
                                    child: new Row(
                                      children: <Widget>[
                                        new Text(
                                          textTime(requestsIntern[index].date),
                                          style: TextStyle(fontSize: 12.0),
                                        ),

                                        // new Padding(
                                        //   padding: const EdgeInsets.only(left: 27.0),
                                        //   child: new Row(
                                        //     children: <Widget>[
                                        //       new Text(
                                        //         'khorasan,mashhad',
                                        //         style: TextStyle(fontSize: 8.0),
                                        //       ),
                                        //       new Icon(
                                        //         Icons.location_on,
                                        //         size: 10.0,
                                        //       )
                                        //     ],
                                        //   ),
                                        // )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              new Row(
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(right:8.0),
                                    child: new SizedBox(
                                      width: 250.0,
                                      child: new Text(
                                        requestsIntern[index].req_text,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ),

                                  // ButtonMore(),
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    ),

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
