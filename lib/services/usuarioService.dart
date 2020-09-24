import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

getUsers({userId=Null}) async {
  var url = 'http://localhost:3333//users/$userId';

  var response = await http.get(url);
  if (response.statusCode == 200) {
    return convert.jsonDecode(response.body);
  }
}