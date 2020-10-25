import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projeto3/Movie.dart';
import 'package:projeto3/MoviePage.dart';
import 'package:http/http.dart' as http;

class SugestionPage extends StatefulWidget {
  // ignore: non_constant_identifier_names
  String url_pointer;
  SugestionPage(this.url_pointer);

  @override
  _SugestionPageState createState() => _SugestionPageState(this.url_pointer);
}

class _SugestionPageState extends State<SugestionPage> {
  // ignore: non_constant_identifier_names
  String url_pointer;
  _SugestionPageState(this.url_pointer);
  List<Movie> _movie = List<Movie>();

  Future<List<Movie>> fetchMovieDataSugestion() async {
    var url =
        'http://10.0.2.2:8000/suggestions/${this.url_pointer}/?format=json';
    final response = await http.get(url);
    if (response.statusCode == 200) {
      var data = json.decode(response.body) as List;
      _movie = data.map<Movie>((json) => Movie.fromJson(json)).toList();
    }
  }

  @override
  void initState() {
    fetchMovieDataSugestion().then((value) {
      setState(() {
        _movie.toList();
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.url_pointer),
      ),
      body: ListView.separated(
          itemCount: _movie.length,
          separatorBuilder: (_, __) => Divider(
                height: 20,
              ),
          itemBuilder: (context, int index) {
            return ListTile(
              title: Text(
                _movie[index].title,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(_movie[index].year),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (_) => MoviePage(_movie[index])));
              },
            );
          }),
    );
  }
}
