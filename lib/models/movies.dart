import 'package:equatable/equatable.dart';

import 'movie.dart';

class Movies extends Equatable {
  int _page;
  int _total_movies;
  int _total_pages;
  List<Movie> _results = [];

  Movies.fromJson(Map<String, dynamic> parsedJson) {
    print(parsedJson['results'].length);
    _page = parsedJson['page'];
    _total_movies = parsedJson['total_results'];
    _total_pages = parsedJson['total_pages'];
    List<Movie> temp = [];
    for (int i = 0; i < parsedJson['results'].length; i++) {
      Movie result = Movie(parsedJson['results'][i]);
      temp.add(result);
    }
    _results = temp;
  }

  List<Movie> get results => _results;

  int get total_pages => _total_pages;

  int get total_results => _total_movies;

  int get page => _page;
}


