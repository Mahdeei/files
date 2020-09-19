class RequestUser{

  RequestUser.fromjson(Map<String, dynamic> parsedJson) {
    id = parsedJson['id'];
    date = parsedJson['date'];
    user_request = parsedJson['user_request'];
    req_text = parsedJson['req_text'];
  }


  String id;
  String user_id;
  String req_text;
  String user_request;
  String date;




}