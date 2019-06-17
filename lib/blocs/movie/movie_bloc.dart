import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter_movie_list/blocs/movie/movie_state.dart';
import 'package:flutter_movie_list/models/movies.dart';
import 'package:flutter_movie_list/resources/movie_repository.dart';
import 'package:meta/meta.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  final repository;
  
  MovieBloc({@required this.repository});

  void loadMovies() {
    dispatch(LoadMoviesList());
  }

  @override
  MovieState get initialState => MovieEmpty();

  @override
  Stream<MovieState> mapEventToState(MovieEvent event) async* {
    if (event is LoadMoviesList) {
      yield MovieLoading();
      try {
        final Movies movies = await repository.fetchAllMovies();
        yield MovieLoaded(movies: movies);
      } catch (_) {
        yield MovieError();
      }
    }
  }
}


abstract class MovieEvent {}

class LoadMoviesList extends MovieEvent {}

