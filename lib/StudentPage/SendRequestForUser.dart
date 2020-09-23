import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart'as http;
import 'package:flutter/material.dart';
import 'package:stubbbb/Models/myData.dart';
import 'package:stubbbb/Models/profileModels.dart';



class SendRequestForUser extends StatefulWidget {
  MyData profile;
  User user;
  SendRequestForUser({this.user,this.profile});
  @override
  _SendRequestForUserState createState() => _SendRequestForUserState();
}

class _SendRequestForUserState extends State<SendRequestForUser> {
  String url = "http://stube.ir/SendRequestforUser.php";
  bool seccesSend=false;
  String req_text;
  TabController tabController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();


  }

  TextEditingController controller = new TextEditingController();

  @override
  Widget build(BuildContext context) {


    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: new AppBar(
          title: new Text("ارسال درخواست"),
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              new SizedBox(height: 20.0,),
              new Text("متن درخواستی"),
              new SizedBox(height: 20.0,),
              new TextField(
                textCapitalization: TextCapitalization.sentences,
                maxLines: null,
                controller: controller,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "ارسال پیشنهاد"
                ),
                onChanged: (text){
                  setState(() {
                    req_text = text;
                  });
                },
              ),
              new SizedBox(height: 20.0,),
              new Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  new RaisedButton(
                    onPressed: ()async{
                      // sendRequest();
                      Map recieve=await sendRequestUser();
                      if(recieve['status']=='send Request is successfully'){
                        setState(() {
                          seccesSend=true;
                        });
                      }
                    },
                    color: Colors.blue,
                    child: new Text("ارسال درخواست"),
                  )
                ],
              ),
              seccesSend
                  ? Container(
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                  child: Center(
                      child: new Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          new Icon(Icons.check_circle_outline,color: Colors.green,),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: new Text('درخواست با موفقیت ارسال شد',style: TextStyle(color: Colors.green,fontSize: 20.0),),
                          )
                        ],
                      )
                  ))
                  : new Container()
            ],
          ),
        ),
      ),
    );
  }

  Future sendRequestUser() async {
    var response = await http.post(url, body: {
      'user_request': widget.user.id,
      'user_id': widget.profile.id,
      'req_text': req_text,
      'date': "${DateTime.now()}",
    });

    final body = json.decode(response.body);
    return body;
  }

}
