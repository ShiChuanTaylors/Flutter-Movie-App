/*
 * Package that allows comparisons between objects without having to override the == operator
 */
import 'package:equatable/equatable.dart';
import 'package:flutter_movie_list/models/movies.dart';
import 'package:meta/meta.dart';


abstract class MovieState extends Equatable {}

class MovieEmpty extends MovieState {}

class MovieLoading extends MovieState {}

class MovieLoaded extends MovieState {
  final Movies movies;

  MovieLoaded({@required this.movies})
      : assert(movies != null),
        super();
}

class MovieError extends MovieState {}