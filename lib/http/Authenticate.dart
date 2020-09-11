import 'dart:convert';

import 'package:http/http.dart'as http;
class AuthenticateService{
  static Future<Map> signIn(Map databody) async {
    var response = await http.post("http://192.168.43.228/Stub/Login.php", body: databody);
    final body = json.decode(response.body);
    return body;
  }

  static Future<bool> checkLog (String apiToken) async {
    var apiResponse = await http.post('http://192.168.43.228/Stub/AuthenticateService.php',body: {
      'apiToken' : apiToken
    });
    Map result = json.decode(apiResponse.body);

    return result['status'] == 'Defined';
  }



}