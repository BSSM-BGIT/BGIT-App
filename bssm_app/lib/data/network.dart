import 'package:http/http.dart' as http;
import 'dart:convert';

class Network {
  final String url;
  final String code;
  Network(this.url, this.code);

  Future<dynamic> getJsonData() async {
    http.Response response =
        await http.post(Uri.parse(url), headers: <String, String>{
      'authCode': code,
    });
    if (response.statusCode == 200) {
      String jsonData = response.body;
      var parsingData = jsonDecode(jsonData);
      return parsingData;
    }
  }

  
}
