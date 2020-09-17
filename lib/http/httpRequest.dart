import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:stubbbb/Models/REquestIntern.dart';
import 'package:stubbbb/Models/Request.dart';


class RequestHttp {

  static Future<List> getUsernames(id) async {
    String url='http://192.168.1.2/Stub/getUsernameReq.php';
    var response = await http.post(url,body: {"user_id": id});

    var responseBody = json.decode(response.body);

    return responseBody;
  }

  static Future<Map> getAd(id) async {
    String url='http://192.168.1.2/Stub/getRequestsAd.php';
    List<RequestAd> requests=[];
    var response = await http.post(url,body: {"user_id": id});

    var responseBody = json.decode(response.body);
    responseBody.forEach((item) {
      requests.add(new RequestAd.fromjson(item));
      print(item);
    });

    return {
      'requests' : requests
    };
  }


  static Future<Map> getIntern(id) async {
    String url='http://192.168.1.2/Stub/getRequestIntern.php';
    List<RequestIntern> requests=[];
    var response = await http.post(url,body: {"user_id": id});

    var responseBody = json.decode(response.body);
    responseBody.forEach((item) {
      requests.add(new RequestIntern.fromjson(item));
      // print(item);
    });

    return {
      'requests' : requests
    };
  }
}