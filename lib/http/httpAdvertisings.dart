import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:stubbbb/Models/AgahiModel.dart';


class HttpAdvertisings {
  static var url = 'http://stube.ir/Advertising.php';


  static Future<Map> getData(Map body) async {
    List<Advertising> advertisings = [];
    var response = await http.post(url,body: body);

    var responseBody = json.decode(response.body);
    responseBody.forEach((item) {
      advertisings.add(Advertising.fromJson(item));
    });
    return {
      'advertisings' : advertisings
    };
  }
}

