import 'package:http/http.dart' as http;
import 'package:tech_newzz/components/searchbar.dart';
import 'package:tech_newzz/utils/key.dart';

import 'dart:convert';

Future<List> fetchnews() async {
  final response = await http.get(
    Uri.parse(
        'https://newsapi.org/v2/top-headlines?country=in&apiKey=79adfc43646742659ec0007f47df9364' +
            '&q=' +
            SearchBar.searchcontroller.text),
  );
  Map result = jsonDecode(response.body);
  print('Fetched');

  return (result['articles']);
}
