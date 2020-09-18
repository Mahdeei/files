import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:image/image.dart' as Img;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:stubbbb/Models/Comment.dart';
import 'package:stubbbb/Models/Profile.dart';
import 'package:stubbbb/Models/myData.dart';
import 'package:stubbbb/Other/R.dart';
import 'package:stubbbb/Other/widget.dart';
import 'package:stubbbb/http/Authenticate.dart';
import 'package:stubbbb/http/httpComments.dart';
import 'package:stubbbb/http/httpRequest.dart';
import 'editData.dart';
import 'package:http/http.dart' as http;
import 'package:async/async.dart';
import 'dart:async';
import 'package:path/path.dart';

class MyProfileStudentScreen extends StatefulWidget {
  String id;

  MyProfileStudentScreen({
    this.id,
  });

  @override
  _MyProfileStudentScreenState createState() => _MyProfileStudentScreenState();
}

class _MyProfileStudentScreenState extends State<MyProfileStudentScreen>
    with SingleTickerProviderStateMixin {
  final bodyGlobalKey = GlobalKey();
  final List<Widget> myTabs = [
    Tab(text: 'مشخصات'),
    Tab(
      text: 'نمونه کارها',
    ),
    Tab(text: 'نظرات'),
  ];

  TabController _tabController;
  ScrollController _scrollController;
  MyData profile;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    // print(widget.profile.id+" id profile");
    _getMyData();
    _scrollController = ScrollController();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(_smoothScrollToTop);
    setState(() {

    });

  }

  _getMyData() async {
    MyData body = await AuthenticateService.getMyData(widget.id);
    setState(() {
      profile = body;
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

  Widget _head(context) {
    return new Stack(
      children: <Widget>[
        new Container(
          height: MediaQuery.of(context).size.height * 0.28,
          width: MediaQuery.of(context).size.width,
          color: Color(0xff44143E),
        ),
        // new IconButton(
        //     icon: Icon(
        //       Icons.share,
        //       color: Colors.white,
        //     ),
        //     onPressed: () {
        //       print('pressed share');
        //     }),
        new Column(
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
                          profile.username,
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
                // new IconButton(
                //     icon: Icon(
                //       Icons.bookmark,
                //       color: Colors.white,
                //     ),
                //     onPressed: () {
                //       print('pressed save');
                //     }),
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
                new SizedBox(
                  width: 3.0,
                ),
                new GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(new MaterialPageRoute(
                        builder: (context) => new EditData(
                              profile: profile,
                            )));
                    print(profile.phoneNumber);
                    print(" : Phone number");
                  },
                  child: new Container(
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width*.4,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15.0)),
                      child: new Padding(
                        padding: const EdgeInsets.only(top: 2.5, bottom: 2.5),
                        child: new Text(
                          'تغییر پروفایل',
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
                    profile.image=="" || profile.image==null
                        ?new CircleAvatar(
                          child: new Icon(Icons.person,color: Colors.grey,size: MediaQuery.of(context).size.width*0.1,),
                          backgroundColor: Colors.white,
                          minRadius: 40.0,
                        )
                        : new CircleAvatar(
                      backgroundImage: new NetworkImage('http://stube.ir/image/${profile.image}'),
                      maxRadius: 40.0,
                    ),
                    new SizedBox(
                      height: 5.0,
                    ),
                    new Text(
                      profile.name,
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
  Widget build(BuildContext context) {
    return new Directionality(
        textDirection: TextDirection.rtl,
        child: new SafeArea(
            top: true,
            bottom: true,
            child: isLoading
                ? new Scaffold(
                    body: Center(
                      child: CircularProgressIndicator(),
                    ),
                  )
                : Scaffold(
                    // resizeToAvoidBottomInset: false,
                    body: NestedScrollView(
                      floatHeaderSlivers: true,
                      controller: _scrollController,
                      headerSliverBuilder: (context, value) {
                        return [
                          SliverToBoxAdapter(child: _head(context)),
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
                              profile: profile,
                            ),
                            ListImages(
                              profile: profile,
                            ),
                            ListTwo(
                              profile: profile,
                            )
                          ],
                        ),
                      ),
                    ),
                  )));
  }
}

class ListOne extends StatefulWidget {
  MyData profile;

  ListOne({this.profile});

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
            padding: const EdgeInsets.only(right: 15.0, left: 15.0, top: 10.0),
            child: new Text(
              'معرفی نامه',
              style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
            ),
          ),
          new Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            child: new Text(
              widget.profile.moarefiNameh,
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
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            child: new Text(
              FieldText(widget.profile.resumes),
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
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            child: new Text(
              FieldText(widget.profile.educational),
              style:
                  TextStyle(fontSize: MediaQuery.of(context).size.width * 0.05),
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
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            child: new Text(
              FieldText(widget.profile.certificates),
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
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            child: new Text(
              FieldText(widget.profile.languages),
              style: TextStyle(fontSize: 16.0),
            ),
          ),
        ],
      ),
    );
  }
}

class ListTwo extends StatefulWidget {
  MyData profile;

  ListTwo({
    this.profile,
  });

  @override
  _ListTwoState createState() => _ListTwoState();
}

List<Profile> profile;

class _ListTwoState extends State<ListTwo> with AutomaticKeepAliveClientMixin<ListTwo> {
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
    Map body = await HttpComments.getComments(widget.profile.id);
    username = await HttpComments.getUsername(widget.profile.id);
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
                                child:
                                    new Text("نظری برای این صفحه وجود ندارد"))),
                      ),
                      // Column(
                      //   mainAxisAlignment: MainAxisAlignment.end,
                      //   children: [
                      //     Row(
                      //       children: [
                      //         Padding(
                      //           padding: const EdgeInsets.only(right: 15.0,left: 5.0,bottom: 5.0),
                      //           child: Container(
                      //             height: MediaQuery.of(context).size.height * 0.075,
                      //             width: MediaQuery.of(context).size.width * 0.9,
                      //             child: new TextFormField(
                      //               controller: _controller,
                      //               decoration: InputDecoration(
                      //                   hoverColor: Colors.black,
                      //                   focusColor: Colors.black,
                      //                   errorStyle: TextStyle(),
                      //                   errorBorder: OutlineInputBorder(
                      //                     borderSide: BorderSide(color: Colors.black),
                      //                   ),
                      //                   focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black),
                      //                       borderRadius: BorderRadius.circular(35.0)),
                      //                   disabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                      //                   suffixIcon: new IconButton(
                      //                     icon: Icon(Icons.send,color: Colors.blue,),
                      //                     onPressed: ()async{
                      //                       if(_controller.text!=""){
                      //                         await sendComment();
                      //                         setState(() {
                      //                           _controller.text = "";
                      //                         });
                      //                         getComments();
                      //                         setState(() {
                      //                           SchedulerBinding.instance.addPostFrameCallback((_) => _scrollController.animateTo(_scrollController.position.maxScrollExtent, duration: Duration(milliseconds: 1), curve: Curves.easeOut));
                      //                         });
                      //                       }
                      //
                      //                     },
                      //                     color: Colors.black,),
                      //                   hintText: "نظر خود را وارد کنید",
                      //                   contentPadding: EdgeInsets.only(bottom: 0.0,right: 7.0),
                      //                   hintStyle: TextStyle(fontSize: 15),
                      //                   border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black),
                      //                       borderRadius: BorderRadius.circular(35.0))
                      //               ),
                      //             ),
                      //           ),
                      //         ),
                      //       ],
                      //     ),
                      //   ],
                      // ),
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
                                  padding: EdgeInsets.only(right: 10),
                                  margin:
                                      const EdgeInsets.only(top: 8, bottom: 4),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            new Row(
                                              children: [
                                                new CircleAvatar(
                                                  maxRadius: 20,
                                                  backgroundColor:
                                                      R.color.banafshKamRang,
                                                ),
                                                new SizedBox(
                                                  width: 10,
                                                ),
                                                new Text(username[index]),
                                              ],
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 8.0),
                                              child: new Text(
                                                textTime(comments[index].date),
                                                style: TextStyle(
                                                    fontSize: 10.0,
                                                    fontWeight:
                                                        FontWeight.w300),
                                              ),
                                            )
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            new SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
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
                                                )),
                                          ],
                                        ),
                                      ]));
                            },
                          ),
                        ),
                      ),
                      // Column(
                      //   mainAxisAlignment: MainAxisAlignment.end,
                      //   children: [
                      //     Row(
                      //       children: [
                      //         Padding(
                      //           padding: const EdgeInsets.only(right: 15.0,left: 5.0,bottom: 5.0,top:2.0),
                      //           child: Container(
                      //             height: MediaQuery.of(context).size.height * 0.075,
                      //             width: MediaQuery.of(context).size.width * 0.9,
                      //             child: new TextFormField(
                      //               controller: _controller,
                      //               decoration: InputDecoration(
                      //                   hoverColor: Colors.black,
                      //                   focusColor: Colors.black,
                      //                   errorStyle: TextStyle(),
                      //                   errorBorder: OutlineInputBorder(
                      //                     borderSide: BorderSide(color: Colors.black),
                      //                   ),
                      //                   focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black),
                      //                       borderRadius: BorderRadius.circular(35.0)),
                      //                   disabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                      //                   suffixIcon: new IconButton(
                      //                     icon: Icon(Icons.send,color: Colors.blue,),
                      //                     onPressed: ()async{
                      //                       if(_controller.text!=""){
                      //                         await sendComment();
                      //                         setState(() {
                      //                           _controller.text = "";
                      //                         });
                      //                         getComments();
                      //                         setState(() {
                      //                           SchedulerBinding.instance.addPostFrameCallback((_) => _scrollController.animateTo(_scrollController.position.maxScrollExtent, duration: Duration(milliseconds: 1), curve: Curves.easeOut));
                      //                         });
                      //                       }
                      //
                      //                     },
                      //                     color: Colors.black,),
                      //                   hintText: "نظر خود را وارد کنید",
                      //                   contentPadding: EdgeInsets.only(bottom: 0.0,right: 7.0),
                      //                   hintStyle: TextStyle(fontSize: 15),
                      //                   border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black),
                      //                       borderRadius: BorderRadius.circular(35.0))
                      //               ),
                      //             ),
                      //           ),
                      //         ),
                      //       ],
                      //     ),
                      //   ],
                    ],
                  ));
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
//   sendComment()async{
//     body = await HttpComments.sendComment({
//       "user_id": widget.user.id,
//       "user_comment":widget.profile.id,
//       "comment_text": _controller.text,
//       "date":"${DateTime.now()}",
//     });
//
//   }
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

class ListImages extends StatefulWidget {
  MyData profile;

  ListImages({this.profile});

  @override
  _ListImagesState createState() => _ListImagesState();
}

class _ListImagesState extends State<ListImages> with AutomaticKeepAliveClientMixin<ListImages>{
  int current = 0;

  List imglist = [];
  Map res;
  File _image;
  var picker = new ImagePicker();
  var rand;
  var fileName = "";
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
    var response = await RequestHttp.getImages(widget.profile.id);
    // print(response);
    setState(() {
      imglist.addAll(response);
      isLoading = false;
    });
  }


  Future pickImage(ImageSource imageSource) async {
    var imageFile = await picker.getImage(source: imageSource);
    if (imageFile != null) {
      File file = File(imageFile.path);

      File croppedFile = await ImageCropper.cropImage(
        sourcePath: file.path,
        maxWidth: 512,
        maxHeight: 512,
        aspectRatio: CropAspectRatio(ratioX: 1.0, ratioY: 1.0),
      );

      final tempDir = await getTemporaryDirectory();
      final path = tempDir.path;
      Img.Image image = Img.decodeImage(croppedFile.readAsBytesSync());
      Img.Image smallerImg = Img.copyResize(image, width: 500);

      this.rand = new Random().nextInt(100000000).toString() +
          new Random().nextInt(10000000).toString() +
          new Random().nextInt(10000000).toString();
      this.fileName =
          "image_${widget.profile.id}_${widget.profile.username}_Student_$rand.jpg";
      var compressImg = new File("$path/$fileName")
        ..writeAsBytesSync(Img.encodeJpg(smallerImg, quality: 85));

      setState(() {
        this._image = compressImg;
        upload(_image);
      });
    }
  }

  Future upload(File imageFile) async {
    var stream =
    new http.ByteStream(DelegatingStream.typed(imageFile.openRead()));
    var length = await imageFile.length();
    var uri = Uri.parse("http://stube.ir/uploadImageStudent.php");

    var request = new http.MultipartRequest("POST", uri);

    var multiPartFile = new http.MultipartFile("image", stream, length,
        filename: basename(imageFile.path));

    print(widget.profile.id is int);
    print(this.fileName);
    request.fields['user_id'] = widget.profile.id;
    request.fields['image'] = this.fileName;

    request.files.add(multiPartFile);
    var response = await request.send();
    // print(response);
    // print(json.decode(response.stream.toString()));
    // var responseBody = json.decode(response.headers);

//    print(stream);
//    print(length);
//    print(uri);
//    print(request);
    print(response.statusCode);

    await response.stream.transform(utf8.decoder).listen((value) {
      res = json.decode(value);
      print(res);
      print(res['status']);
    });
    if (response.statusCode == 200) {
      print('upload seccess');
      setState(() {
        imglist.clear();
      });
      _getImages();
    } else {
      print('upload failed');
    }
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Center(child: new CircularProgressIndicator())
        : new GridView.builder(
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
            itemCount: imglist.length >= 6 ? 6 : imglist.length + 1,
            itemBuilder: (context, index) => imglist.length == 6
                ? new GestureDetector(
                    onTap: () {
                      _showSecondPage(context, imglist[index]);
                    },
                    child: new Container(
                      margin: const EdgeInsets.fromLTRB(2, 0, 2, 4),
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(imglist[index]),
                              fit: BoxFit.cover)),
                    ))
                : index == imglist.length
                    ? Container(
                        padding: EdgeInsets.only(bottom: 10.0, right: 15.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            new IconButton(
                              icon: Icon(
                                Icons.add_circle_outline,
                                size: 65.0,
                              ),
                              onPressed: () async {
                                showDialog(
                                  context: context,
                                  builder: (context) => new AlertDialog(
                                    title: new Text(
                                      "انتخاب فایل از",
                                      style: TextStyle(fontSize: 16.0),
                                      textDirection: TextDirection.rtl,
                                    ),
                                    actions: [
                                      Column(
                                        children: [
                                          Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            child: new MaterialButton(
                                              elevation: 0,
                                              color: Colors.white,
                                              child: new Text("گالری"),
                                              onPressed: () async {
                                                Navigator.of(context).pop();
                                                await pickImage(
                                                    ImageSource.gallery);
                                              },
                                            ),
                                          ),
                                          new Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            child: new MaterialButton(
                                              elevation: 0,
                                              color: Colors.white,
                                              child: new Text("دوربین گوشی"),
                                              onPressed: () async {
                                                await pickImage(
                                                    ImageSource.camera);
                                                Navigator.of(context).pop();
                                              },
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                            new Text(
                              "اضافه کردن عکس",
                              style: TextStyle(fontSize: 12.0),
                            )
                          ],
                        ),
                      )
                    : new GestureDetector(
                        onTap: () {
                          _showSecondPage(context,
                              "http://stube.ir/image/${imglist[index]}");
                        },
                        child: new Container(
                          margin: const EdgeInsets.fromLTRB(2, 0, 2, 4),
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(
                                      "http://stube.ir/image/${imglist[index]}"),
                                  fit: BoxFit.cover)),
                        )));
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}

void _showSecondPage(BuildContext context, imageAddres) {
  Navigator.of(context).push(MaterialPageRoute(
      builder: (cntx) => Scaffold(
            body: new Center(
              child: new Hero(
                tag: 'my-hero-animation-tag',
                child: Image.network(imageAddres),
              ),
            ),
          )));
}
