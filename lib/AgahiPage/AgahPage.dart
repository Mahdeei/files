import 'package:flutter/material.dart';
import 'package:stubbbb/AgahiPage/Send_Req.dart';
import 'package:stubbbb/Models/AgahiModel.dart';
import 'package:stubbbb/Models/myData.dart';
import 'package:stubbbb/Other/SizeConfig.dart';

class AdvertisingScreen extends StatefulWidget {
  Advertising advertising;
  MyData profile;

  AdvertisingScreen({this.profile, this.advertising});

  @override
  _AdvertisingScreenState createState() => _AdvertisingScreenState();
}

class _AdvertisingScreenState extends State<AdvertisingScreen> {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        debugShowCheckedModeBanner: false,
        home: new Directionality(
            textDirection: TextDirection.rtl,
            child: new SafeArea(
                top: true,
                child: new Scaffold(
                    body: ListView(
                    children: <Widget>[
                          HeadersItemsPage(
                            profile: widget.profile,
                            advertising: widget.advertising,
                          ),
                      // HeadersItems(advertising: widget.advertising,profile: widget.profile,),
                      new Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            new Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                new Icon(
                                  Icons.timer,
                                  color: Colors.black54,
                                  size: SizeConfig.textMultiplier*3
                                ),
                                new SizedBox(
                                  width: 3.0,
                                ),
                                new Padding(
                                  padding: const EdgeInsets.only(top: 3.0),
                                  child: new Text(
                                    widget.advertising.date,
                                    style: TextStyle(
                                        color: Colors.black54, fontSize: SizeConfig.textMultiplier*2),
                                  ),
                                )
                              ],
                            ),
                            new Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                new Icon(
                                  Icons.attach_money,
                                  color: Colors.black54,
                                  size: SizeConfig.textMultiplier*3,
                                ),
                                new SizedBox(
                                  width: 3.0,
                                ),
                                new Padding(
                                  padding:
                                      const EdgeInsets.only(top: 3.0, left: 3.0),
                                  child: new Text(
                                    'تا 2,000,000 تومان',
                                    style: TextStyle(
                                        color: Colors.black54, fontSize: SizeConfig.textMultiplier*2),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                        new Padding(
                          padding:  EdgeInsets.symmetric(
                              horizontal: SizeConfig.imageSizeMultiplier * 5.5,
                              vertical: SizeConfig.heightMultiplier * 1.5),
                          child: new Text(
                            widget.advertising.description,
                            style: TextStyle(fontSize: 17.0),
                          ),
                        ),
                        Line(),
                        new Padding(
                          padding: EdgeInsets.only(
                              right: SizeConfig.imageSizeMultiplier * 3.5,
                              top: SizeConfig.heightMultiplier * 1.5),
                          child: new Text(
                            'شرایط',
                            style: TextStyle(
                                fontSize:SizeConfig.heightMultiplier * 3, fontWeight: FontWeight.bold),
                          ),
                        ),
                        new Padding(
                          padding:  EdgeInsets.symmetric(
                              horizontal: SizeConfig.imageSizeMultiplier * 5.5,
                              vertical: SizeConfig.heightMultiplier * 1.5),
                          child: new Text(
                            widget.advertising.conditions,
                            style: TextStyle(fontSize: SizeConfig.heightMultiplier * 2.7),
                          ),
                        ),
                        Line(),
                        new Padding(
                          padding: EdgeInsets.only(
                              right: SizeConfig.imageSizeMultiplier * 3.5,
                              top: SizeConfig.heightMultiplier * 1.5),
                          child: new Text(
                            'آدرس',
                            style: TextStyle(
                                fontSize: SizeConfig.heightMultiplier * 3, fontWeight: FontWeight.bold),
                          ),
                        ),
                        new Padding(
                          padding:  EdgeInsets.symmetric(
                              horizontal: SizeConfig.imageSizeMultiplier * 5.5,
                              vertical: SizeConfig.heightMultiplier * 1.5),
                          child: new Text(
                            'بلوار پیروزی، میدان سلمان',
                            style: TextStyle(fontSize: SizeConfig.heightMultiplier * 2.7),
                          ),
                        ),
                        // Line(),
                        // new Padding(
                        //     padding: const EdgeInsets.symmetric(
                        //         horizontal: 20.0, vertical: 20.0),
                        //     child: new Wrap(
                        //       runSpacing: 8.0,
                        //       spacing: 7.0,
                        //       children: <Widget>[
                        //         ObjectTag(
                        //           tags: 'برنامه نویسی',
                        //         ),
                        //         ObjectTag(
                        //           tags: 'فرانت اند',
                        //         ),
                        //         ObjectTag(
                        //           tags: 'بک اند',
                        //         ),
                        //         ObjectTag(
                        //           tags: 'گرافیک',
                        //         ),
                        //         ObjectTag(
                        //           tags: 'ui',
                        //         ),
                        //       ],
                        //     ))
                      ],
                )))));
  }
}

class HeadersItemsPage extends StatelessWidget {
  Advertising advertising;
  MyData profile;

  HeadersItemsPage({this.profile, this.advertising});

  @override
  Widget build(BuildContext context) {
    var phonesize = MediaQuery.of(context).size;
    return new Row(
          children: <Widget>[
            Expanded(
              flex: 4,
              child: new Container(
                height: phonesize.height * 0.25,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        colorFilter:
                            ColorFilter.mode(Colors.black45, BlendMode.darken),
                        fit: BoxFit.cover,
                        image: AssetImage(
                          'assets/image/dev.jpg',
                        ))),
              ),
            ),
            Expanded(
              flex: 5,
              child: new Container(
                height: phonesize.height * 0.25,
                color: Color(0xff2D0827),
                child: new Column(
                  children: <Widget>[
                    Expanded(
                      flex: 2,
                      child: new Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          // new Padding(
                          //   padding: const EdgeInsets.only(top: 2.0, right: 5.0),
                          //   child: new CircleAvatar(
                          //     backgroundImage: AssetImage('assets/image/avt.jpg'),
                          //     maxRadius: 16.0,
                          //   ),
                          // ),
                          new IconButton(
                              icon: Icon(
                                Icons.arrow_forward,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                // Navigator.of(context).pop(false);
                              })
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: new Align(
                        alignment: Alignment.bottomRight,
                        child: new Padding(
                          padding:  EdgeInsets.only(right: SizeConfig.imageSizeMultiplier * 1.3,top: SizeConfig.heightMultiplier * 2),
                          child: Container(
                            width: SizeConfig.imageSizeMultiplier *50,
                            child: new Text(
                              advertising.title,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: TextStyle(
                                  fontSize: SizeConfig.heightMultiplier * 3.5,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                    // Expanded(
                    //   flex: 2,
                    //   child: new Align(
                    //       alignment: Alignment.centerRight,
                    //       child: new Padding(
                    //         padding:  EdgeInsets.only(right: 8.0,top: SizeConfig.heightMultiplier *1.5),
                    //         child: new Text(
                    //           'تکنولوژی و فناوری اطلاعات',
                    //           overflow: TextOverflow.ellipsis,
                    //           maxLines: 1,
                    //           style: TextStyle(
                    //             fontSize: 16.0,
                    //             fontWeight: FontWeight.bold,
                    //             color: Color(0xff44143E),
                    //           ),
                    //         ),
                    //       )),
                    // ),
                    Expanded(
                      flex: 4,
                        child: new Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              // new GestureDetector(
                              //   child: Icon(Icons.playlist_add_check,color: Colors.white,size: 28.0,),
                              // ),
                              // new GestureDetector(
                              //   child: new Container(decoration: BoxDecoration(color: Colors.white,
                              //       borderRadius: BorderRadius.all(Radius.circular(20.0))),
                              //     width: phonesize.width*0.17,
                              //     child: new Text('پیام',
                              //       style:TextStyle(
                              //           color: Color(0xff2D0827),fontWeight: FontWeight.bold,fontSize: 14.0),
                              //       textAlign: TextAlign.center,),
                              //   ),
                              // ),
                              new GestureDetector(
                                child: new Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(SizeConfig.heightMultiplier*3))),
                                  width: phonesize.width * 0.34,
                                  child: new Text(
                                    'شروع کار',
                                    style: TextStyle(
                                        color: Color(0xff2D0827),
                                        fontWeight: FontWeight.bold,
                                        fontSize: SizeConfig.textMultiplier*2),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                onTap: () {
                                  Navigator.of(context).push(new MaterialPageRoute(
                                      builder: (ctx) => new SendReq(
                                            profile: profile,
                                            advertising: advertising,
                                          )));
                                },
                              ),
                              // new GestureDetector(
                              //   child: Icon(
                              //     Icons.bookmark_border,
                              //     color: Colors.white,
                              //   ),
                              // )
                            ],
                          ),
                      ),


                  ],
                ),
              ),
            )
          ],
        )
     ;
  }
}

class Line extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
      child: new Container(
        height: 1.0,
        color: Colors.grey[300],
      ),
    );
  }
}

class ObjectTag extends StatelessWidget {
  final String tags;

  const ObjectTag({this.tags});

  @override
  Widget build(BuildContext context) {
    return new Container(
        height: 20.0,
        decoration: BoxDecoration(
            color: Color(0xff2D0827),
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(15.0)),
        child: new Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 3.0),
          child: new Text(
            tags,
            style: new TextStyle(
              color: Colors.white,
              fontSize: 10.0,
            ),
          ),
        ));
  }
}
