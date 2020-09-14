import 'package:flutter/material.dart';
import 'package:stubbbb/Models/InterShip.dart';
import 'package:stubbbb/Models/myData.dart';
import 'package:http/http.dart' as http;

class SendReqIntern extends StatefulWidget {
  MyData profile;
  InterShip interShip;
  SendReqIntern({this.profile,this.interShip});
  @override
  _SendReqInternState createState() => _SendReqInternState();
}

class _SendReqInternState extends State<SendReqIntern> {
  String url = "http://192.168.1.4/Stub/SendRequestAd.php";
  bool seccesSend=false;
  String req_text;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("User Name : ${widget.profile.id}");
    print("ID : ${widget.interShip.id}");

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
              new Text("توضیحات پیشنهاد کارآموزی"),
              new SizedBox(height: 20.0,),
              new TextField(
                textCapitalization: TextCapitalization.sentences,
                maxLines: null,
                controller: controller,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "پیشنهاد همکاری"
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
                      // Map recieve=await sendRequestAd();
                      // if(recieve['status']=='created success'){
                      //   setState(() {
                      //     seccesSend=true;
                      //   });
                      // }
                    },
                    color: Colors.blue,
                    child: new Text("ارسال درخواست همکاری"),
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

  // Future sendRequestIntern() async {
  //   print(req_text);
  //   var response = await http.post(url, body: {
  //     'id_advertising': widget.advertising.id,
  //     'user_id': widget.profile.id,
  //     'req_text': req_text,
  //     'date': "${DateTime.now()}",
  //   });
  //
  //   final body = json.decode(response.body);
  //   print(body);
  //   return body;
  // }

}
