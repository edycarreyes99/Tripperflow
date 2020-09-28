import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'capitales_event.dart';

part 'capitales_state.dart';

class CapitalesBloc extends Bloc<CapitalesEvent, CapitalesState> {
  final BuildContext context;
  bool sortDescending = true;

  CapitalesBloc({this.context}) : super(CapitalesInitialState());

  @override
  Stream<CapitalesState> mapEventToState(
    CapitalesEvent event,
  ) async* {
    switch (event.runtimeType) {
      case OnSortCapitales:
        await (event.props[0] as SharedPreferences)
            .setBool("sortDescending", !event.props[1]);
        if (event.props[1]) {
          yield ShowCapitalesDescending();
        } else {
          yield ShowCapitalesAscending();
        }
        break;
    }
  }
}
