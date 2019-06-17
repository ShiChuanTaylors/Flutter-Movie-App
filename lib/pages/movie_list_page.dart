import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie_list/blocs/movie/movie_bloc.dart';
import 'package:flutter_movie_list/widgets/movie_list.dart';

class MovieListPage extends StatefulWidget {
  MovieListPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MovieListState createState() => _MovieListState();
}

class _MovieListState extends State<MovieListPage> {
  
  MovieBloc _movieBloc;
  
  @override
  void initState() {
    _movieBloc = BlocProvider.of<MovieBloc>(context);
    _movieBloc.loadMovies();
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: BlocProvider(
          bloc: _movieBloc,
          child: MovieListWidget(),
        ));
  }

  @override
  void dispose() {
    _movieBloc.dispose();
    super.dispose();
  }
}
