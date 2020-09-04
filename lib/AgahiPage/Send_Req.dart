import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;



class SendReq extends StatefulWidget {
  @override
  _SendReqState createState() => _SendReqState();
}

class _SendReqState extends State<SendReq> {
  var url = "http://192.168.1.5/Stub/Login.php";

  String req_text;

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
                maxLines: 10,
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
                  new RaisedButton(onPressed: (){

                  },
                    color: Colors.blue,
                    child: new Text("ارسال درخواست"),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  // Future request()async{
  //   var response = http.post(url,body:
  //     {
  //       "":"",
  //       "a":"",
  //     }
  //   );
    // var body = json.decode(response.body);
    // print(body);
    // return body;
  // }
}
