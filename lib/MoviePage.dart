import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projeto3/Movie.dart';
import 'package:projeto3/SuggestionPage.dart';

class MoviePage extends StatelessWidget {
  Movie movie;

  MoviePage(this.movie);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(movie.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10),
              child: SizedBox(
                  child: Column(
                children: <Widget>[
                  ColumnShape(context, 'description', movie.description),
                  Divider(
                    height: 20,
                  ),
                  ColumnShape(
                      context,
                      'genres',
                      movie.genre
                          .reduce((value, element) => value + ', ' + element)),
                  Divider(
                    height: 20,
                  ),
                  ColumnShape(
                      context,
                      'directors',
                      movie.director
                          .reduce((value, element) => value + ', ' + element)),
                  Divider(
                    height: 20,
                  ),
                  ColumnShape(context, 'release', movie.year),
                  Divider(
                    height: 20,
                  ),
                  ColumnShape(
                      context,
                      'actors',
                      movie.actors
                          .reduce((value, element) => value + ', ' + element)),
                  Divider(
                    height: 20,
                  ),
                  ColumnShape(context, 'average voting', movie.avgVote),
                  SizedBox(
                    width: 50,
                    height: 20,
                  ),
                  RaisedButton(
                    child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        'suggestion',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    color: Color(0xFF212121),
                    // Paginar para lista de sugestao
                    onPressed: () => Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (_) => SuggestionPage(
                                movie.imdbTitleId, movie.title))),
                  )
                ],
              )),
            )
          ],
        ),
      ),
    );
  }
}

@override
Widget ColumnShape(context, col_title, col_info) {
  return Padding(
    padding: EdgeInsets.all(2),
    child: Container(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(4.0),
            alignment: Alignment.centerLeft,
            child: Text(
              col_title,
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(4.0),
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(),
            child: Text(col_info),
          ),
        ],
      ),
    ),
  );
}
