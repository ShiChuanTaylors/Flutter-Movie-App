// Copyright 2018 The Flutter Architecture Sample Authors. All rights reserved.
// Use of this source code is governed by the MIT license that can be found
// in the LICENSE file.

import 'package:bloc/bloc.dart';

// We can extend `BlocDelegate` and override `onTransition` and `onError`
// in order to handle transitions and errors from all Blocs.


class SimpleBlocDelegate implements BlocDelegate {

  @override
  void onEvent(Bloc bloc, Object event) {
    print(event);
  }

  @override
  void onError(Bloc bloc, Object error, StackTrace stacktrace) {
    print(error);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    print(transition);
  }
}