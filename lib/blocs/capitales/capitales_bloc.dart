import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'capitales_event.dart';

part 'capitales_state.dart';

class CapitalesBloc extends Bloc<CapitalesEvent, CapitalesState> {
  final BuildContext context;

  CapitalesBloc({this.context}) : super(CapitalesInitialState());

  @override
  Stream<CapitalesState> mapEventToState(
    CapitalesEvent event,
  ) async* {
    switch (event.runtimeType) {
      case OnFetchCapitales:
        yield FetchingCapitalesState();

        await Future.delayed(Duration(seconds: 2));

        yield EmptyCapitalesState();
        break;
    }
  }

  String getNombre() => "HOla mundo";
}
