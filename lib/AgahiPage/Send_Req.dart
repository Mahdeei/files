import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart'as http;
import 'package:flutter/material.dart';
import 'package:stubbbb/Models/AgahiModel.dart';
import 'package:stubbbb/Models/Profile.dart';



class SendReq extends StatefulWidget {
  Advertising advertising;
  Profile profile;
  SendReq({this.advertising,this.profile});
  @override
  _SendReqState createState() => _SendReqState();
}

class _SendReqState extends State<SendReq> {
  String url = "http://192.168.1.4/Stub/SendRequest.php";
  bool seccesSend=false;
  String req_text;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("User Name : ${widget.profile.id}");
    print("ID : ${widget.advertising.id}");

  }

  TextEditingController controller = new TextEditingController();

  @override
  Widget build(BuildContext context) {


    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: new AppBar(
          title: new Text("پیشنهاد کار"),
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              new SizedBox(height: 20.0,),
              new Text("توضیحات پیشنهاد همکاری"),
              new SizedBox(height: 20.0,),
              new TextField(
                textCapitalization: TextCapitalization.sentences,
                maxLines: null,
                controller: controller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "پیشنهاد کار"
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
                      Map recieve=await sendRequest();
                      if(recieve['status']=='created success'){
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

  Future sendRequest() async {
    print(req_text);
    var response = await http.post(url, body: {
      'id_advertising': widget.advertising.id,
      'user_id': widget.profile.id,
      'req_text': req_text,
      'date': "${DateTime.now()}",
    });

    final body = json.decode(response.body);
    print(body);
    return body;
  }

}
