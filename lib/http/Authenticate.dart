import 'dart:convert';

import 'package:http/http.dart'as http;
import 'package:stubbbb/Models/myData.dart';
class AuthenticateService{
  static Future<Map> signIn(Map databody) async {
    var response = await http.post("http://192.168.1.5/Stub/Login.php", body: databody);
    final body = json.decode(response.body);
    return body;
  }
  static Future<MyData> getMyData(String id) async {
    var response = await http.post("http://192.168.1.5/Stub/GetMyData.php", body: {'id': id});
    final  body = json.decode(response.body);
    MyData body2 = new MyData(
      image: body['image'],
      title: body['title'],
      username: body['username'],
      apiToken: body['apiToken'],
      certificates: body['certificates'],
      educational: body['educational'],
      fieldUni: body['fieldUni'],
      id: body['id'],
      languages: body['languages'],
      moarefiNameh: body['moarefiName'],
      name: body['name'],
      password: body['password'],
      phoneNumber: body['phoneNumber'],
      resumes: body['resumes'],
      skills: body['skills'],
      type: body['type'],
    );
    return body2;
  }

  static Future<bool> checkLog (String apiToken) async {
    var apiResponse = await http.post('http://192.168.1.5/Stub/AuthenticateService.php',body: {
      'apiToken' : apiToken
    });
    Map result = json.decode(apiResponse.body);

    return result['status'] == 'Defined';
  }



}