import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:stubbbb/LoginPage/SignIn.dart';
import 'package:stubbbb/Other/R.dart';
import 'package:stubbbb/Other/SizeConfig.dart';
import 'SignUp.dart';

class ValidatePhoneNumber extends StatefulWidget {
  @override
  _ValidatePhoneNumberState createState() => _ValidatePhoneNumberState();
}

class _ValidatePhoneNumberState extends State<ValidatePhoneNumber> {
  final String url = "http://stube.ir/CreateCodePhone.php";
  bool onpresscode = true;
  bool _validatephone = true;
  bool _validateCode = true;
  int _counter = 120;
  Timer _timer;
  int _type = R.signInCharachter.type1;
  bool willPop=false;
  TextEditingController _controllerPhone = new TextEditingController();
  TextEditingController _controllerCode = new TextEditingController();
  String code;
  @override
  void dispose() {
    _controllerPhone.dispose();
    if(!willPop){
      _timer.cancel();
    }
    super.dispose();
  }

  setcode() async {
    setState((){
    });
    code = await postPhone();
  }

  void _startTime() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_counter > 0) {
          _counter--;
        } else {
          setState(() {
            code = code + "${new Random().nextDouble()}";
          });
          _timer.cancel();
        }
        // print(_counter);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var phonesize = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: (){
        willPop=true;
        Navigator.of(context).pushReplacement(new MaterialPageRoute(builder: (context)=> new SignIn()));
      },
      child: new Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: ListView(
              children: [
                new Stack(
                  children: <Widget>[
                    new Container(
                      height: phonesize.height,
                      width: phonesize.width,
                      decoration: new BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage('assets/image/backnum.png'))),
                    ),
                    Container(
                      padding: const EdgeInsets.all(30),
                      child: new Column(
                        children: <Widget>[
                          new SizedBox(
                            height: phonesize.height * .08,
                          ),
                          new Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Text('شماره تلفن',
                                  style: new TextStyle(
                                      color: Colors.white,
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                          new SizedBox(
                            height: phonesize.height * .15,
                          ),
                          new TextField(
                            controller: _controllerPhone,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              errorText: _validatephone
                                  ? null
                                  : 'لطفا شماره را درست وارد نمایید ',
                              labelText: 'شماره تلفن',
                              border: UnderlineInputBorder(),
                            ),
                          ),
                          onpresscode
                              ? new Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: <Widget>[
                                    new SizedBox(height: phonesize.height * .1),
                                    new Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: <Widget>[
                                        OutlineButton(
                                          highlightedBorderColor: R.color.banafshmain,
                                          borderSide: BorderSide(
                                              color: R.color.banafshmain, width: 2),
                                          // color: Colors.blue,
                                          onPressed: () {
                                            if (_controllerPhone.text.length == 11 &&
                                                _controllerPhone.text
                                                    .startsWith('09')) {
                                              setcode();
                                              _startTime();
                                              setState(() {
                                                _validatephone = true;
                                                onpresscode = false;
                                              });
                                            } else {
                                              setState(() {
                                                _validatephone = false;
                                              });
                                            }
                                          },
                                          child: new Text(
                                            'دریافت کد',
                                            style: new TextStyle(
                                                color: R.color.banafshmain,
                                                fontSize: SizeConfig.textMultiplier*2.4,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                )
                              : new Padding(
                                  padding:
                                       EdgeInsets.only(top:SizeConfig.heightMultiplier *2, bottom: SizeConfig.heightMultiplier *1.5),
                                  child: new Column(
                                    children: <Widget>[
                                      new TextField(
                                        controller: _controllerCode,
                                        keyboardType: TextInputType.number,
                                        decoration: InputDecoration(
                                            errorText: _validateCode
                                                ? null
                                                : 'کد را به درستی وارد نمایید',
                                            labelText: 'کد تایید',

                                            border: UnderlineInputBorder()),
                                      ),
                                      new SizedBox(
                                        height: SizeConfig.heightMultiplier*1.5,
                                      ),
                                      new Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: <Widget>[
                                          Text('زمان باقیمانده : $_counter ثانیه',style: TextStyle(fontSize: SizeConfig.textMultiplier*2),),
                                        ],
                                      ),
                                      ListTile(
                                        title: Text(
                                          'دانشجو هستم',style: TextStyle(fontSize: SizeConfig.textMultiplier*2)
                                        ),
                                        leading: Radio(
                                          activeColor: R.color.banafshmain,
                                          focusColor: R.color.banafshmain,
                                          hoverColor: R.color.banafshmain,
                                          value: R.signInCharachter.type1,
                                          groupValue: _type,
                                          onChanged: (value) {
                                            setState(() {
                                              _type = value;
                                            });
                                          },
                                        ),
                                      ),
                                      ListTile(
                                          title: Text(
                                            'دانشجو نیستم',style: TextStyle(fontSize: SizeConfig.textMultiplier*2)
                                          ),
                                          leading: Radio(
                                              activeColor: R.color.banafshmain,
                                              focusColor: R.color.banafshmain,
                                              hoverColor: R.color.banafshmain,
                                              value: R.signInCharachter.type2,
                                              groupValue: _type,
                                              onChanged: (value) {
                                                setState(() {
                                                  _type = value;
                                                });
                                              })),
                                      new Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: <Widget>[
                                          new OutlineButton(
                                            highlightedBorderColor:
                                                R.color.banafshmain,
                                            borderSide: BorderSide(
                                                color: R.color.banafshmain, width: 2),
                                            onPressed: () {
                                              if (_controllerCode.text == code) {
                                                Navigator.of(context).pushReplacement(
                                                    new MaterialPageRoute(
                                                        builder: (context) =>
                                                            new SignUp(
                                                                phone:
                                                                    _controllerPhone
                                                                        .text,
                                                                type: _type)));
                                              } else {
                                                setState(() {
                                                  _validateCode = false;
                                                });
                                              }
                                            },
                                            child: new Text(
                                              'تایید',
                                              style: new TextStyle(
                                                  color: R.color.banafshmain,
                                                  fontSize: SizeConfig.textMultiplier*2.4,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                )
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            )),
      ),
    );
  }

  Future<String> postPhone() async {
    var response = await http.post(url, body: {"phone": _controllerPhone.text});
    var bodyy = response.body;
    return bodyy;
  }

  // Future<String> postSignup() async {
  //   var response = await http.post(url, body: {
  //     "phone": _controllerPhone.text,
  //   });
  //   var bodyy = response.body;
  //   print(bodyy);
  //   return bodyy;
  // }
}
