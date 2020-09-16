import 'package:flutter/material.dart';
import 'package:stubbbb/Component/textformfield.dart';
import 'package:stubbbb/Models/Profile.dart';
import 'package:stubbbb/Models/myData.dart';
import 'package:stubbbb/Other/R.dart';



class EditData extends StatefulWidget {


  MyData profile;
  EditData({this.profile});
  @override
  _EditDataState createState() => _EditDataState();
}

class _EditDataState extends State<EditData> {

  TextEditingController usernameCont ,nameCont,moarefiCont;
  
  GlobalKey _formKeyOne = GlobalKey<FormState>();
  
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    usernameCont = new TextEditingController(text: widget.profile.username);
    nameCont = new TextEditingController(text: widget.profile.name);
    moarefiCont = new TextEditingController(text: widget.profile.moarefiNameh);
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: new Scaffold(
            resizeToAvoidBottomInset: true,
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
                              child: new Text("بارگذاری تصویر",style: TextStyle(color: R.color.banafshKamRang)),
                            ),
                            new Form(
                                key: _formKeyOne,
                                child: new Container(
                                  child: new Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      InputTextForm(
                                        controller: usernameCont,
                                        obscure: false,
                                        // onSaved: userOnsaved,
                                        color: Colors.black,
                                        lableColor: Colors.black,
                                        lable: 'نام کاربری',
                                        // validate: validateSignUp
                                      ),
                                      InputTextForm(
                                        controller: nameCont,
                                        // onSaved: passOnsaved,
                                        color: Colors.black,
                                        lableColor: Colors.black,
                                        lable: 'نام و نام خانوادگی',
                                        obscure: false,
                                        // validate: validateSignUpPas,
                                      ),
                                      InputTextForm(
                                          color: Colors.black,
                                          lableColor: Colors.black,
                                          lable: 'رشته دانشگاهی',
                                          obscure: true,
                                          validate: (String value) {
                                            // if (value != _controller.text) {
                                            //   return 'not true';
                                            // }
                                          }),
                                      InputTextForm(
                                        textColor: Colors.black,
                                        controller: moarefiCont,
                                        obscure: false,
                                        // onSaved: nameOnsaved,
                                        color: Colors.black,
                                        lableColor: Colors.black,
                                        lable: 'معرفی نامه',
                                        // validate: validateNameSignUp
                                      ),
                                      new SizedBox(height: 25.0,),
                                      new Align(
                                        // alignment: Alignment.center,
                                        child: new Text('مشخصات',textAlign: TextAlign.center,style: TextStyle(fontSize: 20.0),),
                                      ),
                                      InputTextForm(
                                        obscure: false,
                                        // onSaved: userOnsaved,
                                        color: Colors.black26,
                                        lableColor: Colors.black54,
                                        lable: 'سوابق کاری',
                                        // validate: validateSignUp
                                      ),
                                      InputTextForm(
                                        // onSaved: passOnsaved,
                                        color: Colors.black26,
                                        lableColor: Colors.black54,
                                        lable: 'سوابق تحصیلی',
                                        obscure: true,
                                        // validate: validateSignUpPas,
                                        // controller: _controller,
                                      ),
                                      InputTextForm(
                                          color: Colors.black26,
                                          lableColor: Colors.black54,
                                          lable: 'مدرک یا گواهیناممه های معتبر',
                                          obscure: true,
                                          validate: (String value) {
                                            // if (value != _controller.text) {
                                            //   return 'not true';
                                            // }
                                          }),
                                      InputTextForm(
                                        obscure: false,
                                        // onSaved: nameOnsaved,
                                        color: Colors.black26,
                                        lableColor: Colors.black54,
                                        lable: 'زبان های مسلط',
                                        // validate: validateNameSignUp
                                      ),
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
