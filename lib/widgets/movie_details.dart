import 'package:flutter/material.dart';
import 'package:flutter_movie_list/models/movie.dart';

class MovieDetailsWidget extends StatelessWidget {

  MovieDetailsWidget({
    Key key, 
    this.movie
  }) : super(key: key);

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          AspectRatio(
            aspectRatio: 1.0,
            child: Stack(
              fit: StackFit.expand,
              children: <Widget>[
                Hero(
                  child: Image.network(
                    'https://image.tmdb.org/t/p/w185${movie.poster_path}',
                    fit: BoxFit.fill,
                  ),
                  tag: 'movie_${movie.id}',
                ),
              ],
            ),
          ),
          SizedBox(height: 6.0),
          Text('Vote average: ${movie.vote_average}',
              style: TextStyle(
                fontSize: 12.0,
              )),
          SizedBox(height: 4.0),
          Divider(),
          Container(
            padding: const EdgeInsets.fromLTRB(4.0, 4.0, 4.0, 8.0),
            child: Text(movie.overview),
          ),
        ],
      ),
    );
  }
}
