import 'dart:convert';

import 'package:http/http.dart' as http;

class DomainProvider {
  Future<Map<String, dynamic>> getDomain(String domain) async {
    final response =
        await http.post("http://10.0.2.2:8082/checkDomain/" + domain);
    print(response.statusCode);
    if (response.statusCode == 200) {
      Map<String, dynamic> decodeAnswer = json.decode(response.body);
      return decodeAnswer;
    } else {
      String res = json.decode(response.body);
      return {"Error": res};
    }
  }

  Future<List<dynamic>> getConsult() async {
    final response = await http.get("http://10.0.2.2:8082/consultDomains");

    if (response.statusCode == 200) {
      List<dynamic> decodeAnswer = json.decode(response.body);
      print(decodeAnswer);
      return decodeAnswer;
    } else {
      return null;
    }
  }
}
