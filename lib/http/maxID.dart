import 'dart:convert';

import 'package:http/http.dart'as http;


class ReceiveMaxid{
  static Future getId()async{
    var Maxid = await http.post('http://192.168.1.2/Stub/Max_id.php');
    return json.decode(Maxid.body);
  }
  static Future getAdID()async{
    var Maxid = await http.post('http://192.168.1.2/Stub/AdMaxid.php');
    return json.decode(Maxid.body);
  }

  static Future getInterID()async{
    var Maxid = await http.post('http://192.168.1.2/Stub/InternMaxid.php');
    return json.decode(Maxid.body);
  }





}