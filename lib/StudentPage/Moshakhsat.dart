import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stubbbb/Models/Comment.dart';
import 'package:stubbbb/Models/DataUser.dart';
import 'package:stubbbb/Models/myData.dart';
import 'package:stubbbb/Models/profileModels.dart';
import 'package:stubbbb/Other/R.dart';
import 'package:stubbbb/Other/SizeConfig.dart';
import 'package:stubbbb/Other/widget.dart';
import 'package:stubbbb/ProfilePage/MyProfileScreen.dart';
import 'package:stubbbb/http/Authenticate.dart';
import 'package:stubbbb/http/httpComments.dart';
import 'package:flutter/scheduler.dart';
import 'package:stubbbb/http/httpRequest.dart';

class ProPage extends StatefulWidget {
  User user;
  MyData profile;

  ProPage({this.profile, this.user});

  @override
  _ProPageState createState() => _ProPageState();
}

class _ProPageState extends State<ProPage> with SingleTickerProviderStateMixin {
  final bodyGlobalKey = GlobalKey();
  final List<Widget> myTabs = [
    Tab(text: 'مشخصات'),
    Tab(
      text: 'نمونه کارها',
    ),
    Tab(text: 'نظرات'),
  ];

  DataUser dataUser;
  TabController _tabController;
  ScrollController _scrollController;
  bool isLoading = false;

  Widget _head() {
    return new Row(
      children: [
        Expanded(
          flex: 1,
          child: Container(
            color: Color(0xff44143E),
            height: MediaQuery.of(context).size.height * 0.28,
            width: MediaQuery.of(context).size.width * 0.5,
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: new Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Directionality(
                        textDirection: TextDirection.ltr,
                        child: new Padding(
                          padding: EdgeInsets.only(
                              left: SizeConfig.imageSizeMultiplier,
                              top: SizeConfig.heightMultiplier),
                          child: new Row(
                            children: <Widget>[
                              new Icon(
                                Icons.school,
                                color: Colors.white,
                                size: SizeConfig.heightMultiplier * 3.3,
                              ),
                              new SizedBox(
                                width: SizeConfig.imageSizeMultiplier * 1.5,
                              ),
                              new Text(
                                widget.user.username,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: SizeConfig.textMultiplier * 3.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                      // Directionality(
                      //   textDirection: TextDirection.rtl,
                      //   child: new Padding(
                      //     padding: const EdgeInsets.only(left: 0.0, top: 0.0),
                      //     child: new Row(
                      //       children: <Widget>[
                      //         new Icon(
                      //           Icons.location_on,
                      //           color: Colors.white,
                      //         ),
                      //         new SizedBox(
                      //           width: 3.0,
                      //         ),
                      //         new Text(
                      //           'khorasan razavi,mashhad',
                      //           style: TextStyle(
                      //               color: Colors.white,
                      //               fontSize: 12.0,
                      //               fontWeight: FontWeight.bold),
                      //         ),
                      //       ],
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ),

                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: SizeConfig.heightMultiplier * 2.5,
                        horizontal: SizeConfig.imageSizeMultiplier * 4),
                    child: new GestureDetector(
                      onTap: () {
                        print('pressed ');
                      },
                      child: new Container(
                          alignment: Alignment.center,
                          height: 20.0,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15.0)),
                          child: new Padding(
                            padding:
                                const EdgeInsets.only(top: 2.5, bottom: 2.5),
                            child: new Text(
                              'درخواست',
                              style: TextStyle(
                                  color: Color(0xff2C003E),
                                  fontSize: SizeConfig.textMultiplier * 2),
                            ),
                          )),
                    ),
                  ),
                ),
//                       new Row(
//                         children: <Widget>[
//                           // new IconButton(
//                           //     icon: Icon(
//                           //       Icons.bookmark,
//                           //       color: Colors.white,
//                           //     ),
//                           //     onPressed: () {
//                           //       print('pressed save');
//                           //     }),
// //                 new GestureDetector(
// //                   onTap: () {
// //                     print('pressed ');
// //                   },
// //                   child: new Container(
// //                       alignment: Alignment.center,
// // //                            height: 20.0,
// //                       width: 60.0,
// //                       decoration: BoxDecoration(
// //                           color: Colors.white,
// //                           borderRadius: BorderRadius.circular(15.0)),
// //                       child: new Padding(
// //                         padding: const EdgeInsets.only(top: 0.5, bottom: 0.5),
// //                         child: new Text(
// //                           'پیام',
// //                           style: TextStyle(
// //                               color: Color(0xff2C003E), fontSize: 12.0),
// //                         ),
// //                       )),
// //                 ),
//
//
//                         ],
//                       )
              ],
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
              height: SizeConfig.heightMultiplier * 28,
              color: Color(0xff2D0827),
              child: new Column(
                children: <Widget>[
                  Expanded(
                    flex: 6,
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: SizeConfig.heightMultiplier * 4,
                          bottom: SizeConfig.heightMultiplier),
                      child: new CircleAvatar(
                        child: new Image.asset('assets/image/download (4).png'),
                        backgroundColor: Colors.white,
                        maxRadius: SizeConfig.imageSizeMultiplier * 10,
                      ),
                    ),
                  ),
                  new Expanded(
                      flex: 5,
                      child: new Container(
                        margin: EdgeInsets.only(
                            top: SizeConfig.heightMultiplier * 1),
                        child: Column(
                          children: [
                            new Text(
                              widget.user.name,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: SizeConfig.heightMultiplier * 2.5,
                                  fontWeight: FontWeight.bold),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            new Text(
                              'مهندسی برق',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: SizeConfig.heightMultiplier * 1.8),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ))
                ],
              )),
        ),
      ],
    );
    // new IconButton(
    //     icon: Icon(
    //       Icons.share,
    //       color: Colors.white,
    //     ),
    //     onPressed: () {
    //       print('pressed share');
    //     }),
  }

  @override
  void initState() {
    // print(widget.profile.id+" id profile");
    _scrollController = ScrollController();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(_smoothScrollToTop);
    setState(() {
      isLoading = true;
    });
    _getData();
    super.initState();
  }

  _getData() async {
    DataUser body = await AuthenticateService.getDataUser(widget.user.id);
    setState(() {
      dataUser = body;
      // print(profile.phoneNumber+" : Phone number");
      isLoading = false;
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  _smoothScrollToTop() {
    _scrollController.animateTo(
      0,
      duration: Duration(microseconds: 300),
      curve: Curves.ease,
    );
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? new Center(
            child: new CircularProgressIndicator(),
          )
        : new Directionality(
            textDirection: TextDirection.rtl,
            child: new SafeArea(
                top: true,
                bottom: true,
                child: Scaffold(
                  // resizeToAvoidBottomInset: false,
                  body: NestedScrollView(
                    floatHeaderSlivers: true,
                    controller: _scrollController,
                    headerSliverBuilder: (context, value) {
                      return [
                        SliverToBoxAdapter(child: _head()),
                        SliverToBoxAdapter(
                          child: TabBar(
                            indicatorColor: R.color.banafshtire,
                            labelStyle: TextStyle(color: R.color.backGround1),
                            unselectedLabelColor: R.color.banafshKamRang,
                            labelColor: R.color.banafshtire,
                            unselectedLabelStyle:
                                TextStyle(color: Colors.white),
                            controller: _tabController,
                            // isScrollable: true,
                            tabs: myTabs,
                          ),
                        ),
                      ];
                    },
                    body: Container(
                      child: TabBarView(
                        controller: _tabController,
                        children: [
                          ListOne(
                            user: dataUser,
                          ),
                          ListImages(
                            user: dataUser,
                          ),
                          ListTwo(
                            user: dataUser,
                            profile: widget.profile,
                          )
                        ],
                      ),
                    ),
                  ),
                )));
  }
}

class ListOne extends StatefulWidget {
  DataUser user;

  ListOne({this.user});

  @override
  _ListOneState createState() => _ListOneState();
}

class _ListOneState extends State<ListOne> {
  @override
  Widget build(BuildContext context) {
    return new Padding(
      padding: const EdgeInsets.only(top: 0),
      child: new ListView(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Padding(
            padding: EdgeInsets.only(
                right: SizeConfig.imageSizeMultiplier * 3.5,
                top: SizeConfig.heightMultiplier * 1.5),
            child: new Text(
              'معرفی نامه',
              style: TextStyle(
                  fontSize: SizeConfig.heightMultiplier * 3,
                  fontWeight: FontWeight.bold),
            ),
          ),
          new Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.imageSizeMultiplier * 5.5,
                  vertical: SizeConfig.heightMultiplier * 1.5),
              child: widget.user.moarefiNameh == null ||
                      widget.user.moarefiNameh == ""
                  ? new Text("وارد نشده",
                      style: TextStyle(
                          fontSize: SizeConfig.heightMultiplier * 2.7))
                  : new Text(
                      widget.user.moarefiNameh,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: SizeConfig.heightMultiplier * 2.7),
                    )),
          // new Padding(
          //     padding:
          //     const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
          //     child: new Wrap(
          //       runSpacing: 8.0,
          //       spacing: 7.0,
          //       children: <Widget>[
          //         ObjectTag(
          //           tags: 'رنامه نویسی موبایل',
          //         ),
          //         ObjectTag(
          //           tags: 'ui',
          //         ),
          //         ObjectTag(
          //           tags: 'ux',
          //         ),
          //         ObjectTag(
          //           tags: 'رنامه',
          //         ),
          //         ObjectTag(
          //           tags: 'back end',
          //         ),
          //       ],
          //     )),
          Divider(),
          new Padding(
            padding: EdgeInsets.only(
                right: SizeConfig.imageSizeMultiplier * 3.5,
                top: SizeConfig.heightMultiplier * 1.5),
            child: new Text(
              'سوابق کاری',
              style: TextStyle(
                  fontSize: SizeConfig.heightMultiplier * 3,
                  fontWeight: FontWeight.bold),
            ),
          ),
          new Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.imageSizeMultiplier * 5.5,
                  vertical: SizeConfig.heightMultiplier * 1.5),
              child: widget.user.moarefiNameh == null ||
                      widget.user.moarefiNameh == ""
                  ? new Text("وارد نشده",
                      style: TextStyle(
                          fontSize: SizeConfig.heightMultiplier * 2.7))
                  : new Text(
                      widget.user.moarefiNameh,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: SizeConfig.heightMultiplier * 2.7),
                    )),
          Divider(),
          new Padding(
            padding: EdgeInsets.only(
                right: SizeConfig.imageSizeMultiplier * 3.5,
                top: SizeConfig.heightMultiplier * 1.5),
            child: new Text(
              'سوابق تحصیلی',
              style: TextStyle(
                  fontSize: SizeConfig.heightMultiplier * 3,
                  fontWeight: FontWeight.bold),
            ),
          ),
          new Padding(
            padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.imageSizeMultiplier * 5.5,
                vertical: SizeConfig.heightMultiplier * 1.5),
            child: widget.user.educational == null ||
                    widget.user.educational == ""
                ? new Text("وارد نشده",
                    style:
                        TextStyle(fontSize: SizeConfig.heightMultiplier * 2.7))
                : new Text(
                    widget.user.educational,
                    style:
                        TextStyle(fontSize: SizeConfig.heightMultiplier * 2.7),
                  ),
          ),
          Divider(),
          new Padding(
            padding: EdgeInsets.only(
                right: SizeConfig.imageSizeMultiplier * 3.5,
                top: SizeConfig.heightMultiplier * 1.5),
            child: new Text(
              'مدارک و یا گواهینامه های معتبر',
              style: TextStyle(
                  fontSize: SizeConfig.heightMultiplier * 3,
                  fontWeight: FontWeight.bold),
            ),
          ),
          new Padding(
            padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.imageSizeMultiplier * 5.5,
                vertical: SizeConfig.heightMultiplier * 1.5),
            child: widget.user.certificates == null ||
                    widget.user.certificates == ""
                ? new Text("وارد نشده",
                    style:
                        TextStyle(fontSize: SizeConfig.heightMultiplier * 2.7))
                : new Text(
                    widget.user.certificates,
                    style:
                        TextStyle(fontSize: SizeConfig.heightMultiplier * 2.7),
                  ),
          ),
          Divider(),
          new Padding(
            padding: EdgeInsets.only(
                right: SizeConfig.imageSizeMultiplier * 3.5,
                top: SizeConfig.heightMultiplier * 1.5),
            child: new Text(
              'زبان های مسلط',
              style: TextStyle(
                  fontSize: SizeConfig.heightMultiplier * 3,
                  fontWeight: FontWeight.bold),
            ),
          ),
          new Padding(
            padding: EdgeInsets.symmetric(
                horizontal: SizeConfig.imageSizeMultiplier * 5.5,
                vertical: SizeConfig.heightMultiplier * 1.5),
            child: widget.user.languages == null || widget.user.languages == ""
                ? new Text("وارد نشده",
                    style:
                        TextStyle(fontSize: SizeConfig.heightMultiplier * 2.7))
                : new Text(
                    widget.user.languages,
                    style:
                        TextStyle(fontSize: SizeConfig.heightMultiplier * 2.7),
                  ),
          ),
        ],
      ),
    );
  }
}

class ListTwo extends StatefulWidget {
  DataUser user;
  MyData profile;

  ListTwo({this.profile, this.user});

  @override
  _ListTwoState createState() => _ListTwoState();
}

class _ListTwoState extends State<ListTwo> {
  Map body;
  bool refresh = true;
  List username = [];
  ScrollController _scrollController = new ScrollController();
  List<Comment> comments = [];
  TextEditingController _controller;

  void initState() {
    // TODO: implement initState
    super.initState();
    getComments();
    _controller = new TextEditingController();
  }

  Future<void> getComments({bool refresh2: false}) async {
    if (refresh2) comments.clear();
    Map body = await HttpComments.getComments(widget.user.id);
    username = await HttpComments.getUsername(widget.user.id);
    comments = body['comments'];
    setState(() {
      refresh = false;
    });
  }

  Future<Null> onRefreshMethod() async {
    await getComments(refresh2: true);

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return new Padding(
      padding: const EdgeInsets.only(top: 0),
      child: refresh
          ? Center(
              child: Column(
              children: [
                new SizedBox(
                  height: MediaQuery.of(context).size.height * .2,
                ),
                new CircularProgressIndicator(),
              ],
            ))
          : comments.length == 0
              ? Column(
                  children: [
                    new Expanded(
                      child: RefreshIndicator(
                          onRefresh: onRefreshMethod,
                          child: Center(
                              child: new Text(
                            "نظری برای این صفحه وجود ندارد",
                            style: TextStyle(
                                fontSize: SizeConfig.textMultiplier * 2),
                          ))),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                  right: SizeConfig.imageSizeMultiplier * 3.8,
                                  left: SizeConfig.imageSizeMultiplier * 1.2,
                                  bottom: SizeConfig.heightMultiplier * 1.2),
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.075,
                                width: MediaQuery.of(context).size.width * 0.9,
                                child: new TextFormField(
                                  controller: _controller,
                                  decoration: InputDecoration(
                                      hoverColor: Colors.black,
                                      focusColor: Colors.black,
                                      errorStyle: TextStyle(),
                                      errorBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.black),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.black),
                                          borderRadius: BorderRadius.circular(
                                              SizeConfig.heightMultiplier * 5)),
                                      disabledBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.black)),
                                      suffixIcon: new IconButton(
                                        icon: Icon(
                                          Icons.send,
                                          color: Colors.blue,
                                        ),
                                        onPressed: () async {
                                          if (_controller.text != "") {
                                            await sendComment();
                                            setState(() {
                                              _controller.text = "";
                                            });
                                            getComments();
                                          }
                                        },
                                        color: Colors.black,
                                      ),
                                      hintText: "نظر خود را وارد کنید",
                                      contentPadding: EdgeInsets.only(
                                          bottom: 0.0,
                                          right:
                                              SizeConfig.imageSizeMultiplier *
                                                  2),
                                      hintStyle: TextStyle(
                                          fontSize:
                                              SizeConfig.textMultiplier * 2),
                                      border: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.black),
                                          borderRadius: BorderRadius.circular(
                                              SizeConfig.heightMultiplier *
                                                  5))),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                )
              : Column(
                  children: [
                    Expanded(
                      child: RefreshIndicator(
                        onRefresh: onRefreshMethod,
                        child: new ListView.builder(
                          controller: _scrollController,
                          itemCount: comments.length,
                          itemBuilder: (ctx, int index) {
                            return Container(
                              padding: EdgeInsets.only(
                                  right: SizeConfig.imageSizeMultiplier * 2.5),
                              margin: EdgeInsets.only(
                                  top: SizeConfig.heightMultiplier * 1.1,
                                  bottom: SizeConfig.heightMultiplier * 0.7),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            new CircleAvatar(
                                              maxRadius: SizeConfig
                                                      .imageSizeMultiplier *
                                                  5,
                                              backgroundColor:
                                                  R.color.banafshKamRang,
                                            ),
                                            new SizedBox(
                                              width: SizeConfig
                                                      .imageSizeMultiplier *
                                                  2,
                                            ),
                                            new Text(
                                              username[index],
                                              style: TextStyle(
                                                  fontSize: SizeConfig
                                                          .heightMultiplier *
                                                      2.3),
                                            ),
                                          ],
                                        ),
                                        new Row(
                                          children: [
                                            new Padding(
                                              padding: EdgeInsets.only(
                                                  left: SizeConfig
                                                          .imageSizeMultiplier *
                                                      2),
                                              child: new Text(
                                                textTime(comments[index].date),
                                                style: TextStyle(
                                                    fontSize: SizeConfig
                                                            .heightMultiplier *
                                                        1.4),
                                              ),
                                            )
                                          ],
                                        )
                                      ]),
                                  Row(
                                    children: [
                                      new SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.13,
                                      ),
                                      Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.8,
                                          child: new Text(
                                              comments[index].comment_text,
                                              maxLines: null,
                                              style: TextStyle(
                                                  fontSize: SizeConfig
                                                          .heightMultiplier *
                                                      1.9))),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                  right: SizeConfig.imageSizeMultiplier * 3.8,
                                  left: SizeConfig.imageSizeMultiplier * 1.2,
                                  bottom: SizeConfig.heightMultiplier * 1.2,
                                  top: 2.0),
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.075,
                                width: MediaQuery.of(context).size.width * 0.9,
                                child: new TextFormField(
                                  controller: _controller,
                                  decoration: InputDecoration(
                                      hoverColor: Colors.black,
                                      focusColor: Colors.black,
                                      errorStyle: TextStyle(),
                                      errorBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.black),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.black),
                                          borderRadius: BorderRadius.circular(
                                              SizeConfig.heightMultiplier * 5)),
                                      disabledBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.black)),
                                      suffixIcon: new IconButton(
                                        icon: Icon(
                                          Icons.send,
                                          color: Colors.blue,
                                        ),
                                        onPressed: () async {
                                          if (_controller.text != "") {
                                            await sendComment();
                                            setState(() {
                                              _controller.text = "";
                                            });
                                            getComments();
                                            setState(() {
                                              SchedulerBinding.instance
                                                  .addPostFrameCallback((_) =>
                                                      _scrollController.animateTo(
                                                          _scrollController
                                                              .position
                                                              .maxScrollExtent,
                                                          duration: Duration(
                                                              milliseconds: 1),
                                                          curve:
                                                              Curves.easeOut));
                                            });
                                          }
                                        },
                                        color: Colors.black,
                                      ),
                                      hintText: "نظر خود را وارد کنید",
                                      contentPadding: EdgeInsets.only(
                                          bottom: 0.0,
                                          right:
                                              SizeConfig.imageSizeMultiplier *
                                                  2),
                                      hintStyle: TextStyle(
                                          fontSize:
                                              SizeConfig.textMultiplier * 2),
                                      border: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.black),
                                          borderRadius: BorderRadius.circular(
                                              SizeConfig.heightMultiplier *
                                                  5))),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
    );
  }

  sendComment() async {
    body = await HttpComments.sendComment({
      "user_id": widget.user.id,
      "user_comment": widget.profile.id,
      "comment_text": _controller.text,
      "date": "${DateTime.now()}",
    });
  }
}

// class ObjectTag extends StatelessWidget {
//   final String tags;
//
//   const ObjectTag({this.tags});
//   @override
//   Widget build(BuildContext context) {
//     return new Container(
//         height: 20.0,
//
//         decoration: BoxDecoration(
//             color: Color(0xff2D0827),
//             shape: BoxShape.rectangle,
//             borderRadius: BorderRadius.circular(15.0)),
//         child:new Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 6.0,vertical: 3.0),
//           child: new Text(tags,style: new TextStyle(color: Colors.white,fontSize: 10.0,),),
//         ));
//   }
// }
class ListImages extends StatefulWidget {
  DataUser user;

  ListImages({this.user});

  @override
  _ListImagesState createState() => _ListImagesState();
}

class _ListImagesState extends State<ListImages> {
  int current = 0;

  List imglist = [];
  Map res;
  var rand;
  bool isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getImages();
  }

  _getImages() async {
    setState(() {
      isLoading = true;
    });
    var response = await RequestHttp.getImages(widget.user.id);
    // print(response);
    setState(() {
      imglist.addAll(response);
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Center(child: new CircularProgressIndicator())
        : imglist.length != 0 ?
    new GridView.builder(
        gridDelegate:
        SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemCount: imglist.length,
        itemBuilder: (context, index) => new GestureDetector(
            onTap: () {
              _showSecondPage(context, imglist[index]);
            },
            child: new Container(
              margin: const EdgeInsets.fromLTRB(2, 0, 2, 4),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                          "http://stube.ir/image/${imglist[index]}"),
                      fit: BoxFit.cover)),
            )))
    : new Center(child: new Text('عکسی برای نمایش وجود ندارد'),)
    ;
  }
}

void _showSecondPage(BuildContext context, imageAddres) {
  Navigator.of(context).push(MaterialPageRoute(
      builder: (cntx) => Scaffold(
            body: new Center(
              child: new Hero(
                tag: 'my-hero-animation-tag',
                child: Image.asset(imageAddres),
              ),
            ),
          )));
}
