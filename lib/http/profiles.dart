import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:stubbbb/Models/profileModels.dart';

class ProfileHttp {
  static Future<Map> getData() async {
    List<Models> profiles = [];
    var response = await http.get('http://192.168.1.6/Stub/userGetData.php');

    var responseBody = json.decode(response.body);
    responseBody.forEach((item) {
      profiles.add(Models.fromjson(item));
    });
    return {
      'profiles' : profiles
      };
  }
}
