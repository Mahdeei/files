import 'dart:convert';

import 'package:http/http.dart'as http;


class ReceiveMaxid{
  static Future getId()async{
    var Maxid = await http.post('http://192.168.1.3/Stub/Max_id.php');
    // print('object');
    // print(jsonDecode(Maxid.body));
    // maxid = json.decode(Maxid.body);
    // print(json.decode(Maxid.body));
    return json.decode(Maxid.body);
  }
}