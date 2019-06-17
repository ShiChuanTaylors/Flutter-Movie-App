import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie_list/pages/movie_list_page.dart';
import 'package:flutter_movie_list/resources/movie_repository.dart';

import 'blocs/movie/movie_bloc.dart';
import 'blocs/simple_bloc_delegate.dart';

void main() {
  BlocSupervisor.delegate = SimpleBlocDelegate();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  final movieBloc = new MovieBloc(repository: new MovieRepository());

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      bloc: movieBloc,
      child: MaterialApp(
        title: 'Movies Flutter',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        home: MovieListPage(title: 'My Movie List')
      )
    );
  }
}
