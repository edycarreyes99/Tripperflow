import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'capitales_event.dart';
part 'capitales_state.dart';

class CapitalesBloc extends Bloc<CapitalesEvent, CapitalesState> {
  CapitalesBloc() : super(CapitalesInitial());

  @override
  Stream<CapitalesState> mapEventToState(
    CapitalesEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
