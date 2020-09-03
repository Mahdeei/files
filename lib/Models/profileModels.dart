import 'package:flutter/material.dart';

class User {



  // User({this.id, this.username, this.name, this.phonenumber, this.moarefinameh,this.image, this.type, this.title, this.password, this.apiToken});

  var id;
  var username;
  var name;
  var phonenumber;
  var moarefinameh;
  var image;
  var type;
  var title;
  var password;
  var apiToken;


  User.fromjson(Map<String, dynamic> parsedJson) {
    id = parsedJson['id'];
    type = parsedJson['type'];
    username = parsedJson['username'];
    name = parsedJson['name'];
    phonenumber = parsedJson['phonenumber'];
    image = parsedJson['image'];
    password = parsedJson['password'];
    moarefinameh = parsedJson['moarefinameh'];
    title = parsedJson['title'];
    apiToken = parsedJson['apiToken'];
  }

}
