import 'package:flutter_movie_list/models/movies.dart';
import 'package:flutter_movie_list/resources/movie_api_provider.dart';
import 'package:mockito/mockito.dart';
import 'dart:convert';
import 'package:test/test.dart';
import 'package:http/http.dart';
import 'package:http/testing.dart';

// class MockClient extends Mock implements http.Client {}

main() {
  group('Fetch Movie List', () {
    test("Testing the network call", () async {
      //setup the test
      final movieApiProvider = MovieApiProvider();
      movieApiProvider.client = MockClient((request) async {
        final mapJson = {
          "page": 1,
          "total_results": 19838,
          "total_pages": 992,
          "results": [
            {
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
              "overview":
                  "testing data",
              "release_date": "2018-10-06"
            }
          ]
        };
        return Response(json.encode(mapJson), 200);
      });

      final _data = await movieApiProvider.fetchMovieList();
      expect(_data, isInstanceOf<Movies>());
    });

    test("Throws an exception if the http call completes with an error", () async {
      //setup the test
      final movieApiProvider = MovieApiProvider();
      movieApiProvider.client = MockClient((request) async {
        return Response("Not found", 404);
      });

      expect(movieApiProvider.fetchMovieList(), throwsException);
    });
    // test('returns a Post if the http call completes successfully', () async {

    //   // Use Mockito to return a successful response when it calls the
    //   // provided http.Client.
    //   when(client.get(
    //           '"http://api.themoviedb.org/3/movie/popular?api_key=$_apiKey"'))
    //       .thenAnswer((_) async => http.Response('{"title": "Test"}', 200));

    //   expect(await fetchMovieList(client), isInstanceOf<Post>());
    // });

    // test('throws an exception if the http call completes with an error', () {
    //   final client = MockClient();

    //   // Use Mockito to return an unsuccessful response when it calls the
    //   // provided http.Client.
    //   when(client.get('https://jsonplaceholder.typicode.com/posts/1'))
    //       .thenAnswer((_) async => http.Response('Not Found', 404));

    //   expect(fetchMovieList(client), throwsException);
    // });
  });
}
