import 'dart:convert';
import 'package:http/http.dart';

class Network_Helper {
  Network_Helper(this.url);

  final String url;

  Future getData() async {
    Response response = await get(
      Uri.parse(url),
    );
    if (response.statusCode == 200) {
      String data = response.body;
      //print(data);
      //var longitude = jsonDecode(data)['coord']['lon'];
      //var latitude = jsonDecode(data)['coord']['lat'];
      return jsonDecode(data);
    } else {
      print(response.statusCode);
      //print(response.body);
    }
  }
}
