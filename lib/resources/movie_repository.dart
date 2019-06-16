import 'dart:async';
import 'package:flutter_movie_list/models/movies.dart';

import 'movie_api_provider.dart';

class MovieRepository {
  final moviesApiProvider = MovieApiProvider();

  Future<Movies> fetchAllMovies() => moviesApiProvider.fetchMovieList();
}