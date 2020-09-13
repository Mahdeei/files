import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:stubbbb/Models/Comment.dart';

class HttpGetComments{
  static var url = 'http://192.168.1.4/Stub/GetComments.php';

  static Future<List<Comment>>  getComments(var user_id) async {
    List<Comment> comments=[];
    var response = await http.post(url,body: {"user_id":"$user_id"});
    var responseBody = json.decode(response.body);
    responseBody.forEach((item) {
      print(item);
      comments.add(Comment.fromJson(item));

    });
    return comments;
  }


}