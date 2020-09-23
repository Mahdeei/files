import 'dart:convert';
import 'package:http/http.dart'as http;
import 'package:stubbbb/Models/DataUser.dart';
import 'package:stubbbb/Models/myData.dart';

class AuthenticateService{

  static Future<Map> signIn(Map databody) async {
    var response = await http.post("http://stube.ir/Login.php", body: databody);
    final body = json.decode(response.body);
    return body;
  }
  static Future<MyData> getMyData(String id) async {
    var response = await http.post("http://stube.ir/GetMyData.php", body: {'id': id});
    var body = json.decode(response.body);
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
      moarefiNameh: body['moarefiname'],
      name: body['name'],
      password: body['password'],
      phoneNumber: body['phonenumber'],
      resumes: body['resumes'],
      skills: body['skills'],
      address: body['address'],
      type: body['type'],
    );
    return body2;
  }



  static Future<MyData> getDataNormal(String id) async {
    var response = await http.post("http://stube.ir/getDataNormal.php", body: {'id': id});
    var body = json.decode(response.body);
    MyData body2 = new MyData(
      image: body['image'],
      title: body['title'],
      username: body['username'],
      apiToken: body['apiToken'],
      id: body['id'],
      moarefiNameh: body['moarefiname'],
      name: body['name'],
      password: body['password'],
      phoneNumber: body['phonenumber'],
      address: body['address'],
      type: body['type'],
    );
    return body2;
  }


  static Future<DataUser> getDataUser(String id) async {
    var response = await http.post("http://stube.ir/GetMyData.php", body: {'id': id});
    final  body = json.decode(response.body);
    DataUser body2 = new DataUser(
      image: body['image'],
      title: body['title'],
      username: body['username'],
      certificates: body['certificates'],
      educational: body['educational'],
      fieldUni: body['fieldUni'],
      id: body['id'],
      languages: body['languages'],
      moarefiNameh: body['moarefiname'],
      name: body['name'],
      phoneNumber: body['phonenumber'],
      resumes: body['resumes'],
      skills: body['skills'],
      type: body['type'],
    );
    return body2;
  }




  static Future<Map> checkLog (String apiToken) async {
    var apiResponse = await http.post('http://stube.ir/AuthenticateService.php',body: {
      'apiToken' : apiToken
    });
    Map result = json.decode(apiResponse.body);

    return result;
  }



}