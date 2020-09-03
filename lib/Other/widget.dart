import 'package:flutter/material.dart';
import 'package:stubbbb/AgahiPage/AddPostAgahi.dart';
import 'package:stubbbb/AgahiPage/AgahPage.dart';
import 'package:stubbbb/AgahiPage/AgahiPages.dart';
import 'package:stubbbb/KarAmouziPage/KarAmouziPage.dart';
import 'package:stubbbb/Models/Profile.dart';
import 'package:stubbbb/Models/profileModels.dart';
import 'package:stubbbb/ProfilePage/MyProfilePage.dart';
import 'package:stubbbb/StudentPage/StudentScreen.dart';
import 'R.dart';
import 'package:animations/animations.dart';




class ModelMenu {
  String titr;
  String image;
  Color color;
  ModelMenu(this.titr, this.image, this.color);
}

BoxDecoration decorationLoginPagee(){
  return BoxDecoration(
      boxShadow: [
        BoxShadow(
            color: Colors.black,
            offset: Offset(2, 2),
            blurRadius: 7)
      ],
      color: Color(0xffFE346E),
      borderRadius: BorderRadius.circular(30.0));
}

BoxDecoration deorationLoginPage(){
  return BoxDecoration(
      color: Colors.white,
      boxShadow: [
        BoxShadow(
            color: Colors.black,
            offset: Offset(2, 2),
            blurRadius: 7)
      ],
      borderRadius: BorderRadius.circular(30.0));
}

BoxDecoration decorationHomePage(){
  return BoxDecoration(
      color: R.color.banafshmain,
      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(35.0)));
}

BoxDecoration decorationImageHomePage(){
  return BoxDecoration(
      shape: BoxShape.circle,
      image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage('assets/image/download.jfif'))
  );
}


BoxDecoration decorationImageSignin(){
  return new BoxDecoration(
      image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(
            'assets/image/backlog.png',
      )));
}

BoxDecoration decorationSignin(){
  return new BoxDecoration(
      borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(40),
          bottomRight: Radius.circular(40)));
}

BoxDecoration decorationSignUp(){
  return new BoxDecoration(
      image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(
            'assets/image/backreg.png',
          )));
}

BoxDecoration decorationWelcomePage(){
  return new BoxDecoration(
      image: DecorationImage(
          image: AssetImage('assets/image/back.jpg'),
          fit: BoxFit.cover
      )
  );
}

BoxDecoration decorationKaramouziScreen(){
  return BoxDecoration(
      boxShadow: [
        BoxShadow(
            color: Colors.black54,
            offset: Offset(0.0, 1.0),
            blurRadius: 5.0)
      ],
      color: Colors.white,
      borderRadius: BorderRadius.only(
        bottomRight: Radius.circular(65.0),
        topRight: Radius.circular(65.0),
        topLeft: Radius.circular(15.0),
        bottomLeft: Radius.circular(15.0),
      ));
}

BoxDecoration boxDecorationKaramouziScreen(){
  return BoxDecoration(
      borderRadius: BorderRadius.only(
          topRight: Radius.circular(65.0),
          bottomRight: Radius.circular(65.0)),
      image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage('assets/image/download.jfif')));
}

BoxDecoration boxDecorationKaramouziScrenn(){
  return BoxDecoration(
      color: Color(0xffD2FAFB),
      shape: BoxShape.rectangle,
      borderRadius: BorderRadius.circular(15.0));
}


InputDecoration inputDecorationLoginPage(String labelText,IconData icon){
  return InputDecoration(
      prefixIcon: Icon(icon,color: Colors.white,),
      labelText: labelText,
      labelStyle: TextStyle(color: Colors.white),
      border: UnderlineInputBorder(
          borderSide:
          BorderSide(color: Colors.white)),
      fillColor: Colors.white,
      focusColor: Colors.white,
      hoverColor: Colors.white,
      enabledBorder: UnderlineInputBorder(
          borderSide:
          BorderSide(color: Colors.white)));
}

Icon iconKarAmouziScreen(){
  return new Icon(
    Icons.location_city,
    size: 8.0,
    color: R.color.banafshmain,
  );
}


Text texKarAmouziScreen(){
  return new Text(
    'مشهد،وکیل آباد 56 ، مجتمع احسان',
    style: TextStyle(fontSize: 8.0),
  );
}

Text textKarAmouzziScreen(){
  return new Text(
    'ux',
    style: new TextStyle(
      color: Color(0xff2c003e),
      fontSize: 11.0,
    ),
  );
}

Text textKarAmoziScreen(){
  return new Text(
    'ui',
    style: new TextStyle(
      color: Color(0xff2c003e),
      fontSize: 11.0,
    ),
  );
}

Text textKarAmouziScreen(){
  return new Text(
    'گرافیک',
    style: new TextStyle(
      color: Color(0xff2c003e),
      fontSize: 11.0,
    ),
  );
}

Text textoneKaramouziScreen(){
  return new Text(
    'برنامه نویس اپلیکیشن',
    style: TextStyle(
        fontSize: 16.0, fontWeight: FontWeight.bold),
    maxLines: 1,
    overflow: TextOverflow.ellipsis,
  );
}

Text textTwoKaramouziScreen(){
    return new Text(
        'تعدادی دانشجوی کامپیوتر جهت کاراموزی نیازمندیم ...',
        maxLines: 1,
      overflow: TextOverflow.ellipsis,
      );
}

Text textthreeKaramouziScreen(){
  return new Text(
    'شرکت ایران سرور',
    overflow: TextOverflow.ellipsis,
    maxLines: 1,
    style: TextStyle(
      fontSize: 12.0,
    ),
  );
}

Text textfourKaramouziScreen(){
  return new Text(
    '|',
    style: TextStyle(
        fontSize: 18.0, fontWeight: FontWeight.bold),
  );
}

Text textfiveKaramouziScreen(){
  return new Text(
    'ار اموزی منجر به استخدام',
        overflow: TextOverflow.ellipsis,
      maxLines: 1,
      style: TextStyle(
      fontSize: 12.0,
      ),
    );
}



Text textSignUp(){
  return new Text('خوش اومدی',
      style: TextStyle(
          fontSize: 35.0,
          fontWeight: FontWeight.bold,
          color: Colors.white));
}

Text textWelcomePage(){
  return new Text('Stub',
    style: TextStyle(
        color: Colors.white,
        fontSize: 38,
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.italic),);
}

Text textWelcomePagehint(String text,double fontsize,FontWeight fontWeight){
  return new Text(text,
    style: TextStyle(
      color: Colors.white,
      fontSize: fontsize,
      fontWeight: fontWeight,
      fontStyle: FontStyle.normal),);
}


Text textSignUpS(){
  return new Text(
    'ثبت نام',
    style: new TextStyle(
        color: Colors.white,
        fontSize: 30,
        fontWeight: FontWeight.w700),
  );
}

Text textSignUpLogin(){
  return new Text(
    'ورود',
    style: TextStyle(
        color: Colors.white,
        decoration:
        TextDecoration.underline,
        fontSize: 18),
  );
}

String validateSignUpPas(String value) {
  if (value.length < 6) {
    return 'not true';
  }
}

String validateNameSignUp(String value) {
  if (value.contains(new RegExp(
      r"^(?=.{3,20}$)(?![_.])(?!.*[_.]{2})[a-zA-Z0-9._]+(?<![_.])$"))) {
    return 'not true';
  } else if (value.isEmpty)
    return 'not';
}

String validateSignUp(String value) {
  if (!value.contains(new RegExp(
      r"^(?=.{3,20}$)(?![_.])(?!.*[_.]{2})[a-zA-Z0-9._]+(?<![_.])$"))) {
    return 'not true';
  }
}

Text textSplashScreen(){
  return new Text(
    'استیوب',
    style: new TextStyle(fontSize: 30.0),
  );
}

Text textSignIn(){
  return new Text('منتظرت بودیم !',
      style: TextStyle(
          fontSize: 35.0,
          fontWeight: FontWeight.bold,
          color: Colors.white));
}

Text textSignInLogin(){
  return  new Text(
    'ورود',
    style: new TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.w700),
  );
}

Text textSignInPage(){
  return new Text(
    'ثبت نام',
    style: TextStyle(
        decoration: TextDecoration.underline,
        fontSize: 17),
  );
}

Text textSigInForget(){
  return new Text(
    'فراموشی گلمه عبور',
    style: TextStyle(
        decoration: TextDecoration.underline,
        fontSize: 17),
  );
}

Text textLoginPage(){
  return new Text('ورود',style: TextStyle(fontSize: 35.0,fontWeight: FontWeight.bold,color: Colors.white),);
}

Text textLoginPageLogin(){
  return new Text(
    'ورود',
    style: TextStyle(
        fontSize: 25, color: Colors.white),
    textAlign: TextAlign.center,
  );
}

Padding textLoginPageSignup(){
  return new Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 0),
      child: new Text(
        'ثبت نام',
        style: TextStyle(
            fontSize: 25, color: Color(0xff2C003E)),
        textAlign: TextAlign.center,
      )
  );
}

TextStyle styleHomePage(){
  return TextStyle(
      color: Colors.white,
      fontSize: 22.0,
      fontWeight: FontWeight.bold);
}

CircleAvatar circleAvatarSignIn(){
  return new CircleAvatar(
    radius: 40,
    backgroundColor: R.color.banafshmain,
    child: new Icon(
      Icons.arrow_forward,
      size: 40,
    ),
  );
}

CircleAvatar circleSignUp(){
  return new CircleAvatar(
    radius: 40,
    backgroundColor: R.color.banafshmain,
    child: new Icon(
      Icons.arrow_forward,
      size: 40,
    ),
  );
}

CircleAvatar circleAvatarKaramouziScreen(){
  return new CircleAvatar(
    maxRadius: 9.0,
    child: new Icon(
      Icons.arrow_forward_ios,
      color: Colors.white,
      size: 9.0,
    ),
    backgroundColor: Color(0xff2C003E),
  );
}

AppBar appBarHomePage(BuildContext context) {
  return new AppBar(actions: <Widget>[
    new IconButton(
        icon: IconButton(
          icon: Icon(Icons.person,color: Colors.white,size: 28,)
        ),
        onPressed: () {
          Navigator.push(context, new MaterialPageRoute(builder: (context)=> new MyProfilePage()));
        }
        )
  ], elevation: 0.0, backgroundColor: R.color.banafshmain);
}

AppBar appBarMessagePage(_scaffoldKey) {
  // final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

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
      new Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          new Padding(
              padding: const EdgeInsets.only(left: 5.0),
              child: new IconButton(
                  icon: Icon(
                    Icons.filter_list,
                    color: R.color.banafshmain,
                  ),
                  onPressed: () {})),
        ],
      )
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

AppBar appBarProfilePage(){
  return new AppBar(
//            title: this.cusSearchBar,
    title: SearchProfilePage(),
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

AppBar appBarKaramouziScreen(){
  return AppBar(
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
  );
}

AppBar appBarAgahiScreen(){
  return AppBar(
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
          Tab(
              icon: new Text(
                'کارفرکا',
                style: TextStyle(color: Colors.black),
              )),
        ],
      ));
}

AppBar appBarProfileScreen(){
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

class SearchProfilePage extends StatefulWidget {
  @override
  _SearchProfilePageState createState() => _SearchProfilePageState();
}

class _SearchProfilePageState extends State<SearchProfilePage> {
  FocusNode focusNode = FocusNode();
  String hintText = 'جستجو ...';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        hintText = '';
      } else {
        hintText = 'جستجو ...';
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Row(
      children: <Widget>[
        new Expanded(
          child: new TextField(
            decoration: InputDecoration(
//          border: InputBorder.none,
              contentPadding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 10.0),
              suffixIcon: new Icon(
                Icons.search,
                color: Color(0xff2c003e),
              ),
//            labelText: "جستجو ...",
              enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
                borderSide: const BorderSide(
                  color: Color(0xffF2F3F8),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
                borderSide: BorderSide(color: Colors.white),
              ),
              fillColor: Color(0xffF2F3F8),
              hintText: hintText,

              filled: true,
            ),
          ),
        ),
        new GestureDetector(
          child: new Icon(
            Icons.filter_list,
            color: Colors.black,
          ),
          onTap: () {
            showModalBottomSheet(
                context: context,
                builder: (builder) => Container(
                    child: new Column(
                      children: <Widget>[
                        new Container(
                          color: R.color.red,
                          child: new Text(
                            'فیلتر دسته بندی ها',
                            textDirection: TextDirection.rtl,
                            style: TextStyle(
                                fontSize: 20.0, fontWeight: FontWeight.bold),
                          ),
                        ),
//                                              new Row(
//                                                children: <Widget>[
//
////                                    CustomRadio<int, double>(
////                                        value: value,
////                                        groupValue: widget.radioValue,
////                                        duration: Duration(milliseconds: 400),
////                                        animsBuilder: (AnimationController controller) => [
////                                          CurvedAnimation(
////                                              parent: controller,
////                                              curve: Curves.ease
////                                          )
////                                        ],
////                                        builder: ({ BuildContext context, List<double> animValues, Function updateState, bool checked }) {
////                                          return GestureDetector(
////                                              onTapDown: (TapDownDetails details) {
////                                                setState(() {
////                                                  if (_controller.status != AnimationStatus.completed)
////                                                    _controller.forward();
////                                                });
////                                              },
////                                              onTapUp: (TapUpDetails details) {
////                                                setState(() {
////                                                  if (_controller.status != AnimationStatus.dismissed)
////                                                    _controller.reverse();
////                                                });
////                                              },
////                                              onTap: () {
////                                                setState(() {
////                                                  widget.radioValue = value;
////                                                });
////                                              },
////                                              child: Container(
////                                                margin: EdgeInsets.all(8.0),
////                                                width: 38.0,
////                                                height: 38.0,
////                                                alignment: Alignment.center,
////                                                decoration: BoxDecoration(
////                                                  shape: BoxShape.circle,
////                                                ),
////                                                child: Stack(
////                                                    alignment: Alignment.center,
////                                                    children: <Widget>[
////                                                      Container(
////                                                        width: 38.0 * _animation.value,
////                                                        height: 38.0 * _animation.value,
////                                                        decoration: BoxDecoration(
////                                                            shape: BoxShape.circle,
////                                                            color: Theme.of(context).primaryColor.withAlpha(40)
////                                                        ),
////                                                      ),
////                                                      Container(
////                                                        width: 18.0,
////                                                        height: 18.0,
////                                                        decoration: BoxDecoration(
////                                                            shape: BoxShape.circle,
////                                                            color: Colors.transparent,
////                                                            border: Border.all(
////                                                                color: checked ? Theme.of(context).primaryColor : Theme.of(context).hintColor,
////                                                                width: 2.0
////                                                            )
////                                                        ),
////                                                      ),
////                                                      Container(
////                                                        width: 11.0 * animValues[0],
////                                                        height: 11.0 * animValues[0],
////                                                        decoration: BoxDecoration(
////                                                          shape: BoxShape.circle,
////                                                          color: Theme.of(context).primaryColor,
////                                                        ),
////                                                      ),
////                                                    ]
////                                                ),
////                                              )
////                                          );
////                                        }
////                                    ),
//                                                ],
//                                              )
                      ],
                    )));
          },
        ),
      ],
    );
  }
}


Row rowOneKaramouziScreen(){
  return new Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
      new Icon(Icons.timer,color: Colors.black54,size: 20.0,),
      new SizedBox(width: 3.0,),
      new Padding(
          padding: const EdgeInsets.only(top: 3.0),
          child: new Text('4 ساعت در روز',style: TextStyle(color: Colors.black54,fontSize: 15.0))
      )
    ],
  );
}

Row rowTwoKaramouziScreen(){
  new Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: <Widget>[
      new Icon(Icons.people,color: Colors.black54,size: 20.0,),
      new SizedBox(width: 3.0,),
      new Padding(
          padding: const EdgeInsets.only(top: 3.0, left: 3.0),
          child: new Text('6 نفر',style: TextStyle(color: Colors.black54,fontSize: 15.0),)
      )
    ],
  );
}

Row rowKaramouziScreenOne(){
  return new Row(
    children: <Widget>[
      new Icon(Icons.call),
      new Text(' 0939734053', style: TextStyle(fontSize: 17.0),)
    ],
  );
}

Row rowKaramouziScreenTwo(){
  return new Row(
    children: <Widget>[
      new Icon(Icons.mail),
      new Text(' iranserver@gmail.com', style: TextStyle(fontSize: 17.0),)
    ],
  );
}


Row rowKaramouziScreenThree(){
  return new Row(
    children: <Widget>[
      new Icon(Icons.check_circle),
      new Text(' iran_server', style: TextStyle(fontSize: 17.0),)
    ],
  );
}



Padding paddingOneKaramouziScreen(){
  return new Padding(padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10.0),
    child: new Text('کارآموزی منجر به استخدام ',
      style: TextStyle(fontSize: 17.0,fontWeight: FontWeight.bold),),);
}


Padding paddingTwoKaramouziScreen(){
  return new Padding(padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10.0),
    child: new Text('تعدادی دانشجوی کامپیوتر جهت کارآموزی برنامه نویسی اپلیکیشن در شرکت می پذیریم',
      style: TextStyle(fontSize: 17.0),),);
}


Padding paddingThreeKaramouziScreen(){
  return new Padding(padding: const EdgeInsets.only(right: 15.0,left: 15.0,top: 10.0),
    child: new Text('شرایط',
      style: TextStyle(fontSize: 22.0,fontWeight: FontWeight.bold),),);
}


Padding paddingFourKaramouziScreen(){
  return new Padding(padding: const EdgeInsets.symmetric(horizontal: 25.0,vertical: 5.0),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Text('حداقل ترم 3 کامپیوتر',
            style: TextStyle(fontSize: 17.0),),
          new Text('آشنایی مقدماتی با برنامه نویسی',
            style: TextStyle(fontSize: 17.0),),
          new Text('کار با فوتوشاپ و افترافکت',
            style: TextStyle(fontSize: 17.0),),
        ],)
  );
}


Padding paddingFiveKaramouziScreen(){
  return new Padding(padding: const EdgeInsets.only(right: 15.0,left: 15.0,top: 10.0),
    child: new Text('آدرس',
      style: TextStyle(fontSize: 22.0,fontWeight: FontWeight.bold),),);
}


Padding paddingSixKaramouziScreen(){
  return new Padding(padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10.0),
    child: new Text('مشهد، وکیل آباد 56، خیابان طاهر، مجتمع صدف', style: TextStyle(fontSize: 17.0),),);
}


Padding paddingSevenKaramouziScreen(){
  return new Padding(padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 20.0),
    child: new Wrap(
      runSpacing: 8.0,
      spacing: 7.0,
      children: <Widget>[
        ObjectTag(tags: 'ios  برنامه نویسی',),
        ObjectTag(tags: 'فرانت اند',),
        ObjectTag(tags: 'بک اند',),
        ObjectTag(tags: 'ui',),
      ],
    ),);
}

Padding paddingEightKaramouziScreen(){
  return new Padding(padding: const EdgeInsets.only(right: 15.0,left: 15.0,top: 10.0),
    child: new Text('ارتباط',
      style: TextStyle(fontSize: 22.0,fontWeight: FontWeight.bold),),);
}



Container containerError(){
  return new Container(
      child: new Text(
        "کاربر یافت نشد",
        style: TextStyle(
            color: Colors.red,
            fontSize: 17),
      ));
}

Container containerSplash(){
  return new Container(
    decoration: new BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/image/drawing.png'))),
  );
}

Container ContainerImageLoginPage(var phonesize){
  return new Container(color: Colors.white,
    height: phonesize.height,
    width: phonesize.width,
    child: new Align(alignment: Alignment.bottomLeft,
        child: new Opacity(opacity: 0.25,
            child: new Image(image: AssetImage('assets/image/hom.png',),height: phonesize.height*0.4,))),);
}


class DrawerLists extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<ListTile> listdrawer = [
      ListTile(
        leading: new Icon(Icons.person),
        onTap: () {},
        title: Text('پروفایل'),
        trailing: Icon(Icons.arrow_forward),
      ),
      ListTile(
        leading: new Icon(Icons.school),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ProfilesPages()),
          );
        },
        title: Text('دانشجوهخا'),
        trailing: Icon(Icons.arrow_forward),
      ),
      ListTile(
        leading: new Icon(Icons.create_new_folder),
        onTap: () {

          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AgahiPages(),
              ));
        },
        title: Text('آگهیا'),
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
        onTap: () {},
        title: Text('دانشجوی حرفه ای'),
        trailing: Icon(Icons.arrow_forward),
      ),
      ListTile(
        leading: new Icon(Icons.settings),
        onTap: () {},
        title: Text('تنظیمات'),
        trailing: Icon(Icons.arrow_forward),
      ),
      ListTile(
        leading: new Icon(Icons.exit_to_app),
        onTap: () {},
        title: Text('خروج'),
        trailing: Icon(Icons.arrow_forward),
      ),
    ];
    return Drawer(

      child: new ListView(
//          padding: EdgeInsets.zero,
        children: <Widget>[
          new Container(
            color: Colors.white,
            child: new DrawerHeader(
                child: new CircleAvatar(
                  child: Image.asset('assets/image/download (4).png'),
                )),
          ),
          new Column(
            children: <Widget>[
              new Column(
                children: new List.generate(7, (int index) {
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

  Profile profile;
  Headers({this.profile});
  var username;
  @override
  Widget build(BuildContext context) {
    var sizePhone = MediaQuery.of(context).size;
    return new Container(
      decoration: decorationHomePage(),
      height: sizePhone.height * 0.16,
      child: new Column(
        children: <Widget>[
          new Padding(
            padding: const EdgeInsets.only(right: 20.0, top: 0.0),
            child: new Row(
              children: <Widget>[
                new Container(
                    margin: const EdgeInsets.only(left: 5.0, top: 10.0),
                    height: 70.0,
                    width: 70.0,
                    decoration: decorationImageHomePage()
                ),
                new SizedBox(width: 10.0),
                new Positioned(
                    child: new Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        new Text('سید امید روینده',style: styleHomePage()),
                      ],
                    )
                )
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
  var phoneSize;
  var listener;

  MenuItemWidget({@required this.model, this.phoneSize, this.listener});

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
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
            margin: const EdgeInsets.only(left: 15.0, right: 5.0, top: 25.0),
            color: Colors.white,
            child: new Container(
              height: phoneSize.height * 0.27,
              width: phoneSize.width * 0.38,
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  new Align(
                    alignment: Alignment.topCenter,
                    child: new Image(
                      image: AssetImage(model.image),
                      height: 120.0,
                    ),
                  ),
                  new SizedBox(
                    height: 20.0,
                  ),
                  new Align(
                    alignment: Alignment.bottomCenter,
                    child: new Text(
                      model.titr,
                      style: TextStyle(
                          color: model.color,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold),
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



class bodyRequest extends StatelessWidget {
  var phoneSize;
  bodyRequest({this.phoneSize});


  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
        padding: const EdgeInsets.only(top: 5.0),
        itemCount: 20,
        itemBuilder: (BuildContext context, int index) => new Column(
          children: <Widget>[
            new GestureDetector(
              child: new Container(
                margin: const EdgeInsets.only(top: 5.0),
                width: phoneSize.width,
                child: new Column(
                  children: <Widget>[
                    new Row(
                      children: <Widget>[
                        new Container(
                            margin: const EdgeInsets.symmetric(horizontal: 8.0),
                            height: phoneSize.height * 0.10,
                            width: phoneSize.width * 0.19,
                            decoration: decorationImageHomePage()
                        ),
                        new Column(
                          crossAxisAlignment:
                          CrossAxisAlignment.start,
                          children: <Widget>[
                            new Text('Omeadr'),
                            new Row(
                              children: <Widget>[
                                new SizedBox(
                                  width: 250.0,
                                  child: new Text(
                                    'سلام،حدود 5سال سابقه برنامه نویسی اپلیکیشن دارمو می تونم در این زمینه با شما همکاری کنم و به خو',
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                ButtonMore(),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                    new Row(
                      mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        new Padding(
                          padding: const EdgeInsets.only(right: 80.0),
                          child: new Text(
                            '8.14 ب.ظ',
                            style: TextStyle(fontSize: 8.0),
                          ),
                        ),
                        new Padding(
                          padding: const EdgeInsets.only(left: 27.0),
                          child: new Row(
                            children: <Widget>[
                              new Text(
                                'khorasan,mashhad',
                                style: TextStyle(fontSize: 8.0),
                              ),
                              new Icon(
                                Icons.location_on,
                                size: 10.0,
                              )
                            ],
                          ),
                        )
                      ],
                    )
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
            new Container(height: phoneSize.height*0.25,
              width: phoneSize.width * 0.45,
              decoration: BoxDecoration(
                  image: DecorationImage(colorFilter: ColorFilter.mode(Colors.black45, BlendMode.darken),
                      fit: BoxFit.cover,
                      image: AssetImage('assets/image/dev.jpg',)
                  )
              ),
              child:new Align(alignment: Alignment.topRight,
                child:   new IconButton(icon: Icon(Icons.share,color: Colors.white,), onPressed: (){print('pressed');}),),
            ),
            new Container(height: phoneSize.height*0.25,
              width:phoneSize.width*0.55,
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
                      child: new Text('برنامه نویس اپلیکیشن',overflow: TextOverflow.ellipsis,maxLines: 1,
                        style: TextStyle(fontSize: 21.0,fontWeight: FontWeight.bold,color: Colors.white),),),),
                  new Align(alignment: Alignment.topRight,
                    child: new Padding(padding: const EdgeInsets.only(right: 5.0),
                      child: new Text('ایران سرور',overflow: TextOverflow.ellipsis,maxLines: 1,
                        style: TextStyle(fontSize: 18.0,color: Colors.white),),),),
                  new Align(alignment: Alignment.topRight,
                      child: new Padding(padding: const EdgeInsets.only(right: 8.0),
                        child: new Text('رایانه و فناوری اطلاعات',overflow: TextOverflow.ellipsis,maxLines: 1,
                          style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold,color: Color(0xff44143E),),),)),
                  new SizedBox(height: phoneSize.height*0.02,),
                  new Align(alignment: Alignment.bottomCenter,
                    child: new Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        new GestureDetector(
                          child: new Container(decoration: BoxDecoration(color: Colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(20.0))),
                            width: phoneSize.width*0.17,
                            child: new Text('پیام',
                              style:TextStyle(
                                  color: Color(0xff2D0827),fontWeight: FontWeight.bold,fontSize: 14.0),
                              textAlign: TextAlign.center,),
                          ),
                        ),
                        new GestureDetector(
                          child: new Container(decoration: BoxDecoration(color: Colors.white,
                              borderRadius: BorderRadius.all(Radius.circular(20.0))),
                            width: phoneSize.width*0.17,
                            child: new Text('شروع کار',
                              style:TextStyle(
                                  color: Color(0xff2D0827),fontWeight: FontWeight.bold,fontSize: 14.0),
                              textAlign: TextAlign.center,),
                          ),
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


class ButtonMore extends StatefulWidget {
  @override
  _ButtonMoreState createState() => _ButtonMoreState();
}

class _ButtonMoreState extends State<ButtonMore> {
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
        onSelected: choiceAction,
        itemBuilder: (BuildContext context) {
          return Constants.textMorebutton
              .map((String text) =>
              PopupMenuItem<String>(value: text, child: Text(text)))
              .toList();
        });
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
        child:new Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6.0,vertical: 3.0),
          child: new Text(tags,style: new TextStyle(color: Colors.white,fontSize: 10.0,),),
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


FloatingActionButton floatingKaramouziScreen(){
  return new FloatingActionButton(
    onPressed: () {
      print('Pressed');
    },
    backgroundColor: R.color.banafshmain,
    child: new Icon(
      Icons.add,
      color: Colors.white,
    ),
  );
}

FloatingActionButton floatingActionButtonAgahiScreen(context){
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