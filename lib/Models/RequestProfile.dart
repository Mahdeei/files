class RequestProfile{

  var username,name,image;
  RequestProfile.fromjson(Map<String, dynamic> parsedJson) {
    username = parsedJson['username'];
    name = parsedJson['name'];
    image = parsedJson['image'];
  }


}