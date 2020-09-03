class User {

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
