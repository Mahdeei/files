import 'package:flutter/material.dart';
import 'package:stubbbb/Component/textformfield.dart';
import 'package:stubbbb/Models/Profile.dart';
import 'package:stubbbb/Models/myData.dart';
import 'package:stubbbb/Other/R.dart';
import 'package:stubbbb/http/Authenticate.dart';

class MyProfileUserNormalScreen extends StatefulWidget {

  String id;
  MyProfileUserNormalScreen({id});


  @override
  _MyProfileUserNormalScreenState createState() => _MyProfileUserNormalScreenState();
}

class _MyProfileUserNormalScreenState extends State<MyProfileUserNormalScreen> {
  GlobalKey _formKeyOne = GlobalKey<FormState>();
  MyData profile;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getMyData();
  }
  _getMyData()async{
    MyData body = await AuthenticateService.getMyData(widget.id);
    profile = body;
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: new Scaffold(
            resizeToAvoidBottomInset: false,
            body: new ListView(
              children: [
                Column(
                  children: [
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        new FlatButton(
                            onPressed: (){
                              Navigator.of(context).pop();
                            },
                            child: new Text('ذخیره',style: TextStyle(fontSize: 20.0,color: R.color.banafshKamRang),)
                        ),
                        new IconButton(
                            icon: Icon(Icons.arrow_forward,size: 30.0,),
                            onPressed: (){Navigator.of(context).pop();}
                        ),
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 30.0,vertical: 10.0),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children :[

                            new GestureDetector(
                              child: new Stack(
                                children: [
                                  new Container(
                                    alignment: Alignment.center,
                                    child: new CircleAvatar(
                                      radius: 50.0,
                                      backgroundColor: Colors.grey,
                                      child: new Icon(Icons.person,size: 60.0,color: Colors.white),
                                    ),
                                  ),
                                  new Container(
                                    padding: EdgeInsets.only(left: 60.0,top: 70.0),
                                    alignment: Alignment.bottomCenter,
                                    child: new Icon(Icons.add,size: 40.0,),
                                  )
                                ],
                              ),
                              onTap: (){
                                print('pressed');
                              },
                            ),
                            new SizedBox(height: 10.0,),
                            new Align(
                              alignment: Alignment.center,
                              child: new Text(profile.username,style: TextStyle(color: R.color.banafshKamRang)),
                            ),
                            new Form(
                                key: _formKeyOne,
                                child: new Container(
                                  child: new Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      InputTextForm(
                                        obscure: false,
                                        // onSaved: userOnsaved,
                                        color: Colors.black26,
                                        lableColor: Colors.black54,
                                        lable: 'معرفی نامه',
                                        // validate: validateSignUp
                                      ),
                                      new SizedBox(height: 35.0,),
                                      new Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          new Text('تعداد پروژه های ب اشتراک گذاشته شده : ',style: TextStyle(fontSize: 16.0),),
                                          new Text('5',style: TextStyle(fontSize: 16.0),),
                                        ],
                                      )
                                    ],

                                  ),
                                )),
                          ]
                      ),
                    ),
                  ],
                ),
              ],
            )
        ),
      ),
    );
  }
}
