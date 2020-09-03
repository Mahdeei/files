// import 'package:flutter/material.dart';
// import 'package:stubbbb/Other/widget.dart';
//
//
//
// class WelcomePage extends StatefulWidget {
//
//   @override
//   _WelcomePageState createState() => _WelcomePageState();
// }
//
// class _WelcomePageState extends State<WelcomePage> {
//
//   @override
//   Widget build(BuildContext context) {
//
//     return new Directionality(textDirection: TextDirection.rtl,
//         child: new SafeArea(
//             child: new Scaffold(
//               body: new Container(
//                 height: MediaQuery.of(context).size.height,
//                 width: MediaQuery.of(context).size.width,
//                 decoration: decorationWelcomePage(),
//                 child: new Column(
//                   children: <Widget>[
//                     new SizedBox(height: MediaQuery.of(context).size.height*0.08),
//                     new Align(
//                         alignment: Alignment.centerRight,
//                         child:new Padding(
//                             padding: const EdgeInsets.only(right: 20),
//                             child: textWelcomePage()
//                     )),
//                     new Align(
//                         alignment: Alignment.centerRight,
//                         child:new Padding(
//                             padding: const EdgeInsets.only(right: 10),
//                             child: textWelcomePagehint('یاد بگیر که',28.0,FontWeight.normal)
//                     )),
//                     new Align(alignment: Alignment.centerRight,
//                         child:new Padding(padding: const EdgeInsets.only(right: 30),
//                             child: textWelcomePagehint('موفق باشی ..',35.0,FontWeight.bold))),
//                     new SizedBox(
//                       height: MediaQuery.of(context).size.height*0.58,
//                     ),
//                     new Row(mainAxisAlignment: MainAxisAlignment.start,
//                       children: <Widget>[
//                         new GestureDetector(
//                           child: new Container(height: MediaQuery.of(context).size.height*0.081,
//                               width: MediaQuery.of(context).size.width*0.4,
//                               margin: const EdgeInsets.symmetric(horizontal: 20.0),
//                               decoration: BoxDecoration(color: Colors.redAccent,
//                                 borderRadius: BorderRadius.circular(50.0),
//                               ),
//                               child:new Align(alignment: Alignment.center,
//                                   child: new Container(
//                                     child: new Text(
//                                       'برو بریم!',
//                                       textAlign: TextAlign.center,
//                                       style: TextStyle(color: Colors.white,fontSize: 22.0,fontWeight: FontWeight.bold),),
//                                   ),
//                                 )
//                             ),
//                           onTap: () => Navigator.push(context,MaterialPageRoute(builder: (context)=>  LoginPage())),
//                         )
//                       ],
//                     )
//
//                   ],
//                 ),
//               ),
//             )
//         )
//     );
//   }
// }