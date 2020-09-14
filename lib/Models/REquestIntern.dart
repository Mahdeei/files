class RequestIntern{

  RequestIntern.fromjson(Map<String, dynamic> parsedJson) {
    id = parsedJson['id'];
    date = parsedJson['date'];
    req_id = parsedJson['req_id'];
    req_text = parsedJson['req_text'];
  }



  String req_text;
  String date;
  String req_id;
  String id;
  String user_id;
  String id_advertising;

}