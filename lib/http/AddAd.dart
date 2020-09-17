import 'dart:convert';
import 'package:http/http.dart' as http;




class AddAd {
  static var url = 'http://stube.ir/add_Ad.php';


  static addAdv(Map body) async {
    var response = await http.post(url,body: body);
    var responseBody = json.decode(response.body);

    return responseBody;
  }
}