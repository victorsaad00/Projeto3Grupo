import 'package:flutter/material.dart';
import 'ApiService.dart';
import 'Movie.dart';
import 'MoviePage.dart';
import 'Theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
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
  int page = 1;
  bool isLoading = false;
  List<Movie> _movie = List<Movie>();

  @override
  void initState() {
    _loadData();
    super.initState();
  }

  void _loadData() {
    fetchData('movies/?page=' + this.page.toString()).then((value) {
      setState(() {
        if (page < 2) {
          _movie = value.toList();
        } else {
          _movie.addAll(value);
        }

        page++;
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Movies'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: NotificationListener<ScrollNotification>(
              onNotification: (ScrollNotification scrollInfo) {
                if (!isLoading &&
                    scrollInfo.metrics.pixels ==
                        scrollInfo.metrics.maxScrollExtent) {
                  _loadData();
                  setState(() {
                    isLoading = true;
                  });
                }
              },
              child: ListView.separated(
                separatorBuilder: (_, __) => Divider(
                  height: 20,
                ),
                itemCount: _movie.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('${_movie[index].title}'),
                    subtitle: Text(_movie[index].year),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (_) => MoviePage(_movie[index])));
                    },
                  );
                },
              ),
            ),
          ),
          Container(
            height: isLoading ? 50.0 : 0,
            child: Center(
              child: new CircularProgressIndicator(),
            ),
          ),
        ],
      ),
    );
  }
}
