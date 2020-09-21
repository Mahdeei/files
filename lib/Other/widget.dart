import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stubbbb/AgahiPage/AddPostAgahi.dart';
import 'package:stubbbb/AgahiPage/AdvertisingsPage.dart';
import 'package:stubbbb/AgahiPage/AgahPage.dart';
import 'package:stubbbb/FirstPage/RequestPage/MyRequests.dart';
import 'package:stubbbb/KarAmouziPage/KarAmouziPage.dart';
import 'package:stubbbb/LoginPage/SignIn.dart';
import 'package:stubbbb/Models/Request.dart';
import 'package:stubbbb/Models/RequestProfile.dart';
import 'package:stubbbb/Models/myData.dart';
import 'package:stubbbb/Other/SizeConfig.dart';
import 'package:stubbbb/Poshtibani/ErtebatBaMa.dart';
import 'package:stubbbb/ProfilePage/MyProfileScreen.dart';
import 'package:stubbbb/ProfilePage/MyProfileUserNormalScreen.dart';
import 'package:stubbbb/StudentPage/StudentScreen.dart';
import 'package:stubbbb/StudentPerfect/StudentPerfectScreen.dart';
import 'package:stubbbb/http/httpRequest.dart';
import 'R.dart';
import 'package:animations/animations.dart';

class ModelMenu {
  String titr;
  String image;
  Color color;

  ModelMenu(this.titr, this.image, this.color);
}

BoxDecoration decorationLoginPagee() {
  return BoxDecoration(boxShadow: [
    BoxShadow(color: Colors.black, offset: Offset(2, 2), blurRadius: 7)
  ], color: Color(0xffFE346E), borderRadius: BorderRadius.circular(30.0));
}

BoxDecoration deorationLoginPage() {
  return BoxDecoration(
      color: Colors.white,
      boxShadow: [
        BoxShadow(color: Colors.black, offset: Offset(2, 2), blurRadius: 7)
      ],
      borderRadius: BorderRadius.circular(30.0));
}

BoxDecoration decorationHomePage() {
  return BoxDecoration(
      color: R.color.banafshmain,
      borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(SizeConfig.heightMultiplier * 6.5)));
}

BoxDecoration decorationImageHomePage(String image) {
  return BoxDecoration(
      shape: BoxShape.circle,
      image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage('http://stube.ir/image/$image')));
}

BoxDecoration decorationImageSignin() {
  return new BoxDecoration(
      image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(
            'assets/image/backlog.png',
          )));
}

BoxDecoration decorationSignin() {
  return new BoxDecoration(
      borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(40), bottomRight: Radius.circular(40)));
}

BoxDecoration decorationSignUp() {
  return new BoxDecoration(
      image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(
            'assets/image/backreg.png',
          )));
}

BoxDecoration decorationWelcomePage() {
  return new BoxDecoration(
      image: DecorationImage(
          image: AssetImage('assets/image/back.jpg'), fit: BoxFit.cover));
}

BoxDecoration decorationKaramouziScreen() {
  return BoxDecoration(
      boxShadow: [
        BoxShadow(
            color: Colors.black54, offset: Offset(0.0, 1.0), blurRadius: 5.0)
      ],
      color: Colors.white,
      borderRadius: BorderRadius.only(
        bottomRight: Radius.circular(65.0),
        topRight: Radius.circular(65.0),
        topLeft: Radius.circular(15.0),
        bottomLeft: Radius.circular(15.0),
      ));
}

BoxDecoration boxDecorationKaramouziScreen(String image) {
  return BoxDecoration(
      borderRadius: BorderRadius.only(
          topRight: Radius.circular(65.0), bottomRight: Radius.circular(65.0)),
      image: DecorationImage(
          fit: BoxFit.cover,
          image: image == null
              ? AssetImage('assets/image/download.jfif')
              : NetworkImage("http://stube.ir/image/$image")));
}

BoxDecoration boxDecorationKaramouziScrenn() {
  return BoxDecoration(
      color: Color(0xffD2FAFB),
      shape: BoxShape.rectangle,
      borderRadius: BorderRadius.circular(15.0));
}

InputDecoration inputDecorationLoginPage(String labelText, IconData icon) {
  return InputDecoration(
      prefixIcon: Icon(
        icon,
        color: Colors.white,
      ),
      labelText: labelText,
      labelStyle: TextStyle(color: Colors.white),
      border: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
      fillColor: Colors.white,
      focusColor: Colors.white,
      hoverColor: Colors.white,
      enabledBorder:
          UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)));
}

Icon iconKarAmouziScreen() {
  return new Icon(
    Icons.location_city,
    size: 2.0,
    color: R.color.banafshmain,
  );
}

Text texKarAmouziScreen(String address) {
  return new Text(
    address,
    style: TextStyle(fontSize: 8.0),
    maxLines: 1,
    overflow: TextOverflow.ellipsis,
  );
}

Text textKarAmouzziScreen() {
  return new Text(
    'ux',
    style: new TextStyle(
      color: Color(0xff2c003e),
      fontSize: 11.0,
    ),
  );
}

Text textKarAmoziScreen() {
  return new Text(
    'ui',
    style: new TextStyle(
      color: Color(0xff2c003e),
      fontSize: 11.0,
    ),
  );
}

Text textKarAmouziScreen() {
  return new Text(
    'گرافیک',
    style: new TextStyle(
      color: Color(0xff2c003e),
      fontSize: 11.0,
    ),
  );
}

Text textoneKaramouziScreen(String title) {
  return new Text(
    title,
    style: TextStyle(
        fontSize: SizeConfig.textMultiplier * 2.5, fontWeight: FontWeight.bold),
    maxLines: 1,
    overflow: TextOverflow.ellipsis,
  );
}

Text textTwoKaramouziScreen(String description) {
  return new Text(
    description,
    maxLines: 1,
    overflow: TextOverflow.ellipsis,
    style: TextStyle(fontSize: SizeConfig.textMultiplier * 1.8),
  );
}

Text textthreeKaramouziScreen(String company) {
  return new Text(
    company == '+نام شرکت' ? "مستقل" : company,
    overflow: TextOverflow.ellipsis,
    maxLines: 1,
    style: TextStyle(
      fontSize: SizeConfig.textMultiplier * 1.7,
    ),
  );
}

Text textlineBetween() {
  return new Text(
    '|',
    style: TextStyle(
        fontSize: SizeConfig.textMultiplier * 1.4, fontWeight: FontWeight.bold),
  );
}

Text textType(String type) {
  String modeltype;
  if (type == "1") {
    modeltype = "کار آموزی";
  } else if (type == "2") {
    modeltype = "کار آموزی منجر به استخدام";
  } else if (type == "3") {
    modeltype = "استخدام";
  }
  return new Text(
    modeltype,
    overflow: TextOverflow.ellipsis,
    maxLines: 1,
    style: TextStyle(
      fontSize: SizeConfig.textMultiplier * 1.7,
    ),
  );
}

Text textSignUp() {
  return new Text('خوش اومدی',
      style: TextStyle(
          fontSize: SizeConfig.textMultiplier*5, fontWeight: FontWeight.bold, color: Colors.white));
}

Text textWelcomePage() {
  return new Text(
    'Stub',
    style: TextStyle(
        color: Colors.white,
        fontSize: 38,
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.italic),
  );
}

Text textWelcomePagehint(String text, double fontsize, FontWeight fontWeight) {
  return new Text(
    text,
    style: TextStyle(
        color: Colors.white,
        fontSize: fontsize,
        fontWeight: fontWeight,
        fontStyle: FontStyle.normal),
  );
}

FittedBox textSignUpS() {
  return FittedBox(
    child: new Text(
      'ثبت نام',
      style: new TextStyle(
          color: Colors.white, fontSize: SizeConfig.textMultiplier*4, fontWeight: FontWeight.w700),
    ),
  );
}

Text textSignUpLogin() {
  return new Text(
    'ورود',
    style: TextStyle(
        color: Colors.white,
        decoration: TextDecoration.underline,
        fontSize: SizeConfig.textMultiplier*2.9),
  );
}

String validateSignUpPas(String value) {
  if (value.length < 6) {
    return 'باید بیشتر از 6 کاراکتر باشد';
  }
}

String validateNameSignUp(String value) {
  if (value.contains(new RegExp(
      r"^(?=.{3,20}$)(?![_.])(?!.*[_.]{2})[a-zA-Z0-9._]+(?<![_.])$"))) {
    return 'از حروف فارسی استفاده کنید';
  } else if (value.isEmpty) return 'نباید خالی باشد';
}

String validateSignUp(String value) {
  if (!value.contains(new RegExp(
      r"^(?=.{3,20}$)(?![_.])(?!.*[_.]{2})[a-zA-Z0-9._]+(?<![_.])$"))) {
    return 'not true';
  }
}

Text textSplashScreen() {
  return new Text(
    'استیوب',
    style: new TextStyle(fontSize: SizeConfig.textMultiplier*4),
  );
}

Text textSignIn() {
  return new Text('منتظرت بودیم !',
      style: TextStyle(
          fontSize: SizeConfig.textMultiplier * 4.6,
          fontWeight: FontWeight.bold,
          color: Colors.white));
}

Text textSignInLogin() {
  return new Text(
    'ورود',
    style: new TextStyle(
        fontSize: SizeConfig.heightMultiplier * 5, fontWeight: FontWeight.w700),
  );
}

Text textSignInPage() {
  return new Text(
    'ثبت نام',
    style: TextStyle(
        decoration: TextDecoration.underline,
        fontSize: SizeConfig.heightMultiplier * 2.5),
  );
}

Text textSigInForget() {
  return new Text(
    'فراموشی گلمه عبور',
    style: TextStyle(decoration: TextDecoration.underline, fontSize: 17),
  );
}

Text textLoginPage() {
  return new Text(
    'ورود',
    style: TextStyle(
        fontSize: 35.0, fontWeight: FontWeight.bold, color: Colors.white),
  );
}

Text textLoginPageLogin() {
  return new Text(
    'ورود',
    style: TextStyle(fontSize: 25, color: Colors.white),
    textAlign: TextAlign.center,
  );
}

String textTime(String date) {
  if (date.substring(0, 10) == DateTime.now().toString().substring(0, 10)) {
    if (date.substring(11, 13) == DateTime.now().toString().substring(11, 13)) {
      return "لحظاتی پیش";
    } else {
      return "${int.parse(DateTime.now().toString().substring(11, 13)) - int.parse(date.substring(11, 13))} ساعت قبل";
    }
  } else if (date.substring(0, 7) ==
      DateTime.now().toString().substring(0, 7)) {
    return "${int.parse(DateTime.now().toString().substring(8, 10)) - int.parse(date.substring(8, 10))} روز قبل";
  } else if (date.substring(0, 4) ==
      DateTime.now().toString().substring(0, 4)) {
    return "${int.parse(DateTime.now().toString().substring(5, 7)) - int.parse(date.substring(5, 7))} ماه قبل";
  } else {
    return "${int.parse(DateTime.now().toString().substring(0, 4)) - int.parse(date.substring(0, 4))} سال قبل";
  }

  //
  // date.substring(0,10) == DateTime.now().toString().substring(0,10)
  //     ? date.substring(11,13)==DateTime.now().toString().substring(11,13)
  //       ?  "لحظاتی پیش"
  //       : "${int.parse(DateTime.now().toString().substring(11,13)) - int.parse(date.substring(11,13))} ساعت قبل"
  //     : date.substring(0,7)==DateTime.now().toString().substring(0,7)
  //       ? "${int.parse(DateTime.now().toString().substring(8,10)) - int.parse(date.substring(8,10))} روز قبل"
  //       : date.substring(0,4)==DateTime.now().toString().substring(0,4)
  //       ? "${int.parse(DateTime.now().toString().substring(5,7)) - int.parse(date.substring(5,7))} ماه قبل"
  //       : "${int.parse(DateTime.now().toString().substring(0,4)) - int.parse(date.substring(0,4))} سال قبل";
}

Padding textLoginPageSignup() {
  return new Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 0),
      child: new Text(
        'ثبت نام',
        style: TextStyle(fontSize: 25, color: Color(0xff2C003E)),
        textAlign: TextAlign.center,
      ));
}

TextStyle styleHomePage() {
  return TextStyle(
      color: Colors.white,
      fontSize: SizeConfig.textMultiplier * 3.3,
      fontWeight: FontWeight.bold);
}

CircleAvatar circleAvatarSignIn() {
  return new CircleAvatar(
    radius: SizeConfig.heightMultiplier * 5.8,
    backgroundColor: R.color.banafshmain,
    child: new Icon(
      Icons.arrow_forward,
      size: SizeConfig.heightMultiplier * 5,
      color: Colors.white,
    ),
  );
}

CircleAvatar circleSignUp() {
  return new CircleAvatar(
    radius: SizeConfig.heightMultiplier *6,
    backgroundColor: R.color.banafshmain,
    child: new Icon(
      Icons.arrow_forward,
      size: SizeConfig.heightMultiplier*5,
      color: Colors.white,
    ),
  );
}

CircleAvatar circleAvatarKaramouziScreen() {
  return new CircleAvatar(
    maxRadius: SizeConfig.heightMultiplier*2,
    child: new Icon(
      Icons.arrow_forward_ios,
      color: Colors.white,
      size: SizeConfig.heightMultiplier*1.5
    ),
    backgroundColor: Color(0xff2C003E),
  );
}

AppBar appBarHomePage(BuildContext context, MyData profile) {
  print(profile.type);
  return new AppBar(actions: <Widget>[

    new Padding(
        padding: EdgeInsets.only(
            left: SizeConfig.heightMultiplier * 2,
            top: SizeConfig.heightMultiplier * 0.5),
        child: new Stack(
          children: [
            new IconButton(
                icon: Icon(
                  Icons.person,
                  color: Colors.white,
                  size: SizeConfig.heightMultiplier * 4.0,
                ),
                onPressed: () {
                  Future<MyData> answer = Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) => profile.type == "2"
                              ? new MyProfileUserNormalScreen(id: profile.id,profile: profile,)
                              : new MyProfileStudentScreen(profile: profile)));
                  answer.then((MyData value) {
                    return value != null? profile= value: 'empty';
                  });

                }),
            profile.image == null ||
                    profile.title == null ||
                    profile.moarefiNameh == null ||
                    profile.skills == null ||
                    profile.certificates == null ||
                    profile.fieldUni == null ||
                    profile.languages == null ||
                    profile.resumes == null ||
                    profile.educational == null ||
                    profile.image == null ||
                    profile.image == ''
                ? new Positioned(
                    bottom: SizeConfig.heightMultiplier * 2.4,
                    right: SizeConfig.heightMultiplier * 1.3,
                    child: new CircleAvatar(
                      backgroundColor: Colors.red,
                      maxRadius: 4,
                    ))
                : new SizedBox()
          ],
        ))
  ], elevation: 0.0, backgroundColor: R.color.banafshmain);
}

AppBar appBarMessagePage(_scaffoldKey) {
  return new AppBar(
    leading: IconButton(
      icon: Icon(
        Icons.menu,
        color: R.color.banafshmain,
      ),
      onPressed: () => _scaffoldKey.currentState.openDrawer(),
    ),
    //            title: this.cusSearchBar,
    actions: <Widget>[
      // new Row(
      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //   children: <Widget>[
      //     new Padding(
      //         padding: const EdgeInsets.only(left: 5.0),
      //         child: new IconButton(
      //             icon: Icon(
      //               Icons.filter_list,
      //               color: R.color.banafshmain,
      //             ),
      //             onPressed: () {})),
      //   ],
      // )
    ],
    backgroundColor: Colors.white,
    elevation: 5.0,
    bottomOpacity: 25.0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        bottom: Radius.circular(30),
      ),
    ),
  );
}

AppBar appBarProfilePage() {
  return new AppBar(
//            title: this.cusSearchBar,
//     title: SearchProfilePage(),
    backgroundColor: Colors.white,
    elevation: 5.0,
    bottomOpacity: 25.0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        bottom: Radius.circular(30),
      ),
    ),
  );
}

AppBar appBarKaramouziScreen() {
  return AppBar(
    /*actions: <Widget>[
      new Padding(
          padding: const EdgeInsets.only(left: 5.0),
          child: new IconButton(
              icon: Icon(
                Icons.filter_list,
                color: Color(0xff2C003E),
              ),
              onPressed: () {}))
    ],*/
    backgroundColor: Colors.white,
    elevation: 5.0,
    bottomOpacity: 25.0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        bottom: Radius.circular(30),
      ),
    ),
  );
}

AppBar appBarAgahiScreen(/*TabController tabController*/) {
  return /*AppBar(
      actions: <Widget>[
        new Padding(
            padding: const EdgeInsets.only(left: 5.0),
            child: new IconButton(
                icon: Icon(
                  Icons.filter_list,
                  color: Color(0xff2C003E),
                ),
                onPressed: () {}))
      ],
      backgroundColor: Colors.white,
      bottom: TabBar(
        controller: tabController,
        tabs: [
          Tab(
              icon: new Text(
                'پروژه ها',
                style: TextStyle(color: Colors.black),
              )),
          Tab(
              icon: new Text(
                'فروش کتاب',
                style: TextStyle(color: Colors.black),
              )),
        ],
      ));*/
      AppBar(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30),
            ),
          ),
          elevation: 5.0,
          bottomOpacity: 25.0,
          // actions: <Widget>[
          //   new Padding(
          //       padding: const EdgeInsets.only(left: 5.0),
          //       child: new IconButton(
          //           icon: Icon(
          //             Icons.filter_list,
          //             color: Color(0xff2C003E),
          //           ),
          //           onPressed: () {}))
          // ],
          backgroundColor: Colors.white);
  // bottom: TabBar(
  //   controller: tabController,
  //   tabs: [
  //     Tab(
  //         icon: new Text(
  //           'پروژه ها',
  //           style: TextStyle(color: Colors.black),
  //         )),
  //     Tab(
  //         icon: new Text(
  //           'فروش کتاب',
  //           style: TextStyle(color: Colors.black),
  //         )),
  //     // Tab(
  //     //     icon: new Text(
  //     //       'کارفرکا',
  //     //       style: TextStyle(color: Colors.black),
  //     //     )),
  //   ],
  // ));
}

AppBar appBarProfileScreen() {
  return new AppBar(
    title: TextfieldSearch(),
    backgroundColor: Colors.white,
    elevation: 5.0,
    bottomOpacity: 25.0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        bottom: Radius.circular(30),
      ),
    ),
  );
}

// class SearchProfilePage extends StatefulWidget {
//   @override
//   _SearchProfilePageState createState() => _SearchProfilePageState();
// }
//
// class _SearchProfilePageState extends State<SearchProfilePage> {
//   FocusNode focusNode = FocusNode();
//   String hintText = 'جستجو ...';
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     focusNode.addListener(() {
//       if (focusNode.hasFocus) {
//         hintText = '';
//       } else {
//         hintText = 'جستجو ...';
//       }
//       setState(() {});
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return new Row(
//       children: <Widget>[
//         new Expanded(
//           child: new TextField(
//             decoration: InputDecoration(
// //          border: InputBorder.none,
//               contentPadding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 10.0),
//               suffixIcon: new Icon(
//                 Icons.search,
//                 color: Color(0xff2c003e),
//               ),
// //            labelText: "جستجو ...",
//               enabledBorder: const OutlineInputBorder(
//                 borderRadius: BorderRadius.all(Radius.circular(20.0)),
//                 borderSide: const BorderSide(
//                   color: Color(0xffF2F3F8),
//                 ),
//               ),
//               focusedBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.all(Radius.circular(20.0)),
//                 borderSide: BorderSide(color: Colors.white),
//               ),
//               fillColor: Color(0xffF2F3F8),
//               hintText: hintText,
//
//               filled: true,
//             ),
//           ),
//         ),
//         new GestureDetector(
//           child: new Icon(
//             Icons.filter_list,
//             color: Colors.black,
//           ),
//           onTap: () {
//             showModalBottomSheet(
//                 context: context,
//                 builder: (builder) =>
//                     Container(
//                         child: new Column(
//                           children: <Widget>[
//                             new Container(
//                               color: R.color.red,
//                               child: new Text(
//                                 'فیلتر دسته بندی ها',
//                                 textDirection: TextDirection.rtl,
//                                 style: TextStyle(
//                                     fontSize: 20.0, fontWeight: FontWeight
//                                     .bold),
//                               ),
//                             ),
// //                                              new Row(
// //                                                children: <Widget>[
// //
// ////                                    CustomRadio<int, double>(
// ////                                        value: value,
// ////                                        groupValue: widget.radioValue,
// ////                                        duration: Duration(milliseconds: 400),
// ////                                        animsBuilder: (AnimationController controller) => [
// ////                                          CurvedAnimation(
// ////                                              parent: controller,
// ////                                              curve: Curves.ease
// ////                                          )
// ////                                        ],
// ////                                        builder: ({ BuildContext context, List<double> animValues, Function updateState, bool checked }) {
// ////                                          return GestureDetector(
// ////                                              onTapDown: (TapDownDetails details) {
// ////                                                setState(() {
// ////                                                  if (_controller.status != AnimationStatus.completed)
// ////                                                    _controller.forward();
// ////                                                });
// ////                                              },
// ////                                              onTapUp: (TapUpDetails details) {
// ////                                                setState(() {
// ////                                                  if (_controller.status != AnimationStatus.dismissed)
// ////                                                    _controller.reverse();
// ////                                                });
// ////                                              },
// ////                                              onTap: () {
// ////                                                setState(() {
// ////                                                  widget.radioValue = value;
// ////                                                });
// ////                                              },
// ////                                              child: Container(
// ////                                                margin: EdgeInsets.all(8.0),
// ////                                                width: 38.0,
// ////                                                height: 38.0,
// ////                                                alignment: Alignment.center,
// ////                                                decoration: BoxDecoration(
// ////                                                  shape: BoxShape.circle,
// ////                                                ),
// ////                                                child: Stack(
// ////                                                    alignment: Alignment.center,
// ////                                                    children: <Widget>[
// ////                                                      Container(
// ////                                                        width: 38.0 * _animation.value,
// ////                                                        height: 38.0 * _animation.value,
// ////                                                        decoration: BoxDecoration(
// ////                                                            shape: BoxShape.circle,
// ////                                                            color: Theme.of(context).primaryColor.withAlpha(40)
// ////                                                        ),
// ////                                                      ),
// ////                                                      Container(
// ////                                                        width: 18.0,
// ////                                                        height: 18.0,
// ////                                                        decoration: BoxDecoration(
// ////                                                            shape: BoxShape.circle,
// ////                                                            color: Colors.transparent,
// ////                                                            border: Border.all(
// ////                                                                color: checked ? Theme.of(context).primaryColor : Theme.of(context).hintColor,
// ////                                                                width: 2.0
// ////                                                            )
// ////                                                        ),
// ////                                                      ),
// ////                                                      Container(
// ////                                                        width: 11.0 * animValues[0],
// ////                                                        height: 11.0 * animValues[0],
// ////                                                        decoration: BoxDecoration(
// ////                                                          shape: BoxShape.circle,
// ////                                                          color: Theme.of(context).primaryColor,
// ////                                                        ),
// ////                                                      ),
// ////                                                    ]
// ////                                                ),
// ////                                              )
// ////                                          );
// ////                                        }
// ////                                    ),
// //                                                ],
// //                                              )
//                           ],
//                         )));
//           },
//         ),
//       ],
//     );
//   }
// }

Row rowOneKaramouziScreen() {
  return new Row(
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
          child: new Text('4 ساعت در روز',
              style: TextStyle(color: Colors.black54, fontSize: 15.0)))
    ],
  );
}



Padding rowKaramouziScreenOne(String phonenumber) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
    child: new Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        new GestureDetector(
          child: new Text(
            phonenumber,
            style: TextStyle(fontSize: 17.0),
          ),
          // onLongPress: () {
          //   Clipboard.setData(new ClipboardData(text: phonenumber));
          //   // key.currentState.showSnackBar(
          //   //     new SnackBar(content: new Text("Copied to Clipboard"),));
          // },
        ),
        new SizedBox(
          width: 5.0,
        ),
        new Icon(Icons.call),
      ],
    ),
  );
}

Row rowKaramouziScreenTwo() {
  return new Row(
    children: <Widget>[
      new Icon(Icons.mail),
      new Text(
        ' iranserver@gmail.com',
        style: TextStyle(fontSize: 17.0),
      )
    ],
  );
}

Row rowKaramouziScreenThree() {
  return new Row(
    children: <Widget>[
      new Icon(Icons.check_circle),
      new Text(
        ' iran_server',
        style: TextStyle(fontSize: 17.0),
      )
    ],
  );
}

Padding paddingOneKaramouziScreen() {
  return new Padding(
    padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.imageSizeMultiplier * 5.5,
        vertical: SizeConfig.heightMultiplier * 1.5),
    child: new Text(
      'کارآموزی منجر به استخدام ',
      style: TextStyle(
          fontSize: SizeConfig.textMultiplier * 2.8,
          fontWeight: FontWeight.bold),
    ),
  );
}

Padding paddingTwoKaramouziScreen(String description) {
  return new Padding(
    padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.imageSizeMultiplier * 5.5,
        vertical: SizeConfig.heightMultiplier * 1.5),
    child: new Text(
      description,
      style: TextStyle(fontSize: SizeConfig.textMultiplier * 2.5),
    ),
  );
}

Padding paddingThreeKaramouziScreen() {
  return new Padding(
    padding: EdgeInsets.only(
        right: SizeConfig.imageSizeMultiplier * 3.5,
        top: SizeConfig.heightMultiplier * 1.5),
    child: new Text(
      'شرایط',
      style: TextStyle(
          fontSize: SizeConfig.heightMultiplier * 3,
          fontWeight: FontWeight.bold),
    ),
  );
}

Padding paddingFourKaramouziScreen(String conditions) {
  return new Padding(
    padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.imageSizeMultiplier * 5.5,
        vertical: SizeConfig.heightMultiplier * 1.5),
    child: new Text(
      conditions,
      style: TextStyle(fontSize: SizeConfig.heightMultiplier * 2.7),
    ),
  );
}

Padding paddingFiveKaramouziScreen() {
  return new Padding(
    padding: EdgeInsets.only(
        right: SizeConfig.imageSizeMultiplier * 3.5,
        top: SizeConfig.heightMultiplier * 1.5),
    child: new Text(
      'آدرس',
      style: TextStyle(
          fontSize: SizeConfig.heightMultiplier * 3,
          fontWeight: FontWeight.bold),
    ),
  );
}

Padding paddingSixKaramouziScreen(String address) {
  return new Padding(
    padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.imageSizeMultiplier * 5.5,
        vertical: SizeConfig.heightMultiplier * 1.5),
    child: new Text(
      address,
      style: TextStyle(fontSize: SizeConfig.heightMultiplier * 2.7),
    ),
  );
}

Padding paddingSevenKaramouziScreen() {
  return new Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
    child: new Wrap(
      runSpacing: 8.0,
      spacing: 7.0,
      children: <Widget>[
        ObjectTag(
          tags: 'ios  برنامه نویسی',
        ),
        ObjectTag(
          tags: 'فرانت اند',
        ),
        ObjectTag(
          tags: 'بک اند',
        ),
        ObjectTag(
          tags: 'ui',
        ),
      ],
    ),
  );
}

Padding paddingEightKaramouziScreen() {
  return new Padding(
    padding: EdgeInsets.only(
        right: SizeConfig.imageSizeMultiplier * 3.5,
        top: SizeConfig.heightMultiplier * 1.5),
    child: new Text(
      'ارتباط',
      style: TextStyle(
          fontSize: SizeConfig.textMultiplier * 3, fontWeight: FontWeight.bold),
    ),
  );
}

Container containerError() {
  return new Container(
      child: new Text(
    "کاربر یافت نشد",
    style: TextStyle(
        color: Colors.red, fontSize: SizeConfig.heightMultiplier * 2.3),
  ));
}


Container ContainerImageLoginPage(var phonesize) {
  return new Container(
    color: Colors.white,
    height: phonesize.height,
    width: phonesize.width,
    child: new Align(
        alignment: Alignment.bottomLeft,
        child: new Opacity(
            opacity: 0.25,
            child: new Image(
              image: AssetImage(
                'assets/image/hom.png',
              ),
              height: phonesize.height * 0.4,
            ))),
  );
}

class DrawerLists extends StatelessWidget {
  MyData profile;

  DrawerLists({this.profile});

  @override
  Widget build(BuildContext context) {
    List<ListTile> listdrawer = [
      // ListTile(
      //   leading: new Icon(Icons.person),
      //   onTap: () {
      //     Navigator.push(
      //       context,
      //       MaterialPageRoute(builder: (context) => MyProfileStudentScreen()),
      //     );
      //   },
      //   title: Text('پروفایل'),
      //   trailing: Icon(Icons.arrow_forward),
      // ),
      ListTile(
        leading: new Icon(Icons.school),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ProfilesPages()),
          );
        },
        title: Text('دانشجوها'),
        trailing: Icon(Icons.arrow_forward),
      ),
      ListTile(
        leading: new Icon(Icons.create_new_folder),
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AdvertisingsPage(),
              ));
        },
        title: Text('آگهی ها'),
        trailing: Icon(Icons.arrow_forward),
      ),
      ListTile(
        leading: new Icon(Icons.work),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => KarAmouziPage()),
          );
        },
        title: Text('کارآموزی'),
        trailing: Icon(Icons.arrow_forward),
      ),
      ListTile(
        leading: new Icon(Icons.block),
        onTap: () {
          Navigator.of(context).push(new MaterialPageRoute(
              builder: (context) => new StudentPerfectScreen()));
        },
        title: Text('دانشجوی حرفه ای'),
        trailing: Icon(Icons.arrow_forward),
      ),
      ListTile(
        leading: new Icon(Icons.local_phone),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => new ErtebatBaMa()),
          );
        },
        title: Text('پشتیبانی'),
        trailing: Icon(Icons.arrow_forward),
      ),
      // ListTile(
      //   leading: new Icon(Icons.settings),
      //   onTap: () {},
      //   title: Text('تنظیمات'),
      //   trailing: Icon(Icons.arrow_forward),
      // ),
      ListTile(
        leading: new Icon(Icons.exit_to_app),
        onTap: () async {
          showDialog(
            context: context,
            builder: (context) => Directionality(
              textDirection: TextDirection.rtl,
              child: new AlertDialog(
                title: new Text(
                  "آیا برای خروج از حساب کاربری مطمئن هستید ؟ ",
                  style: TextStyle(fontSize: 16.0),
                ),
                actions: [
                  new FlatButton(
                    child: new Text("خیر"),
                    onPressed: () {
                      Navigator.of(context).pop(false);
                    },
                  ),
                  new FlatButton(
                    child: new Text("بله"),
                    onPressed: () async {
                      SharedPreferences perfs =
                          await SharedPreferences.getInstance();
                      await perfs.remove('user_apiToken');
                      await perfs.remove('user_username');
                      await perfs.remove('user_password');
                      Navigator.of(context).pushReplacement(
                          new MaterialPageRoute(
                              builder: (context) => new SignIn()));
                    },
                  ),
                ],
              ),
            ),
          );
        },
        title: Text('خروج از حساب کاربری'),
        trailing: Icon(Icons.arrow_forward),
      ),
    ];
    return Drawer(
      child: new ListView(
        children: <Widget>[
          new Container(
            color: Colors.white,
            child: new DrawerHeader(
                child: Column(
                  children: [Expanded(flex: 4,child: profile.image == "" ||
                    profile.image == null
                    ? Container(
                  height: SizeConfig.heightMultiplier * 10,
                  width: SizeConfig.heightMultiplier * 19,
                  child: new CircleAvatar(
                    child: new Text(
                      profile
                          .username
                          .toString()
                          .substring(0, 1),
                      style: TextStyle(
                          fontSize: SizeConfig.heightMultiplier*4,
                          color: Colors.white),
                    ),
                    backgroundColor:
                    R.color.banafshKamRang,
                    // minRadius: 30.0
                  ),
                )
                    : Center(
                  child: new CircleAvatar(
                    radius: SizeConfig
                        .heightMultiplier *
                        6,
                    backgroundImage:
                    new NetworkImage(
                      "http://stube.ir/image/${profile.image}",
                    ),
                    backgroundColor:
                    R.color.banafshKamRang,
                    // minRadius: 30.0
                  ),
                )),
                    Expanded(flex:2,child: Padding(
                        padding:  EdgeInsets.only(top: SizeConfig.heightMultiplier*2),
                        child: new Text(profile.username , style: TextStyle(fontSize: SizeConfig.textMultiplier*3),maxLines:1,overflow: TextOverflow.ellipsis,),
                      ),
                    )],
            )),
          ),
          new Column(
            children: <Widget>[
              new Column(
                children: new List.generate(listdrawer.length, (int index) {
                  return listdrawer[index];
                }),
              )
            ],
          )
        ],
      ),
    );
  }
}

class Headers extends StatelessWidget {
  MyData profile;

  Headers({this.profile});

  var username;

  @override
  Widget build(BuildContext context) {
    return new Container(
      decoration: decorationHomePage(),
      // height: SizeConfig.heightMultiplier * 15,
      child: new Column(
        children: <Widget>[
          new Padding(
            padding: EdgeInsets.only(
                right: SizeConfig.heightMultiplier * 3, top: 0.0),
            child: new Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                profile.image == null || profile.image == ""
                    ? new CircleAvatar(
                        child: Padding(
                            padding: EdgeInsets.only(
                                bottom: SizeConfig.heightMultiplier * 0.7),
                            child: new Text(
                              profile.username.toString().substring(0, 1),
                              style: TextStyle(
                                  color: R.color.banafshtire,
                                  fontSize: SizeConfig.textMultiplier * 4.5),
                            )),
                        backgroundColor: Colors.white,
                        minRadius: SizeConfig.heightMultiplier * 5)
                    : Center(
                  child: new CircleAvatar(
                    radius: SizeConfig
                        .heightMultiplier *
                        6,
                    backgroundImage:
                    new NetworkImage(
                      "http://stube.ir/image/${profile.image}",
                    ),
                    backgroundColor:
                    R.color.banafshKamRang,
                    // minRadius: 30.0
                  ),
                )
                ,new SizedBox(width: SizeConfig.imageSizeMultiplier * 2),
                Expanded(
                    flex: 1,
                    child: new Text(profile.name, style: styleHomePage(),maxLines: 1,overflow: TextOverflow.ellipsis,)),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class Constants {
  static String first = 'ایجاد درخواست';
  static String second = 'پیام';
  static String third = 'ذخیره';

  static List<String> textMorebutton = ['ایجاد درخواست', 'پیام', 'ذخیره'];
}

class MenuItemWidget extends StatelessWidget {
  ModelMenu model;
  var listener;

  MenuItemWidget({@required this.model, this.listener});

  @override
  Widget build(BuildContext context) {
    return new Container(
        child: new GestureDetector(
      onTap: () {
        listener();
      },
      child: new Card(
        shadowColor: Colors.black,
        elevation: 10.0,
        shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(SizeConfig.heightMultiplier * 2)),
        margin: EdgeInsets.only(
            left: SizeConfig.imageSizeMultiplier * 2,
            right: SizeConfig.imageSizeMultiplier * 2,
            top: SizeConfig.heightMultiplier * 1,
            bottom: SizeConfig.heightMultiplier * 1),
        color: Colors.white,
        child: new Container(
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                flex: 3,
                child: new Align(
                  alignment: Alignment.topCenter,
                  child: new Image(
                    image: AssetImage(model.image),
                    width: SizeConfig.imageSizeMultiplier * 40,
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: EdgeInsets.only(
                    bottom: SizeConfig.heightMultiplier * 1,
                  ),
                  child: new Align(
                    alignment: Alignment.bottomCenter,
                    child: new Text(
                      model.titr,
                      style: TextStyle(
                          color: model.color,
                          fontSize: SizeConfig.textMultiplier * 2.8,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}

class ClippLogin extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    // TODO: implement getClip
    Path path = new Path();
    path.lineTo(0, 0);
    path.lineTo(0, size.height - 30);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 30);
//    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    throw false;
  }
}

class bodyMessage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
        itemCount: 20,
        itemBuilder: (BuildContext context, int index) => new Column(
              children: <Widget>[
                new GestureDetector(
                  child: new Container(
                    width: MediaQuery.of(context).size.width,
                    child: new ListTile(
                      title: new Text('Omeadr'),
                      subtitle: new Text(
                        'سلام',
                        style: TextStyle(fontSize: 16.0),
                      ),
                      trailing: new Text(
                        '8.14 ب.ظ',
                        style: TextStyle(fontSize: 11.0),
                      ),
                      leading: new CircleAvatar(
                        backgroundImage: AssetImage(
                          'assets/image/dev.jpg',
                        ),
                        maxRadius: 30.0,
                      ),
                    ),
                  ),
                  onTap: () {
                    print('pressed chat ');
                  },
                ),
                Line(),
              ],
            ));
  }
}

class bodyRequest extends StatefulWidget {
  MyData profile;
  var phoneSize;

  bodyRequest({this.phoneSize, this.profile});

  @override
  _bodyRequestState createState() => _bodyRequestState();
}

String FieldText(String text) {
  return text == "" || text == null ? 'وارد نشده' : text;
}

class _bodyRequestState extends State<bodyRequest> {
  bool isLoading = false;

  List<RequestAd> requestsAd = [];
  List<RequestProfile> requestProfile = [];

  @override
  void initState() {
    super.initState();
    _getRequestAd();
  }

  _getRequestAd() async {
    if (this.mounted) {
      setState(() {
        isLoading = true;
      });
    }
    requestProfile = await RequestHttp.getProfileReqAd(widget.profile.id);
    var response = await RequestHttp.getAd(widget.profile.id);
    print(response);

    requestsAd.addAll(response['requests']);
    if (this.mounted) {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var phoneSize = MediaQuery.of(context).size;
    return isLoading
        ? new Center(
            child: new CircularProgressIndicator(),
          )
        : requestsAd.length == 0
            ? new Center(
                child: new Text(
                'در حال حاضر هیچ درخواستی برای کارآموزی های شما وجود ندارد (:',
                style: TextStyle(color: Colors.black),
              ))
            : new ListView.builder(
                padding: EdgeInsets.only(top: SizeConfig.heightMultiplier * .8),
                itemCount: requestsAd.length,
                itemBuilder: (BuildContext context, int index) => new Column(
                      children: <Widget>[
                        new GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(new MaterialPageRoute(
                                builder: (ctx) => new MyRequests(
                                    userName: requestProfile[index].username,
                                    date: requestsAd[index].date,
                                    text: requestsAd[index].req_text)));
                          },
                          child: new Container(
                            margin: EdgeInsets.only(
                                top: SizeConfig.heightMultiplier * .8),
                            width: widget.phoneSize.width,
                            child: new Column(
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.only(
                                      right:
                                          SizeConfig.imageSizeMultiplier * 2),
                                  child: new Row(
                                    children: <Widget>[
                                      //TODO inja az comment dar biad

                                      Expanded(
                                        flex: 1,
                                        child: requestProfile[index].image ==
                                                    "" ||
                                                requestProfile[index].image ==
                                                    null
                                            ? Container(
                                                height: phoneSize.height * 0.10,
                                                width: phoneSize.width * 0.19,
                                                child: new CircleAvatar(
                                                  child: new Text(
                                                    requestProfile[index]
                                                        .username
                                                        .toString()
                                                        .substring(0, 1),
                                                    style: TextStyle(
                                                        fontSize: 25.0,
                                                        color: Colors.white),
                                                  ),
                                                  backgroundColor:
                                                      R.color.banafshKamRang,
                                                  // minRadius: 30.0
                                                ),
                                              )
                                            : Center(
                                                child: new CircleAvatar(
                                                  radius: 37,
                                                  backgroundImage:
                                                      new NetworkImage(
                                                    "http://stube.ir/image/${requestProfile[index].image}",
                                                  ),
                                                  backgroundColor:
                                                      R.color.banafshKamRang,
                                                  // minRadius: 30.0
                                                ),
                                              ),
                                      ),

                                      Expanded(
                                        flex: 4,
                                        child: new Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: <Widget>[
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Expanded(
                                                  flex: 3,
                                                  child: Padding(
                                                    padding: EdgeInsets.only(
                                                        top: SizeConfig
                                                                .heightMultiplier *
                                                            1.8,
                                                        right: SizeConfig
                                                                .imageSizeMultiplier *
                                                            2),
                                                    child: new Text(
                                                      requestProfile[index]
                                                          .username,
                                                      maxLines: 1,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: TextStyle(
                                                          fontSize: SizeConfig
                                                                  .textMultiplier *
                                                              2.5,
                                                          fontWeight:
                                                              FontWeight.w800),
                                                    ),
                                                  ),
                                                ),
                                                // new Expanded(),
                                                Expanded(
                                                  flex: 1,
                                                  child: Padding(
                                                    padding: EdgeInsets.only(
                                                      top: SizeConfig
                                                              .heightMultiplier *
                                                          1.8,
                                                    ),
                                                    child: new Row(
                                                      children: <Widget>[
                                                        FittedBox(
                                                          child: new Text(
                                                            textTime(
                                                                requestsAd[index]
                                                                    .date),
                                                            style: TextStyle(
                                                                fontSize: SizeConfig
                                                                        .textMultiplier *
                                                                    1.8),
                                                          ),
                                                        ),

                                                        // new Padding(
                                                        //   padding: const EdgeInsets.only(left: 27.0),
                                                        //   child: new Row(
                                                        //     children: <Widget>[
                                                        //       new Text(
                                                        //         'khorasan,mashhad',
                                                        //         style: TextStyle(fontSize: 8.0),
                                                        //       ),
                                                        //       new Icon(
                                                        //         Icons.location_on,
                                                        //         size: 10.0,
                                                        //       )
                                                        //     ],
                                                        //   ),
                                                        // )
                                                      ],
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                            new Row(
                                              children: <Widget>[
                                                Expanded(
                                                  child: Padding(
                                                    padding: EdgeInsets.only(
                                                        right: SizeConfig
                                                                .imageSizeMultiplier *
                                                            2,
                                                        left: SizeConfig
                                                                .imageSizeMultiplier *
                                                            3),
                                                    child: new Text(
                                                      requestsAd[index]
                                                          .req_text,
                                                      maxLines: 2,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: TextStyle(
                                                          fontSize: SizeConfig
                                                                  .textMultiplier *
                                                              2.1),
                                                    ),
                                                  ),
                                                ),

                                                // ButtonMore(),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Line()
                      ],
                    ));
  }
}

class HeadersItems extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var phoneSize = MediaQuery.of(context).size;
    return new Column(
      children: <Widget>[
        new Row(
          children: <Widget>[
            new Container(
              height: phoneSize.height * 0.25,
              width: phoneSize.width * 0.45,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      colorFilter:
                          ColorFilter.mode(Colors.black45, BlendMode.darken),
                      fit: BoxFit.cover,
                      image: AssetImage(
                        'assets/image/dev.jpg',
                      ))),
              child: new Align(
                alignment: Alignment.topRight,
                child: new IconButton(
                    icon: Icon(
                      Icons.share,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      print('pressed');
                    }),
              ),
            ),
            new Container(
              height: phoneSize.height * 0.25,
              width: phoneSize.width * 0.55,
              color: Color(0xff2D0827),
              child: new Column(
                children: <Widget>[
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      new Padding(
                        padding: const EdgeInsets.only(top: 2.0, right: 5.0),
                        child: new CircleAvatar(
                          backgroundImage: AssetImage('assets/image/avt.jpg'),
                          maxRadius: 16.0,
                        ),
                      ),
                      new IconButton(
                          icon: Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                          ),
                          onPressed: () {})
                    ],
                  ),
                  new Align(
                    alignment: Alignment.topRight,
                    child: new Padding(
                      padding: const EdgeInsets.only(right: 5.0),
                      child: new Text(
                        'برنامه نویس اپلیکیشن',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: TextStyle(
                            fontSize: 21.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ),
                  new Align(
                    alignment: Alignment.topRight,
                    child: new Padding(
                      padding: const EdgeInsets.only(right: 5.0),
                      child: new Text(
                        'ایران سرور',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: TextStyle(fontSize: 18.0, color: Colors.white),
                      ),
                    ),
                  ),
                  new Align(
                      alignment: Alignment.topRight,
                      child: new Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: new Text(
                          'رایانه و فناوری اطلاعات',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff44143E),
                          ),
                        ),
                      )),
                  new SizedBox(
                    height: phoneSize.height * 0.02,
                  ),
                  new Align(
                    alignment: Alignment.bottomCenter,
                    child: new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        new GestureDetector(
                          child: new Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20.0))),
                            width: phoneSize.width * 0.17,
                            child: new Text(
                              'پیام',
                              style: TextStyle(
                                  color: Color(0xff2D0827),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14.0),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        new GestureDetector(
                          child: new Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20.0))),
                            width: phoneSize.width * 0.17,
                            child: new Text(
                              'شروع کار',
                              style: TextStyle(
                                  color: Color(0xff2D0827),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14.0),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        new GestureDetector(
                          child: Icon(
                            Icons.bookmark_border,
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        )
      ],
    );
  }
}

class ButtonMore extends StatefulWidget {
  @override
  _ButtonMoreState createState() => _ButtonMoreState();
}

class _ButtonMoreState extends State<ButtonMore> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: PopupMenuButton<String>(
          onSelected: choiceAction,
          itemBuilder: (BuildContext context) {
            return Constants.textMorebutton
                .map((String text) =>
                    PopupMenuItem<String>(value: text, child: Text(text)))
                .toList();
          }),
    );
  }
}

class ObjectTag extends StatelessWidget {
  final String tags;

  const ObjectTag({this.tags});

  @override
  Widget build(BuildContext context) {
    return new Container(
        height: 20.0,
        decoration: BoxDecoration(
            color: Color(0xff2D0827),
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(15.0)),
        child: new Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 3.0),
          child: new Text(
            tags,
            style: new TextStyle(
              color: Colors.white,
              fontSize: 10.0,
            ),
          ),
        ));
  }
}

void choiceAction(String choice) {
  if (choice == 'ایجاد درخواست') {
    print('Press 1');
  } else if (choice == 'پیام') {
    print('Press 2');
  } else if (choice == 'ذخیره') {
    print('Press 3');
  }
}

// FloatingActionButton floatingKaramouziScreen(){
//   return ;
// }

FloatingActionButton floatingActionButtonAgahiScreen(context) {
  return new FloatingActionButton(
    onPressed: () {
      print('Pressed');
    },
    backgroundColor: R.color.banafshmain,
    child: OpenContainer(
      transitionDuration: Duration(milliseconds: 500),
      closedBuilder: (ctx, action) => new Container(
        color: R.color.banafshmain,
        width: MediaQuery.of(context).size.width,
        child: new Icon(
          Icons.add,
          color: R.color.red,
        ),
      ),
      openBuilder: (ctx, action) => AddPostAgahi(),
    ),
  );
}
