import 'package:flutter/material.dart';
import 'package:stubbbb/AgahiPage/AgahPage.dart';
import 'package:stubbbb/Other/widget.dart';



class KaPage extends StatefulWidget {
  @override
  _KaPageState createState() => _KaPageState();
}

class _KaPageState extends State<KaPage> {
  @override
  Widget build(BuildContext context) {
    return new Directionality(
        textDirection: TextDirection.rtl,
        child: new SafeArea(
            top: true,
            child: new Scaffold(
              body: ListView(
                children: <Widget>[
                  HeadersItemsPage(),
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
                  paddingTwoKaramouziScreen(),
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

