import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stubbbb/Other/SizeConfig.dart';



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
          title: Text('پشتیبانی',style: TextStyle(color: Colors.black,fontSize: SizeConfig.textMultiplier*2.2),),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(SizeConfig.heightMultiplier*4),
            ),
          ),
          elevation: 5.0,
          bottomOpacity: 25.0,
        ),
        body: Padding(
          padding:  EdgeInsets.all(SizeConfig.imageSizeMultiplier*2),
          child: Column(
            children: [
              new Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  new Text('با ما در ارتباط باشید :',style: new TextStyle(fontSize: SizeConfig.textMultiplier*2.5),),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  new Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Padding(
                        padding:  EdgeInsets.all(SizeConfig.imageSizeMultiplier*2),
                        child: new Row(
                          children: [
                            new GestureDetector(
                              child: new Text('admin@stube.ir',style: new TextStyle(fontSize: SizeConfig.textMultiplier*2.5),),
                              onTap: () {
                                Clipboard.setData(new ClipboardData(text: 'admin@stube.ir'));
                                key.currentState.showSnackBar(
                                    new SnackBar(content: new Text("در کلیپ بورد شما کپی شد"),));
                              },
                            ),
                            new SizedBox(width: SizeConfig.imageSizeMultiplier*2.5,),
                            new Icon(Icons.email),

                          ],),
                      ),
                      Padding(
                        padding:  EdgeInsets.all(SizeConfig.imageSizeMultiplier*2),
                        child: new Row(
                          children: [
                            new GestureDetector(
                              child: new Text('stubeir',style: new TextStyle(fontSize: SizeConfig.textMultiplier*2.5),),
                              onTap: () {
                                Clipboard.setData(new ClipboardData(text: 'stubeir'));
                                key.currentState.showSnackBar(
                                    new SnackBar(content: new Text("در کلیپ بورد شما کپی شد"),));
                              },
                            ),
                            new SizedBox(width: SizeConfig.imageSizeMultiplier*2.5,),
                            new Container(
                              height: SizeConfig.imageSizeMultiplier*5.5,
                              width: SizeConfig.imageSizeMultiplier*5.5,
                              decoration: BoxDecoration(color: Colors.white,
                                  image: DecorationImage(image: NetworkImage('http://stube.ir/StubeImages/87390.png'))),
                            ),

                          ],),
                      ),
                      Padding(
                        padding:  EdgeInsets.all(SizeConfig.imageSizeMultiplier*2),
                        child: new Row(
                          children: [
                            new GestureDetector(
                              child: new Text('t.me/stubeir',style: new TextStyle(fontSize: SizeConfig.textMultiplier*2.5),),
                              onTap: () {
                                Clipboard.setData(new ClipboardData(text: 't.me/stubeir'));
                                key.currentState.showSnackBar(
                                    new SnackBar(content: new Text("در کلیپ بورد شما کپی شد"),));
                              },
                            ),
                            new SizedBox(width: SizeConfig.imageSizeMultiplier*2.5,),
                            new Container(
                              height: SizeConfig.imageSizeMultiplier*5.5,
                              width: SizeConfig.imageSizeMultiplier*5.5,
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
