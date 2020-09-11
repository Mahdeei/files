import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:stubbbb/Models/InterShip.dart';


class HttpInterships{
  static var url = 'http://192.168.43.228/Stub/Advertising.php';


  static Future<Map> getData() async {
    List<InterShip> interships = [];
    var response = await http.get(url);

    var responseBody = json.decode(response.body);
    responseBody.forEach((item) {
      interships.add(InterShip.fromjson(item));
    });
    return {
      'interships' : interships
    };
  }
}

