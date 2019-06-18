import 'package:flutter/material.dart';
import 'package:flutter_movie_list/models/movies.dart';
import 'package:flutter_movie_list/pages/movie_details_page.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:image_test_utils/image_test_utils.dart';

// "page": 1,
// "total_results": 19838,
// "total_pages": 992,
// "results": [
//   {
//     "vote_count": 12,
//     "id": 532321,
//     "video": false,
//     "vote_average": 4.7,
//     "title": "Re: Zero kara Hajimeru Isekai Seikatsu - Memory Snow",
//     "popularity": 288.706,
//     "poster_path": "/xqR4ABkFTFYe8NDJi3knwWX7zfn.jpg",
//     "original_language": "ja",
//     "original_title": "Re:Memory Snow",
//     "genre_ids": [16, 12],
//     "backdrop_path": "/8sNz2DxYiYqGkxk66U8BqvuZZjE.jpg",
//     "adult": false,
//     "overview": "testing data",
//     "release_date": "2018-10-06"
//   }
// ]

void main() {
  group('MovieDetailsPage', () {
    Movies mockData;
    setUp(() {
      mockData = new Movies.fromJson({
        "results": [
          {
            "vote_count": 12,
            "id": 532321,
            "video": false,
            "vote_average": 4.7,
            "title": "Memory Snow",
            "popularity": 288.706,
            "poster_path": "/xqR4ABkFTFYe8NDJi3knwWX7zfn.jpg",
            "original_language": "ja",
            "original_title": "Re:Memory Snow",
            "genre_ids": [16, 12],
            "backdrop_path": "/8sNz2DxYiYqGkxk66U8BqvuZZjE.jpg",
            "adult": false,
            "overview": "testing data",
            "release_date": "2018-10-06"
          }
        ]
      });
    });

    testWidgets('renders correctly', (WidgetTester tester) async {

      provideMockedNetworkImages(() async {
        await tester.pumpWidget(MaterialApp(
            home: Scaffold(body: MovieDetailsPage(data: mockData.results[0]))));
        await tester.pumpAndSettle();
        expect(find.byKey(Key("MOVIE_DETAILS_PAGE")), findsOneWidget);
        expect(find.text('Memory Snow'), findsOneWidget);
      });
    });

    testWidgets('Navigates to Movie Details page when click on movie item',
        (WidgetTester tester) async {});
  });
}
