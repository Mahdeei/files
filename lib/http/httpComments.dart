import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:stubbbb/Models/Comment.dart';
import 'package:stubbbb/Models/Profile.dart';


class HttpComments{
  static var url_getComment = 'http://stube.ir/GetComments.php';
  static var url_getUsername = 'http://stube.ir/getUsernameComments.php';
  static var url_sendComment = 'http://stube.ir/SendComments.php';

  static Future<Map>  getComments(var user_id) async {
    List<Comment> comments=[];
    List<Profile> profile=[];

    var response = await http.post(url_getComment,body: {
      "user_id":"$user_id"
    });
    

    var responseBody = json.decode(response.body);
    responseBody.forEach((item) async {
      comments.add(Comment.fromJson(item));
    });
    return {'comments':comments};
  }
  
  static Future<List> getProfile(var user_id) async {
    List profile = [];
    var response = await http.post(url_getUsername,body: {"user_id":user_id});
    var responsebody = json.decode(response.body);
    responsebody.forEach((item){
      profile.add(item );
    });
    return profile;

  }


  static Future<Map> sendComment(Map body)async{

    var response = await http.post(url_sendComment,body: body);
    var responseBody = json.decode(response.body);
  }


}