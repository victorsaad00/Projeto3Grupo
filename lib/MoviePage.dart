import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projeto3/Movie.dart';
import 'package:projeto3/SugestionPage.dart';

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
                  ColumnShape(context, 'Movie Description', movie.description),
                  Divider(
                    height: 35,
                  ),
                  ColumnShape(
                      context,
                      'Genre',
                      movie.genre
                          .toString()
                          .substring(1, movie.genre.toString().length - 1)),
                  Divider(
                    height: 35,
                  ),
                  ColumnShape(context, 'Director', movie.director),
                  Divider(
                    height: 35,
                  ),
                  ColumnShape(context, 'Year of Release', movie.year),
                  Divider(
                    height: 35,
                  ),
                  ColumnShape(
                      context,
                      'Actors',
                      movie.actors
                          .toString()
                          .substring(1, movie.actors.toString().length - 1)),
                  Divider(
                    height: 35,
                  ),
                  ColumnShape(context, 'Average Voting', movie.avgVote),
                  SizedBox(
                    width: 50,
                    height: 50,
                  ),
                  RaisedButton(
                    child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        'Sugetions',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                    color: Color(0xFF212121),
                    // Paginar para lista de sugestao
                    onPressed: () => Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (_) => SugestionPage(movie.imdbTitleId))),
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
            alignment: Alignment.centerLeft,
            child: Text(
              col_title,
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            alignment: Alignment.centerRight,
            decoration: BoxDecoration(),
            child: Text(col_info),
          ),
        ],
      ),
    ),
  );
}
