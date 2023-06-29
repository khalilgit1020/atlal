import 'dart:convert';

import 'package:http/http.dart' as http;

Future<List> getData() async{
  final response = await http.get(
    Uri.parse('https://alatlalroastery.ae/wp-json/wp/v2/posts?per_page=${100}'),
    headers: {"Accept": "application/json"},
  );

  var convertData =  jsonDecode(response.body);

  return convertData;
}


Future<List> getPagesData() async{
  final response = await http.get(
    Uri.parse('https://alatlalroastery.ae/wp-json/wp/v2/pages'),
    headers: {"Accept": "application/json"},
  );

  var convertData =  jsonDecode(response.body);

  return convertData;
}
