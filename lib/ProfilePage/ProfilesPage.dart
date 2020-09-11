// import 'package:flutter/material.dart';
// import 'package:stubbbb/Models/profileModels.dart';
// import 'package:stubbbb/Other/R.dart';
// import 'package:stubbbb/Other/widget.dart';
// import 'package:stubbbb/StudentPage/ListStudents.dart';
// import 'package:stubbbb/http/httpProfiles.dart';
// import 'package:stubbbb/http/maxID.dart';
//
//
// class ProfilesPages extends StatefulWidget {
//   @override
//   _ProfilesPagesState createState() => _ProfilesPagesState();
// }
//
// class _ProfilesPagesState extends State<ProfilesPages> {
//
//   ScrollController scrollController = ScrollController();
//   List<User> _profiles = [];
//   bool isLoading = false;
//   int i = 10;
//   List<User> models;
//   Map body=new Map();
//   int firstid,lastid;
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     getId();
//     scrollController.addListener(() {
//       double maxscrol = scrollController.position.maxScrollExtent;
//       double currscrol = scrollController.position.pixels;
//     if (maxscrol - currscrol >= 200) {
//       getDataAgain();
//     }});
//     _getProfiles();
//
//   }
//    getId() async {
//     lastid = await ReceiveMaxid.getId();
//     setState(() {
//       firstid = lastid-10;
//     });
//   }
//   getDataAgain(){
//     setState(() {
//       firstid=firstid-10;
//       lastid=lastid-10;
//     });
//   }
//
//
//
//   _getProfiles() async {
//     var response = await ProfileHttp.getData({'firstid':firstid,'lastid':lastid});
//     setState(() {
//       _profiles.addAll(response['profiles']);
//     });
//      setState(() {
//         isLoading = true;
//       });
//     print(_profiles);
//   }
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     return new MaterialApp(
//         theme: ThemeData(primaryIconTheme: IconThemeData(color: R.color.banafshmain)),
//         debugShowCheckedModeBanner: false,
//         home: new SafeArea(
//           top: true,
//           bottom: true,
//           child: new Directionality(
//             textDirection: TextDirection.rtl,
//             child: new Scaffold(
//                 drawer: DrawerLists(),
//                 appBar: appBarProfileScreen(),
//                 body: isLoading
//                     ? new ListView.builder(
//                         itemCount: _profiles.length,
//                         itemBuilder: (BuildContext context, int index) =>
//                             ListProfiles(model: _profiles[index]),
//                       )
//                     : new Center(
//                         child: new CircularProgressIndicator(),
//                       )),
//           ),
//         ));
//   }
//
// }
//
