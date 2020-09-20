import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stubbbb/Component/textformfield.dart';
import 'package:stubbbb/FirstPage/HomePage/HomeScreen.dart';
import 'package:stubbbb/Models/Profile.dart';
import 'package:stubbbb/Other/SizeConfig.dart';
import 'package:stubbbb/Other/widget.dart';
import 'package:stubbbb/http/Authenticate.dart';

class SignUp extends StatefulWidget {
  final String phone;
  final int type;

  SignUp({this.phone, this.type});

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  var url = "http://stube.ir/SignUp.php";
  final _formKey = GlobalKey<FormState>();
  bool onpresscode = true;
  TextEditingController _controller = new TextEditingController();
  String usernameCon;
  String passCon;
  String nameCon;
  Map _body;
  bool check = false;
  Profile profile;

  void setBody() async {
    _body = await signUp();
    if (_body['status'] == 'created') {
      Map bodi = await AuthenticateService.signIn({"username":_body['username'],"password":_body['password']});
      await storeUserData(_body);
      Navigator.of(context).pushReplacement(
          new MaterialPageRoute(
              builder: (context) =>
              new HomePage(id: bodi['id'],will: true,)));
    }else if(_body['status'] == 'exist'){
      setState(() {
        check = true;
        _formKey.currentState.validate();
      });
    }
  }

  void userOnsaved(String value) {
    usernameCon = value;
  }

  void passOnsaved(String value) {
    passCon = value;
  }

  void nameOnsaved(String value) {
    nameCon = value;
  }

  @override
  Widget build(BuildContext context) {
    var phoneSize = MediaQuery.of(context).size;
    return new Directionality(
        textDirection: TextDirection.rtl,
        child: new SafeArea(
            top: true,
            child: new Scaffold(
                resizeToAvoidBottomInset: false,
                body: new Stack(
                  children: <Widget>[
                    new Container(
                      height: phoneSize.height,
                      decoration: decorationSignUp(),
                    ),
                    new Container(
                      padding: const EdgeInsets.symmetric(horizontal: 0.0),
                      height: phoneSize.height,
                      child: new Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Expanded(flex: 4,
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: new Padding(
                                  padding:
                                  const EdgeInsets.symmetric(horizontal: 18.0),
                                  child: textSignUp()),
                            ),
                          ),
                          Expanded(flex: 7,
                            child: new Form(
                                key: _formKey,
                                child: new Container(
                                  padding:
                                   EdgeInsets.symmetric(horizontal: SizeConfig.imageSizeMultiplier * 9),
                                  child: new Column(
                                    children: <Widget>[
                                      InputTextForm(maxLine: 1,
                                          errColor: Colors.white,
                                          obscure: false,
                                          onSaved: userOnsaved,
                                          color: Colors.white,
                                          lableColor: Colors.white,
                                          lable: 'نام کاربری',
                                          validate: (String value) {
                                            String vlidte;
                                            if (check) {
                                              return 'نام کاربری قبلا ثبت شده';
                                            } else {
                                              if (!value.contains(new RegExp(
                                                  r"^(?=.{3,20}$)(?![_.])(?!.*[_.]{2})[a-zA-Z0-9._]+(?<![_.])$"))) {
                                                return 'نام کاربری وارد شده درست نمی باشد';
                                              }
                                            }
                                          }),
                                      InputTextForm(maxLine: 1,
                                        errColor: Colors.white,
                                        onSaved: passOnsaved,
                                        color: Colors.white,
                                        lableColor: Colors.white,
                                        lable: 'کلمه عبور',
                                        // iconData: Icons.lock,
                                        obscure: true,
                                        validate: validateSignUpPas,
                                        controller: _controller,
                                      ),
                                      InputTextForm(maxLine: 1,
                                          errColor: Colors.white,
                                          color: Colors.white,
                                          lableColor: Colors.white,
                                          lable: 'تایید کلمه عبور',
                                          obscure: true,
                                          validate: (String value) {
                                            if (value != _controller.text) {
                                              return 'با کلمه عبور مطابقت ندارد';
                                            }
                                          }),
                                      InputTextForm(maxLine: 1,
                                          errColor: Colors.white,
                                          obscure: false,
                                          onSaved: nameOnsaved,
                                          color: Colors.white,
                                          lableColor: Colors.white,
                                          lable: 'نام و نام خانوادگی',
                                          validate: validateNameSignUp),
                                    ],
                                  ),
                                )),
                          ),
                          Expanded(flex: 3,
                            child: new Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                new Padding(
                                    padding:  EdgeInsets.only(
                                        right: SizeConfig.imageSizeMultiplier *8.5, bottom: SizeConfig.heightMultiplier*1.5),
                                    child: textSignUpS()),
                                new SizedBox(width: phoneSize.width * .4),
                                new GestureDetector(
                                  onTap: () {
                                    if (_formKey.currentState.validate()) {
                                      _formKey.currentState.save();
                                      setBody();
                                    }
                                  },
                                  child: new Padding(
                                      padding: const EdgeInsets.only(left: 25),
                                      child: circleSignUp()),
                                )
                              ],
                            ),
                          ),
                          Expanded(flex: 1,
                            child: new Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                new Padding(
                                  padding:  EdgeInsets.only(right: SizeConfig.imageSizeMultiplier*7,bottom: SizeConfig.heightMultiplier*2),
                                  child: new GestureDetector(
                                    onTap: () {
                                      print('pressed1');
                                    },
                                    child: textSignUpLogin(),
                                  ),
                                ),
                                new SizedBox(width: phoneSize.width * .6)
                              ],
                            ),
                          )


                        ],
                      ),
                    ),

                  ],
                ))));
  }

  Future signUp() async {
    var response = await http.post(url, body: {
      'phonenumber': widget.phone,
      'type': '${widget.type}',
      'username': usernameCon,
      'password': passCon,
      'name': nameCon
    });

    final body = json.decode(response.body);
    print(body);
    return body;
  }

  storeUserData(Map body) async {
    SharedPreferences perfs = await SharedPreferences.getInstance();
    await perfs.setString('user_apiToken', body['apiToken']);
    await perfs.setString('user_username', body['username']);
    await perfs.setString('user_password', body['password']);
  }

}
