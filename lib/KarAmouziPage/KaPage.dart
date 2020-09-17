import 'package:flutter/material.dart';
import 'package:stubbbb/AgahiPage/AgahPage.dart';
import 'package:stubbbb/KarAmouziPage/SendReqIntern.dart';
import 'package:stubbbb/Models/InterShip.dart';
import 'package:stubbbb/Models/myData.dart';
import 'package:stubbbb/Other/widget.dart';



class KaPage extends StatefulWidget {
  KaPage({this.interShip,this.profile});
  InterShip interShip;
  MyData profile;
  @override
  _KaPageState createState() => _KaPageState();
}

class _KaPageState extends State<KaPage> {
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
    print(new DateTime.now().toString().substring(11,19));
    print(DateTime.now());
    return new Directionality(
        textDirection: TextDirection.rtl,
        child: new SafeArea(
            top: true,
            child: new Scaffold(
              body: ListView(
                children: <Widget>[
                  HeadersItemsPage(interShip: widget.interShip,profile: widget.profile,),
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[

                     new Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                          new Icon(Icons.timer,color: Colors.black54,size: 20.0,),
                          new SizedBox(width: 3.0,),
                          new Padding(
                            padding: const EdgeInsets.only(top: 3.0),
                            child: new Text('4 ساعت در روز',style: TextStyle(color: Colors.black54,fontSize: 15.0))
                      )
                      ],
                      ),
                      // rowTwoKaramouziScreen(),
                    ],
                  ),
                  paddingOneKaramouziScreen(),
                  Line(),
                  paddingTwoKaramouziScreen(widget.interShip.description),
                  Line(),
                  paddingThreeKaramouziScreen(),
                  paddingFourKaramouziScreen(),
                  Line(),
                  paddingFiveKaramouziScreen(),
                  paddingSixKaramouziScreen(),
                  Line(),
                  paddingSevenKaramouziScreen(),
                  Line(),
                  paddingEightKaramouziScreen(),
                  new Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10.0),
                      child: new Column(
                        children: <Widget>[
                          rowKaramouziScreenOne(),
                          new SizedBox(height: 5,),
                          rowKaramouziScreenTwo(),
                          new SizedBox(height: 5,),
                          rowKaramouziScreenThree(),
                      ],
                    )
                  ),
                ],
              )
        )));
  }


}


class HeadersItemsPage extends StatelessWidget {
  InterShip interShip;
  MyData profile;
  HeadersItemsPage({this.profile,this.interShip});
  @override
  Widget build(BuildContext context) {
    var phonesize = MediaQuery.of(context).size;
    return new Column(
      children: <Widget>[
        new Row(
          children: <Widget>[
            new Container(
              height: phonesize.height*0.25,
              width: phonesize.width * 0.45,
              decoration: BoxDecoration(
                  image: DecorationImage(colorFilter: ColorFilter.mode(Colors.black45, BlendMode.darken),
                      fit: BoxFit.cover,
                      image: AssetImage('assets/image/dev.jpg',)
                  )
              ),
              child:new Align(alignment: Alignment.topRight,
                child:   new IconButton(icon: Icon(Icons.share,color: Colors.white,), onPressed: (){print('pressed');}),),
            ),
            new Container(
              height: phonesize.height*0.25,
              width:phonesize.width*0.55,
              color: Color(0xff2D0827),
              child: new Column(
                children: <Widget>[
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      new Padding(padding: const EdgeInsets.only(top: 2.0,right: 5.0),
                        child: new CircleAvatar(backgroundImage: AssetImage('assets/image/avt.jpg'),maxRadius: 16.0,)
                        ,),
                      new IconButton(icon: Icon(Icons.arrow_forward,color: Colors.white,), onPressed: (){})

                    ],
                  ),
                  new Align(alignment: Alignment.topRight,
                    child: new Padding(padding: const EdgeInsets.only(right: 5.0),
                      child: new Text(interShip.title,overflow: TextOverflow.ellipsis,maxLines: 1,
                        style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.bold,color: Colors.white),),),),
                  new Align(alignment: Alignment.topRight,
                      child: new Padding(padding: const EdgeInsets.only(right: 8.0),
                        child: new Text('تکنولوژی و فناوری اطلاعات',overflow: TextOverflow.ellipsis,maxLines: 1,
                          style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold,color: Color(0xff44143E),),),)),
                  new SizedBox(height: phonesize.height*0.04,),
                  new Align(alignment: Alignment.bottomCenter,
                    child: new Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                          child: new Container(decoration: BoxDecoration(color: Colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(20.0))),
                            width: phonesize.width*0.34,
                            child: new Text('شروع کار',
                              style:TextStyle(
                                  color: Color(0xff2D0827),fontWeight: FontWeight.bold,fontSize: 14.0),
                              textAlign: TextAlign.center,),
                          ),
                          onTap: (){
                            Navigator.of(context).push(new MaterialPageRoute(builder: (ctx) => new SendReqIntern(profile: profile,interShip: interShip,)));
                          },
                        ),
                        new GestureDetector(
                          child: Icon(Icons.bookmark_border,color: Colors.white,),
                        )



                      ],
                    ),)
                ],),)
          ],
        )
      ],
    )
    ;
  }
}

