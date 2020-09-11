import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:stubbbb/Models/profileModels.dart';

class ProfileHttp {
  static Future<Map> getData(Map body) async {

    List<User> profiles = [];
    var response = await http.post('http://192.168.43.159/Stub/userGetData.php',body: body);

    var responseBody = json.decode(response.body);

    responseBody.forEach((item) {
      profiles.add(User.fromjson(item));
    });
    return {
      'profiles' : profiles
    };
  }
}
