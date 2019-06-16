import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie_list/blocs/movie_bloc.dart';
import 'package:flutter_movie_list/blocs/movie_state.dart';
import 'package:flutter_movie_list/models/movies.dart';
import 'package:flutter_movie_list/pages/movie_details_page.dart';

class MovieListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _movieBloc = BlocProvider.of<MovieBloc>(context);

    return Container(
      child: Center(
        child: BlocBuilder(
          bloc: _movieBloc,
          builder: (context, MovieState state) {
            //No Movies loaded yet
            if (state is MovieEmpty) {
              return Center(child: CircularProgressIndicator());
            }

            //Error loading movies
            if (state is MovieError) {
              //TODO: implement proper error screen
              return Text(
                'Something went wrong!',
                style: TextStyle(color: Colors.red),
              );
            }

            //Loading movies
            if (state is MovieLoading) {
              return Center(child: CircularProgressIndicator());
            }

            //Movies loaded
            if (state is MovieLoaded) {
              return buildList(state.movies);
            }
          },
        ),
      ),
    );
  }

  Widget buildList(Movies movies) {
    print(movies.total_results);
    return GridView.builder(
        itemCount: movies.results.length,
        gridDelegate:
            new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
              onTap: () => Navigator.of(context)
                      .push(MaterialPageRoute(builder: (BuildContext context) {
                    return MovieDetailsPage(
                      data: movies.results[index],
                    );
                  })),
              child: Card(
                child: Stack(fit: StackFit.expand, children: <Widget>[
                  ClipRect(
                    clipper: _SquareClipper(),
                    child: Hero(
                      child: Image.network(
                        'https://image.tmdb.org/t/p/w185${movies.results[index].poster_path}',
                        fit: BoxFit.cover,
                      ),
                      tag: 'movie_${movies.results[index].id}',
                    ),
                  )
                ]),
              ));
        });
  }
}

class _SquareClipper extends CustomClipper<Rect> {
  @override
  Rect getClip(Size size) {
    return new Rect.fromLTWH(0.0, 0.0, size.width, size.width);
  }

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) {
    return false;
  }
}
