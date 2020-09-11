import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:stubbbb/Models/Request.dart';


class RequestHttp {

  static Future<List> getUsernames(id) async {
    String url='http://192.168.43.228/Stub/getUsernameReq.php';
    var response = await http.post(url,body: {"user_id": id});

    var responseBody = json.decode(response.body);

    return responseBody;
  }

  static Future<Map> getData(id) async {
    String url='http://192.168.43.228/Stub/getRequests.php';
    List<Request> requests=[];
    var response = await http.post(url,body: {"user_id": id});

    var responseBody = json.decode(response.body);
    responseBody.forEach((item) {
      requests.add(new Request.fromjson(item));

    });

    return {
      'requests' : requests
    };
  }
}