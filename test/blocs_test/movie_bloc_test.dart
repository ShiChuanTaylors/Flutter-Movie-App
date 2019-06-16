import 'package:flutter_movie_list/blocs/movie_bloc.dart';
import 'package:flutter_movie_list/blocs/movie_state.dart';
import 'package:test_api/test_api.dart';

void main() {
  group('Movie Bloc', () {
    MovieBloc movieBloc;

    setUp(() {
      movieBloc = MovieBloc();
    });

    test('initial state is empty state', () {
      expect(movieBloc.initialState, MovieEmpty());
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
