import 'package:http/http.dart' as http;
import 'dart:convert';

class Network{
  // final String url;
  // Network(this.url);

  Future<dynamic> getJsonData(String url) async{
    // Uri uri = Uri.parse('https://openapi.naver.com/v1/search/news.json');
    // http.Response response = await http.get(uri);
    http.Response response = await http.get(Uri.parse(url));
    if(response.statusCode==200){
      String jsonData = response.body;
      var parsingData = jsonDecode(jsonData);
      return parsingData;
    }
    print("status::: ${response.statusCode}");
  }

}