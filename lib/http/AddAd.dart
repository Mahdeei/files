import 'dart:convert';
import 'package:http/http.dart' as http;




class AddAd {
  static var url = 'http://192.168.1.4/Stub/add_Ad.php';


  static addAdv(Map body) async {
    var response = await http.post(url,body: body);
    var responseBody = json.decode(response.body);

    return responseBody;
  }
}