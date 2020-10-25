import 'package:projeto3/Movie.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List<Movie>> fetchData(String endpoint) async {
  var url = 'http://192.168.100.27:8000/${endpoint}';
  final response = await http.get(url);
  if (response.statusCode == 200) {
    var data = json.decode(response.body) as List;
    return data.map<Movie>((json) => Movie.fromJson(json)).toList();
  }
}
