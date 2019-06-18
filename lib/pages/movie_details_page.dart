import 'package:flutter/material.dart';
import 'package:flutter_movie_list/models/movie.dart';
import 'package:flutter_movie_list/widgets/movie_details.dart';


class MovieDetailsPage extends StatefulWidget {
  MovieDetailsPage({Key key, this.data}) : super(key: Key("MOVIE_DETAILS_PAGE"));

  final Movie data;

  @override
  _MovieDetailsState createState() => _MovieDetailsState();
}


class _MovieDetailsState extends State<MovieDetailsPage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.data.title),
      ),
      body: MovieDetailsWidget(
        movie: widget.data
      ),
    );
  }
}
