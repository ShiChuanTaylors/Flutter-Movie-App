import 'package:flutter_movie_list/blocs/movie/movie_bloc.dart';
import 'package:flutter_movie_list/blocs/movie/movie_state.dart';
import 'package:flutter_movie_list/models/movie.dart';
import 'package:flutter_movie_list/models/movies.dart';
import 'package:flutter_movie_list/resources/movie_repository.dart';
import 'package:mockito/mockito.dart';
import 'package:test_api/test_api.dart';

class MockTodosRepository extends Mock implements MovieRepository {}

void main() {
  group('MovieBloc', () {
    MovieBloc movieBloc;

    setUp(() {
      movieBloc = MovieBloc(
        repository: new MockTodosRepository()
      );
      
      when(movieBloc.repository.fetchAllMovies()).thenAnswer((_) {
        var map = {
          "vote_count": 12,
          "id": 532321,
          "video": false,
          "vote_average": 4.7,
          "title": "Re: Zero kara Hajimeru Isekai Seikatsu - Memory Snow",
          "popularity": 288.706,
          "poster_path": "/xqR4ABkFTFYe8NDJi3knwWX7zfn.jpg",
          "original_language": "ja",
          "original_title": "Re:Memory Snow",
          "genre_ids": [16, 12],
          "backdrop_path": "/8sNz2DxYiYqGkxk66U8BqvuZZjE.jpg",
          "adult": false,
          "overview": "testing data",
          "release_date": "2018-10-06"
        };
        return Future.value(Movies.fromJson({
          "page": 1,
          "total_results": 19838,
          "total_pages": 992,
          "results": [map]
        }));
      });
    });

    test('initial state is empty state', () {
      expect(movieBloc.initialState, MovieEmpty());
    });

    test('should emit MovieError if repository throws error', () {
      final List<MovieState> expected = [
        MovieEmpty(),
        MovieLoading(),
        MovieError()
      ];

      when(movieBloc.repository.fetchAllMovies())
          .thenThrow(Exception("ops"));

      expectLater(
        movieBloc.state,
        emitsInOrder(expected),
      );

      movieBloc.dispatch(LoadMoviesList());
    });

    test('Loading movies', () {
      final List<MovieState> expected = [MovieEmpty(), MovieLoading()];

      expectLater(
        movieBloc.state,
        emitsInOrder(expected),
      );

      movieBloc.dispatch(LoadMoviesList());
    });

    // test('Movies loaded', () {
    //   final List<MovieState> expected = [MovieEmpty(), MovieLoading()];

    //   expectLater(
    //     movieBloc.state,
    //     emitsInOrder(expected),
    //   );

    //   movieBloc.dispatch(LoadMoviesList());
    // });
  });
}
