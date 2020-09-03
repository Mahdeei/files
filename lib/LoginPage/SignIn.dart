import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:stubbbb/Component/textformfield.dart';
import 'package:stubbbb/Models/Profile.dart';
import 'package:stubbbb/Models/profileModels.dart';
import 'package:stubbbb/Other/widget.dart';
import 'file:///D:/proflutter/stubbbb/lib/home.dart';
import 'package:http/http.dart' as http;
import 'ValidatePhonenumber.dart';




class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  var url = "http://192.168.1.6/Stub/Login.php";
  final _formKeyLog = GlobalKey<FormState>();
  String _username;
  String _password;
  Color _color = Colors.white;
  bool error = true;
  Map boody;
  Profile profile ;

  void usernameOnSaved(String value) {
    _username = value;
  }

  void passwordOnSaved(String value) {
    _password = value;
  }



  recieveData() async {
    setState(() async{
      boody = await signIn();
      if (await boody['status'] == 'succes') {
        profile =new Profile(
            id: boody['id'],
            image: boody['image'],
            moarefinameh: boody['moarefinameh'],
            name: boody['name'],
            phonenumber: boody['phonenumber'],
            title: boody['title'],
            type: boody['type'],
            username: boody['username']
        );
        Navigator.of(context).pushReplacement(new MaterialPageRoute(
            builder: (context) =>
            new HomePage(profile: profile,)));
        if (error == false) {
          setState(() {
            error = true;
          });
        }
      } else if (boody['status'] ==
          'not exist user') {
        if (error == true) {
          setState(() {
            error = false;
          });
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var phonesize = MediaQuery.of(context).size;
    return new Directionality(
            textDirection: TextDirection.rtl,
            child: new SafeArea(
                top: true,
                child: new Scaffold(
                    resizeToAvoidBottomInset: false,
                    body: new Stack(children: <Widget>[
                      new Container(
                        height: phonesize.height,
                        decoration:decorationImageSignin(),
                      ),
                      new Container(
                        padding: const EdgeInsets.symmetric(horizontal: 0.0),
                        height: phonesize.height,
                        decoration: decorationSignin(),
                        child: new Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            new SizedBox(height: phonesize.height * 0.19),
                            new Padding(
                                padding: const EdgeInsets.only(right: 10.0),
                                child: textSignIn()),
                            new SizedBox(height: phonesize.height * 0.20),
                            new Form(
                              key: _formKeyLog,
                              child: new Container(
                                  padding: const EdgeInsets.symmetric(horizontal: 35),
                                  child: new Column(
                                    children: <Widget>[
                                      InputTextForm(
                                        onSaved: usernameOnSaved,
                                        lableColor: Colors.black,
                                        color: Colors.black,
                                        textColor: Colors.black,
                                        lable: 'نام کاربری',
                                        obscure: false,
                                      ),
                                      InputTextForm(
                                        onSaved: passwordOnSaved,
                                        lableColor: Colors.black,
                                        color: Colors.black,
                                        textColor: Colors.black,
                                        lable: 'کلمه عبور',
                                        obscure: true,
                                      ),
                                      error
                                        ? Container()
                                        : containerError()
                                    ],
                                  )),
                            ),
                            new SizedBox(height: phonesize.height * 0.09),
                            new Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                new Padding(
                                  padding: const EdgeInsets.only(right: 35, bottom: 10),
                                  child: textSignInLogin(),
                                ),
                                new GestureDetector(
                                  onTap: () async {
                                    _formKeyLog.currentState.save();
                                    recieveData();
                                  },
                                  child: new Padding(
                                    padding: const EdgeInsets.only(left: 30),
                                    child: circleAvatarSignIn(),
                                  ),
                                )
                              ],
                            ),
                            new SizedBox(height: phonesize.height * 0.05),
                            new Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                new GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).push(
                                        new MaterialPageRoute(
                                            builder: (context) =>
                                                new ValidatePhoneNumber()));
                                  },
                                  child: textSignInPage(),
                                ),
                                new GestureDetector(
                                  onTap: () {
                                    print('pressed1');
                                  },
                                  child: textSigInForget(),
                                )
                              ],
                            )
                          ],
                        ),
                      )
                    ]))));
  }

  Future signIn() async {
    var response = await http.post(url, body: {
      'username': _username,
      'password': _password,
    });
    final body = json.decode(response.body);
    print(body);
    return body;
  }



}
