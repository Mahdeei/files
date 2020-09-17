import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:stubbbb/Models/InterShip.dart';


class HttpInterships{
  static var url = 'http://stube.ir/getInterships.php';


  static Future<Map> getData(Map body) async {
    List<InterShip> interships = [];
    var response = await http.post(url,body: body);

    var responseBody = json.decode(response.body);
    // print(responseBody);
    responseBody.forEach((item) {
      interships.add(InterShip.fromjson(item));
    });
    return {
      'interships' : interships
    };
  }
}

