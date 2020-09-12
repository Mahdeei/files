// import 'package:flutter/material.dart';
// import 'package:stubbbb/Models/AgahiModel.dart';
// import 'package:stubbbb/Models/Profile.dart';
// import 'package:stubbbb/Other/widget.dart';
// import 'package:stubbbb/http/httpAdvertisings.dart';
// import 'package:stubbbb/http/maxID.dart';
// import 'AgahPage.dart';
//
//
// class Adver extends StatefulWidget {
//   @override
//   _AdverState createState() => _AdverState();
// }
//
// class _AdverState extends State<Adver> {
//   @override
//   Widget build(BuildContext context) {
//     return new Directionality(
//         textDirection: TextDirection.rtl,
//         child: new SafeArea(
//           child: new Scaffold(
//              // floatingActionButton: floatingActionButtonAgahiScreen(context),
//               backgroundColor: Color(0xfff2f3f8),
//               drawer: DrawerLists(),
//               body:RefreshIndicator(
//                 onRefresh: refreshList,
//                 child: Center(child: new Text('asf')),
//               )
//     )));
//   }
//   Future<Null> refreshList() async{
//     setState(() {
//       // onRefresh=true;
//     });
//     // await getId();
//     return null;
//   }
//
// }
//
//
// class ProjectsListTwo extends StatefulWidget {
//   @override
//   _ProjectsListTwoState createState() => _ProjectsListTwoState();
// }
//
// class _ProjectsListTwoState extends State<ProjectsListTwo> {
//
//   Future<Null> refreshList() async{
//     setState(() {
//       // onRefresh=true;
//     });
//     // await getId();
//     return null;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return RefreshIndicator(
//       onRefresh: refreshList,
//       child: Center(child: new Text('asf')),
//     );
//   }
// }
