import 'package:flutter/material.dart';
import 'package:flutter/services.dart';



class ErtebatBaMa extends StatefulWidget {
  @override
  _ErtebatBaMaState createState() => _ErtebatBaMaState();
}

class _ErtebatBaMaState extends State<ErtebatBaMa> {
  GlobalKey<ScaffoldState> key = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,

      child: Scaffold(
        key: key,
        appBar: new AppBar(
          actions: [
            IconButton(icon: Icon(Icons.arrow_forward,color: Colors.black,), onPressed:(){ Navigator.of(context).pop();})
          ],
          backgroundColor: Colors.white,
          title: Text('پشتیبانی',style: TextStyle(color: Colors.black),),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30),
            ),
          ),
          elevation: 5.0,
          bottomOpacity: 25.0,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              new Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  new Text('با ما در ارتباط باشید :',style: new TextStyle(fontSize: 18),),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  new Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: new Row(
                          children: [
                            new GestureDetector(
                              child: new Text('admin@stube.ir',style: new TextStyle(fontSize: 18),),
                              onTap: () {
                                Clipboard.setData(new ClipboardData(text: 'admin@stube.ir'));
                                key.currentState.showSnackBar(
                                    new SnackBar(content: new Text("در کلیپ بورد شما کپی شد"),));
                              },
                            ),
                            new SizedBox(width: 10,),
                            new Icon(Icons.email),

                          ],),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: new Row(
                          children: [
                            new GestureDetector(
                              child: new Text('stubeir',style: new TextStyle(fontSize: 18),),
                              onTap: () {
                                Clipboard.setData(new ClipboardData(text: 'stubeir'));
                                key.currentState.showSnackBar(
                                    new SnackBar(content: new Text("در کلیپ بورد شما کپی شد"),));
                              },
                            ),
                            new SizedBox(width: 10,),
                            new Container(
                              height: 22,
                              width: 22,
                              decoration: BoxDecoration(color: Colors.white,
                                  image: DecorationImage(image: NetworkImage('http://stube.ir/StubeImages/87390.png'))),
                            ),

                          ],),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: new Row(
                          children: [
                            new GestureDetector(
                              child: new Text('t.me/stubeir',style: new TextStyle(fontSize: 18),),
                              onTap: () {
                                Clipboard.setData(new ClipboardData(text: 't.me/stubeir'));
                                key.currentState.showSnackBar(
                                    new SnackBar(content: new Text("در کلیپ بورد شما کپی شد"),));
                              },
                            ),
                            new SizedBox(width: 10,),
                            new Container(
                              height: 22,
                              width: 22,
                              decoration: BoxDecoration(color: Colors.white,
                                  image: DecorationImage(image: NetworkImage('http://stube.ir/StubeImages/telegram.png'))),
                            ),

                          ],),
                      ),
                    ],
                  ),
                ],
              )

            ],
          ),
        ),
      ),
    );
  }
}
