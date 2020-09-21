import 'package:flutter/material.dart';
import 'package:stubbbb/Other/R.dart';


class MyRequests extends StatefulWidget {
  var userName,text,date;
  MyRequests({this.userName,this.text,this.date});
  @override
  _MyRequestsState createState() => _MyRequestsState();
}

class _MyRequestsState extends State<MyRequests> {

  bool accept=false;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: new AppBar(
          backgroundColor: R.color.banafshmain,
          title: new Text(widget.userName),
          // actions: [
          //   new Row(
          //     mainAxisAlignment: MainAxisAlignment.end,
          //     children: [
          //       new Container(
          //         decoration: BoxDecoration(
          //           // color: Colors.red,
          //           // shape: BoxShape.circle,
          //           image: DecorationImage(image: AssetImage(R.images.axeProfile))
          //         ),
          //       )
          //     ],
          //   )
          // ],
        ),
        body: new Stack(
          alignment: Alignment.bottomLeft,
          children: [
            new Container(
              color: Colors.black12,
            ),
            new Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                  new Expanded(
                    child: new Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 20),
                      child: new ListView(
                        children: [
                          new Container(
                            margin: const EdgeInsets.only(bottom: 50.0),
                            padding: const EdgeInsets.symmetric(horizontal: 2.0,vertical: 2.0),
                            decoration: BoxDecoration(
                                color: Colors.transparent
                            ),
                            child: new Text(widget.text,maxLines: 10,style: TextStyle(fontSize: 20.0),),
                          ),
                          new SizedBox(height: 10.0,),
                          // accept
                          //     ? new Container()
                          //     : new Row(
                          //   mainAxisAlignment: MainAxisAlignment.center,
                          //       children: [
                          //         new MaterialButton(
                          //             color: Colors.green,
                          //             child: new Text("تایید در خواست",style: TextStyle(fontSize: 15.0),),
                          //             onPressed: (){
                          //               setState(() {
                          //                 accept = true;
                          //               });
                          //               print("Pressed confirm");
                          //             }),
                          //         new SizedBox(width: 10.0,),
                          //         new MaterialButton(
                          //             color: Colors.red,
                          //             child: new Text("رد درخواست",style: TextStyle(fontSize: 15.0),),
                          //             onPressed: (){
                          //               setState(() {
                          //                 accept = true;
                          //               });
                          //               print("Pressed no accept");
                          //             }
                          //     )
                          //   ],
                          // )
                        ],
                      ),
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}


//   TextEditingController _controller = new TextEditingController();
//
//                         return new Container(
//                           margin: const EdgeInsets.only(bottom: 5.0),
//                           padding: const EdgeInsets.symmetric(horizontal: 2.0,vertical: 2.0),
//                           decoration: BoxDecoration(
//                               color: _userId == _messages[index].id
//                                   ? Colors.red
//                                   : Colors.white
//                           ),
//                           child: new Row(
//                             children: [
//                               new Text(_messages[index].message)
//                             ],
//                           ),
//                         );
//                       },
//                     ),
//                   )),
//               new Container(
//                 decoration: BoxDecoration(
//                     color: Colors.white
//                 ),
//                 child: new Row(
//                   children: [
//                     new IconButton(
//                         icon: Icon(Icons.insert_emoticon),
//                         onPressed: (){}
//                     ),
//                     new Expanded(
//                         child: new TextField(
//                           controller: _controller,
//                           decoration: InputDecoration(
//                               hintText: 'send message',
//                               border: InputBorder.none
//                           ),
//                         )
//                     ),
//                     new IconButton(
//                         icon: Icon(Icons.send),
//                         onPressed: (){
//
//
//                           String msg = _controller.text;
//                           if(_controller.text.length > 0){
//                             setState(() {
//
//
//                               _messages.add(
//                                   ChatModel(id: this._userId,message: msg));
//                               _controller.text = '';
//                             });
//                           }}
//                     ),
//                   ],
//                 ),
//               )
//             ],
//           )
//         ],
//       ),
//     );
//   }
//
//   }