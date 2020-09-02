import 'package:flutter/material.dart';
import 'file:///E:/myproject/lib/AgahiPage/AgahiPages.dart';
import 'file:///E:/myproject/lib/KarAmouziPage/KarAmouziPage.dart';
import 'file:///E:/myproject/lib/StudentPage/ProfilesPage.dart';
import 'R.dart';



class ModelMenu {
  String titr;
  String image;
  Color color;
  ModelMenu(this.titr, this.image, this.color);
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

TextStyle styleHomePage(){
  return TextStyle(
      color: Colors.white,
      fontSize: 22.0,
      fontWeight: FontWeight.bold);
}

AppBar appBarHomePage() {
  return new AppBar(actions: <Widget>[
    new IconButton(
        icon: Icon(
          Icons.person,
          color: Colors.white,
          size: 28,
        ),
        onPressed: () {})
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