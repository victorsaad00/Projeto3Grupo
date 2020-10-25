import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import 'Movie.dart';
import 'MoviePage.dart';
import 'Theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: MovieAppThemeData,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int page = 2;
  List<Movie> _movie = List<Movie>();

  Future<List<Movie>> fetchMovieData() async {
    var url = 'http://10.0.2.2:8000/movies/?page=${this.page}';
    final response = await http.get(url);
    if (response.statusCode == 200) {
      var data = json.decode(response.body) as List;
      _movie = data.map<Movie>((json) => Movie.fromJson(json)).toList();
    }
  }

  @override
  void initState() {
    fetchMovieData().then((value) {
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
        title: Text('Movie App'),
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
