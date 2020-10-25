import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projeto3/Movie.dart';
import 'package:projeto3/MoviePage.dart';
import 'package:projeto3/ApiService.dart';

class SuggestionPage extends StatefulWidget {
  String imdbTitleId;
  String movieTitle;
  SuggestionPage(this.imdbTitleId, this.movieTitle);

  @override
  _SuggestionPageState createState() =>
      _SuggestionPageState(this.imdbTitleId, this.movieTitle);
}

class _SuggestionPageState extends State<SuggestionPage> {
  String imdbTitleId;
  String movieTitle;
  _SuggestionPageState(this.imdbTitleId, this.movieTitle);
  List<Movie> _movie = List<Movie>();

  @override
  void initState() {
    fetchData('suggestions/' + this.imdbTitleId).then((value) {
      setState(() {
        _movie = value.toList();
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.movieTitle),
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
