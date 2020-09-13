import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stubbbb/Models/Comment.dart';
import 'package:stubbbb/Models/Profile.dart';
import 'package:stubbbb/Models/profileModels.dart';
import 'package:stubbbb/Other/R.dart';
import 'package:stubbbb/http/httpComments.dart';
import 'package:flutter/scheduler.dart';



class ProPage extends StatefulWidget {
  User user;
  Profile profile;
  ProPage({this.profile,this.user});

  @override
  _ProPageState createState() => _ProPageState();
}



class _ProPageState extends State<ProPage> with SingleTickerProviderStateMixin {
  final bodyGlobalKey = GlobalKey();
  final List<Widget> myTabs = [
    Tab(text: 'مشخصات'),
    Tab(text: 'نظرات'),
    Tab(text: 'نمونه کارها',)
  ];
  TabController _tabController;
  ScrollController _scrollController;

  Widget _head() {
    return new Stack(
      children: <Widget>[
        new Container(
          height: MediaQuery.of(context).size.height * 0.28,
          width: MediaQuery.of(context).size.width,
          color: Color(0xff44143E),
        ),
        new IconButton(
            icon: Icon(
              Icons.share,
              color: Colors.white,
            ),
            onPressed: () {
              print('pressed share');
            }),
        new Column(
//                    mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Directionality(
              textDirection: TextDirection.ltr,
              child: new Column(
                children: <Widget>[
                  new Padding(
                    padding: const EdgeInsets.only(left: 200.0, top: 60.0),
                    child: new Row(
                      children: <Widget>[
                        new Icon(
                          Icons.school,
                          color: Colors.white,
                        ),
                        new SizedBox(
                          width: 3.0,
                        ),
                        new Text(
                          widget.user.username,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  new Padding(
                    padding: const EdgeInsets.only(left: 200.0, top: 20.0),
                    child: new Row(
                      children: <Widget>[
                        new Icon(
                          Icons.location_on,
                          color: Colors.white,
                        ),
                        new SizedBox(
                          width: 3.0,
                        ),
                        new Text(
                          'khorasan razavi,mashhad',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 12.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            new SizedBox(height: 15.0),
            new Row(
              children: <Widget>[
                new IconButton(
                    icon: Icon(
                      Icons.bookmark,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      print('pressed save');
                    }),
//                 new GestureDetector(
//                   onTap: () {
//                     print('pressed ');
//                   },
//                   child: new Container(
//                       alignment: Alignment.center,
// //                            height: 20.0,
//                       width: 60.0,
//                       decoration: BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.circular(15.0)),
//                       child: new Padding(
//                         padding: const EdgeInsets.only(top: 0.5, bottom: 0.5),
//                         child: new Text(
//                           'پیام',
//                           style: TextStyle(
//                               color: Color(0xff2C003E), fontSize: 12.0),
//                         ),
//                       )),
//                 ),
                new SizedBox(width: 3.0,),
                new GestureDetector(
                  onTap: () {
                    print('pressed ');
                  },
                  child: new Container(
                      alignment: Alignment.center,
//                            height: 20.0,
                      width: 120.0,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15.0)),
                      child: new Padding(
                        padding: const EdgeInsets.only(top: 2.5, bottom: 2.5),
                        child: new Text(
                          'درخواست',
                          style: TextStyle(
                              color: Color(0xff2C003E), fontSize: 15.0),
                        ),
                      )),
                ),
              ],
            )
          ],
        ),
        new Align(
          alignment: Alignment.centerLeft,
          child: new ClipPath(
            child: Container(
                height: MediaQuery.of(context).size.height * 0.28,
                width: MediaQuery.of(context).size.width * 0.5,
                color: Color(0xff2D0827),
                child: new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    new CircleAvatar(
                      child: new Image.asset('assets/image/download (4).png'),
                      backgroundColor: Colors.white,
                      maxRadius: 40.0,
                    ),
                    new SizedBox(
                      height: 5.0,
                    ),
                    new Text(
                      widget.user.name,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    new Text(
                      'مهندسی برق',
                      style: TextStyle(
                        color: Color(0xff44143E),
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                )),
          ),
        )
      ],
    );
  }


  @override
  void initState() {
    // print(widget.profile.id+" id profile");
    _scrollController = ScrollController();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(_smoothScrollToTop);

    super.initState();
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
    return new Directionality(textDirection: TextDirection.rtl,
        child: new SafeArea(top: true,
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
                        unselectedLabelStyle: TextStyle(color: Colors.white),
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
                    children: [ListOne(user: widget.user,), ListTwo(user: widget.user,profile: widget.profile,),ListImages(user: widget.user,)],
                  ),
                ),
              ),
            )));
  }
}


class ListOne extends StatefulWidget {
  User user;
  ListOne({this.user});
  @override
  _ListOneState createState() => _ListOneState();
}

class _ListOneState extends State<ListOne> {
  @override
  Widget build(BuildContext context) {
    return new Padding(padding: const EdgeInsets.only(top: 0),
      child: new ListView(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Padding(
            padding: const EdgeInsets.only(right: 15.0, left: 15.0, top: 10.0),
            child: new Text(
              'معرفی نامه',
              style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
            ),
          ),
          new Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            child: new Text(
              widget.user.moarefinameh,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ),
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
          new Padding(
            padding: const EdgeInsets.only(right: 15.0, left: 15.0, top: 0.0),
            child: new Text(
              'سوابق کاری',
              style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
            ),
          ),
          new Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            child: new Text(
              'به مدت دوسال با شرکت ایران کُد همکاری میکردم ، نزدیک به 30 تا پروژه موفق داشتم.عضو تیم طراحان اپلیکیشن های بایو، کیهان، مرداب و شهر به شهر بوده ام.بنیان گذار و طراح و برنامه نویس اپلیکیشن استیوب هم هستم ',
              style: TextStyle(fontSize: 16.0),
            ),
          ),
          Divider(),
          new Padding(
            padding: const EdgeInsets.only(right: 15.0, left: 15.0, top: 10.0),
            child: new Text(
              'سوابق تحصیلی',
              style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
            ),
          ),
          new Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            child: new Text(
              'بنده در مقطع کارشناسی رشته مهندسی برق در حال تحصیل می باشم.',
              style: TextStyle(fontSize: 16.0),
            ),
          ),
          Divider(),
          new Padding(
            padding: const EdgeInsets.only(right: 15.0, left: 15.0, top: 10.0),
            child: new Text(
              'مدارک و یا گواهینامه های معتبر',
              style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
            ),
          ),
          new Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            child: new Text(
              'مدرک فنی حرفه ای الکترونیک رو هم دارم .دارای مدرک الپیک دو و مدرک تافل میباشم.',
              style: TextStyle(fontSize: 16.0),
            ),
          ),
          Divider(),
          new Padding(
            padding: const EdgeInsets.only(right: 15.0, left: 15.0, top: 10.0),
            child: new Text(
              'زبان های مسلط',
              style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
            ),
          ),
          new Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            child: new Text(
              'فارسی، عربی، انگلیسی و ترکی',
              style: TextStyle(fontSize: 16.0),
            ),
          ),
        ],
      ),);
  }
}

class ListTwo extends StatefulWidget {
  User user;
  Profile profile;
  ListTwo({this.profile,this.user});

  @override
  _ListTwoState createState() => _ListTwoState();
}
List<Profile> profile;

class _ListTwoState extends State<ListTwo> {
  Map body;
  bool refresh= true;
  List username=[];
  ScrollController _scrollController = new ScrollController();
  List<Comment> comments = [];
  TextEditingController _controller;
  void initState() {
    // TODO: implement initState
    super.initState();

    getComments();
    _controller = new TextEditingController();
  }

  Future<void> getComments({bool refresh2 : false}) async {
    if(refresh2) comments.clear();
    Map body = await HttpComments.getComments(widget.user.id);
    username = await HttpComments.getUsername(widget.user.id);
    comments = body['comments'];
    setState(() {
      refresh = false;
    });
  }

  Future<Null> onRefreshMethod()async{

    await getComments(refresh2: true);

    return null;
  }
  
  @override
  Widget build(BuildContext context) {
    return new Padding(padding: const EdgeInsets.only(top: 0),
      child: refresh
              ? Center(child: Column(
                children: [
                  new SizedBox(height: MediaQuery.of(context).size.height *.2,),
                  new CircularProgressIndicator(),
                ],
              ))
              : comments.length ==0
                ? Column(
                  children: [
                    new Expanded(child: RefreshIndicator(
                        onRefresh: onRefreshMethod,
                        child: Center(child: new Text("نظری برای این صفحه وجود ندارد"))),),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 15.0,left: 5.0,bottom: 5.0),
                              child: Container(
                                height: MediaQuery.of(context).size.height * 0.075,
                                width: MediaQuery.of(context).size.width * 0.9,
                                child: new TextFormField(
                                  controller: _controller,
                                  decoration: InputDecoration(
                                      hoverColor: Colors.black,
                                      focusColor: Colors.black,
                                      errorStyle: TextStyle(),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(color: Colors.black),
                                      ),
                                      focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black),
                                          borderRadius: BorderRadius.circular(35.0)),
                                      disabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                                      suffixIcon: new IconButton(
                                        icon: Icon(Icons.send,color: Colors.blue,),
                                        onPressed: ()async{
                                          if(_controller.text!=""){
                                            await sendComment();
                                            setState(() {
                                              _controller.text = "";
                                            });
                                            getComments();
                                            setState(() {
                                              SchedulerBinding.instance.addPostFrameCallback((_) => _scrollController.animateTo(_scrollController.position.maxScrollExtent, duration: Duration(milliseconds: 1), curve: Curves.easeOut));
                                            });
                                          }

                                        },
                                        color: Colors.black,),
                                      hintText: "نظر خود را وارد کنید",
                                      contentPadding: EdgeInsets.only(bottom: 0.0,right: 7.0),
                                      hintStyle: TextStyle(fontSize: 15),
                                      border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black),
                                          borderRadius: BorderRadius.circular(35.0))
                                  ),
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
                          itemBuilder: (ctx , int index) {
                            return Container(
                              padding: EdgeInsets.only(right: 10),
                              margin: const EdgeInsets.only(top: 8,bottom: 4),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                    children: [
                                    new CircleAvatar(maxRadius: 20,backgroundColor: R.color.banafshKamRang,),
                                        new SizedBox(width: 10,),
                                        new Text(username[index]), ]),
                                           Row(
                                             children: [
                                               new SizedBox(width: MediaQuery.of(context).size.width*0.13,),
                                               new Text(comments[index].comment_text),
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
                                  padding: const EdgeInsets.only(right: 15.0,left: 5.0,bottom: 5.0,top:2.0),
                                  child: Container(
                                    height: MediaQuery.of(context).size.height * 0.075,
                                    width: MediaQuery.of(context).size.width * 0.9,
                                    child: new TextFormField(
                                      controller: _controller,
                                      decoration: InputDecoration(
                                          hoverColor: Colors.black,
                                          focusColor: Colors.black,
                                          errorStyle: TextStyle(),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(color: Colors.black),
                                          ),
                                          focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black),
                                              borderRadius: BorderRadius.circular(35.0)),
                                          disabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                                          suffixIcon: new IconButton(
                                            icon: Icon(Icons.send,color: Colors.blue,),
                                            onPressed: ()async{
                                              if(_controller.text!=""){
                                                await sendComment();
                                                setState(() {
                                                  _controller.text = "";
                                                });
                                                getComments();
                                                setState(() {
                                                  SchedulerBinding.instance.addPostFrameCallback((_) => _scrollController.animateTo(_scrollController.position.maxScrollExtent, duration: Duration(milliseconds: 1), curve: Curves.easeOut));
                                                });
                                              }

                                            },
                                            color: Colors.black,),
                                          hintText: "نظر خود را وارد کنید",
                                          contentPadding: EdgeInsets.only(bottom: 0.0,right: 7.0),
                                          hintStyle: TextStyle(fontSize: 15),
                                          border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black),
                                              borderRadius: BorderRadius.circular(35.0))
                                      ),
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
  sendComment()async{
    body = await HttpComments.sendComment({
      "user_id": widget.user.id,
      "user_comment":widget.profile.id,
      "comment_text": _controller.text,
      "date":"${DateTime.now()}",
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
class ListImages extends StatefulWidget {
  User user;
  ListImages({this.user});
  @override
  _ListImagesState createState() => _ListImagesState();
}

class _ListImagesState extends State<ListImages> {
  int current = 0;

  List imglist = [
    'assets/image/undraw_folder_files_nweq.png',
    'assets/image/dev.jpg',
    'assets/image/avt.jpg',
    'assets/image/Startup life-rafiki (2).png'
  ];

  @override
  Widget build(BuildContext context) {
    return new GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),itemCount: imglist.length, itemBuilder: (context, index)=>
    new GestureDetector(
        onTap:  () {
          _showSecondPage(context, imglist[index]);
        },
        child : new Container(
          margin: const EdgeInsets.fromLTRB(2, 0, 2, 4),
          decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage(imglist[index]),fit: BoxFit.cover)
          ),
        )));
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