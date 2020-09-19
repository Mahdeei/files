import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:stubbbb/Models/REquestIntern.dart';
import 'package:stubbbb/Models/Request.dart';
import 'package:stubbbb/Models/RequestProfile.dart';
import 'package:stubbbb/Models/RequestUser.dart';


class RequestHttp {

  static Future<List<RequestProfile>> getProfileReqAd(id) async {
    String url='http://stube.ir/getUsernameReq.php';
    List<RequestProfile> profiles=[];
    var response = await http.post(url,body: {"user_id": id});

    var responseBody = json.decode(response.body);
    responseBody.forEach((item) {
      profiles.add(new RequestProfile.fromjson(item));
      // print(item);
    });
    return profiles;
  }


  static Future<List<RequestProfile>> getProfileIntern(id) async {
    String url='http://stube.ir/getProfileReqIntern.php';
    List<RequestProfile> profiles=[];
    var response = await http.post(url,body: {"user_id": id});

    var responseBody = json.decode(response.body);
    responseBody.forEach((item) {
      profiles.add(new RequestProfile.fromjson(item));
      print(item);
    });
    return profiles;
  }


  static Future<List<RequestProfile>> getProfile(id) async {
    String url='http://stube.ir/getProfileUserRequest.php';
    List<RequestProfile> profiles=[];
    var response = await http.post(url,body: {"user_id": id});

    var responseBody = json.decode(response.body);
    responseBody.forEach((item) {
      profiles.add(new RequestProfile.fromjson(item));

      // print(item);
    });

    return profiles;
  }

  static Future<Map> getAd(id) async {
    String url='http://stube.ir/getRequestsAd.php';
    List<RequestAd> requests=[];
    var response = await http.post(url,body: {"user_id": id});

    var responseBody = json.decode(response.body);
    responseBody.forEach((item) {
      requests.add(new RequestAd.fromjson(item));
      // print(item);
    });

    return {
      'requests' : requests
    };
  }


  static Future<Map> getIntern(id) async {
    String url='http://stube.ir/getRequestIntern.php';
    List<RequestIntern> requests=[];
    var response = await http.post(url,body: {"user_id": id});

    var responseBody = json.decode(response.body);
    responseBody.forEach((item) {
      requests.add(new RequestIntern.fromjson(item));
      print(item);
    });

    return {
      'requests' : requests
    };
  }

  static Future<List<RequestUser>> getReqUser(id) async {
    String url='http://stube.ir/getRequestUser.php';
    List<RequestUser> requests=[];
    var response = await http.post(url,body: {"user_id": id});

    var responseBody = json.decode(response.body);
    responseBody.forEach((item) {
      requests.add(new RequestUser.fromjson(item));
      print(item);
    });

    return requests;
  }

  static Future<List<String>> getImages(id) async {
    String url='http://stube.ir/getImageStudent.php';
    List<String> images=[];
    var response = await http.post(url,body: {"user_id": id});

    var responseBody = json.decode(response.body);
    // print(responseBody);
    responseBody.forEach((item) {
      // print(item['image']);
      images.add(item['image']);
      // print(item);
    });

    return images;

  }

}