import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stubbbb/AgahiPage/AgahPage.dart';
import 'package:stubbbb/KarAmouziPage/SendReqIntern.dart';
import 'package:stubbbb/Models/InterShip.dart';
import 'package:stubbbb/Models/myData.dart';
import 'package:stubbbb/Other/SizeConfig.dart';
import 'package:stubbbb/Other/widget.dart';

class KaPage extends StatefulWidget {
  KaPage({this.interShip, this.profile});

  InterShip interShip;
  MyData profile;

  @override
  _KaPageState createState() => _KaPageState();
}

class _KaPageState extends State<KaPage> {
  GlobalKey<ScaffoldState> key = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    print(widget.interShip.description);
    // DateFormat dateFormat = DateFormat("yyyy-MM-dd HH:mm:ss");
    // final DateFormat displayFormater = DateFormat('yyyy-MM-dd HH:mm:ss.SSS');
    // Jalali jNow = Jalali.now();
    // print(jNow.year);
    // print(jNow.month);
    // print(jNow.day);
    // print(jNow);
    print(new DateTime.now().toString().substring(11, 19));
    print(DateTime.now());
    return new Directionality(
        textDirection: TextDirection.rtl,
        child: new SafeArea(
            top: true,
            child: new Scaffold(
                key: key,
                body: ListView(
                  children: <Widget>[
                    HeadersItemsPage(
                      interShip: widget.interShip,
                      profile: widget.profile,
                    ),
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        new Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            new Icon(
                              Icons.timer,
                              color: Colors.black54,
                              size: 20.0,
                            ),
                            new SizedBox(
                              width: 3.0,
                            ),
                            new Padding(
                                padding: const EdgeInsets.only(top: 3.0),
                                child: new Text(widget.interShip.time_work,
                                    style: TextStyle(
                                        color: Colors.black54,
                                        fontSize:
                                            SizeConfig.textMultiplier * 2)))
                          ],
                        ),
                        new Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            new Icon(
                              Icons.people,
                              color: Colors.black54,
                              size: SizeConfig.heightMultiplier * 3,
                            ),
                            new SizedBox(
                              width: SizeConfig.imageSizeMultiplier,
                            ),
                            new Padding(
                                padding: EdgeInsets.only(
                                    top: SizeConfig.heightMultiplier * 0.5,
                                    left: SizeConfig.imageSizeMultiplier),
                                child: new Text(
                                  widget.interShip.numberinternship,
                                  style: TextStyle(
                                      color: Colors.black54,
                                      fontSize: SizeConfig.textMultiplier * 2),
                                ))
                          ],
                        )
                      ],
                    ),
                    paddingOneKaramouziScreen(),
                    Line(),
                    paddingTwoKaramouziScreen(widget.interShip.description),
                    widget.interShip.conditions == null ||
                            widget.interShip.conditions == ""
                        ? new Container()
                        : Line(),
                    widget.interShip.conditions == null ||
                            widget.interShip.conditions == ""
                        ? new Container()
                        : paddingThreeKaramouziScreen(),
                    widget.interShip.conditions == null ||
                            widget.interShip.conditions == ""
                        ? new Container()
                        : paddingFourKaramouziScreen(
                            widget.interShip.conditions),
                    Line(),
                    paddingFiveKaramouziScreen(),
                    paddingSixKaramouziScreen(widget.interShip.address),
                    // Line(),
                    // paddingSevenKaramouziScreen(),
                    Line(),
                    paddingEightKaramouziScreen(),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 10.0),
                      child: new Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          new GestureDetector(
                            child: new Text(
                              widget.interShip.phonenumber,
                              style: TextStyle(
                                  fontSize: SizeConfig.heightMultiplier * 2.5),
                            ),
                            onTap: () {
                              Clipboard.setData(new ClipboardData(
                                  text: widget.interShip.phonenumber));
                              key.currentState.showSnackBar(new SnackBar(
                                content: new Text("در کلیپ بورد شما کپی شد"),
                              ));
                            },
                          ),
                          new SizedBox(
                            width: 5.0,
                          ),
                          new Icon(
                            Icons.call,
                            size: SizeConfig.textMultiplier * 3,
                          ),
                        ],
                      ),
                    )
                    // rowKaramouziScreenOne(widget.interShip.phonenumber),
                    // paddingSixKaramouziScreen(widget.interShip.phonenumber),
                    // new Padding(
                    //     padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10.0),
                    //     child: new Column(
                    //       children: <Widget>[
                    //         rowKaramouziScreenOne(),
                    //         new SizedBox(height: 5,),
                    //         rowKaramouziScreenTwo(),
                    //         new SizedBox(height: 5,),
                    //         rowKaramouziScreenThree(),
                    //     ],
                    //   )
                    // ),
                  ],
                ))));
  }
}

class HeadersItemsPage extends StatelessWidget {
  InterShip interShip;
  MyData profile;

  HeadersItemsPage({this.profile, this.interShip});

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
                    image: interShip.image=="" || interShip.image==null
                      ? AssetImage("assets/image/drawing.png")
                      : NetworkImage(
                        'http://stube.ir/image/${interShip.image}')
                )),
          ),
        ),
        Expanded(
          flex: 5,
          child: new Container(
            height: phonesize.height * 0.25,
            color: Color(0xff2D0827),
            child: new Column(
              children: <Widget>[
                // Expanded(
                //   flex: 2,
                //   child: new Row(
                //     mainAxisAlignment: MainAxisAlignment.end,
                //     children: <Widget>[
                //       // new Padding(
                //       //   padding: const EdgeInsets.only(top: 2.0, right: 5.0),
                //       //   child: new CircleAvatar(
                //       //     backgroundImage: AssetImage('assets/image/avt.jpg'),
                //       //     maxRadius: 16.0,
                //       //   ),
                //       // ),
                //       new IconButton(
                //           icon: Icon(
                //             Icons.arrow_forward,
                //             color: Colors.white,
                //           ),
                //           onPressed: () {
                //             // Navigator.of(context).pop(false);
                //           })
                //     ],
                //   ),
                // ),
                Expanded(
                  flex: 4,
                  child: new Align(
                    alignment: Alignment.bottomRight,
                    child: new Padding(
                      padding: EdgeInsets.only(
                          right: SizeConfig.imageSizeMultiplier * 1.3,
                          top: SizeConfig.heightMultiplier * 2),
                      child: Container(
                        width: SizeConfig.imageSizeMultiplier * 50,
                        child: new Text(
                          interShip.title,
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
                      Expanded(
                        child: new GestureDetector(
                          child: new Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: SizeConfig.imageSizeMultiplier * 3),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(Radius.circular(
                                    SizeConfig.heightMultiplier * 3))),
                            width: phonesize.width * 0.34,
                            child: new Text(
                              'شروع کار',
                              style: TextStyle(
                                  color: Color(0xff2D0827),
                                  fontWeight: FontWeight.bold,
                                  fontSize: SizeConfig.textMultiplier * 2.3),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          onTap: () {
                            Navigator.of(context).push(new MaterialPageRoute(
                                builder: (ctx) => new SendReqIntern(
                                      profile: profile,
                                      interShip: interShip,
                                    )));
                          },
                        ),
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
    );
  }
}
