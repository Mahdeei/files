import 'dart:convert';
import 'package:http/http.dart' as http;


class AddIntern{
  static var url = 'http://192.168.1.4/Stub/add_Internship.php';
  static addIntern(Map body)async{
    var response = await http.post(url,body: body);
    var responseBody = json.decode(response.body);
    print(responseBody);
    return responseBody;
  }

}