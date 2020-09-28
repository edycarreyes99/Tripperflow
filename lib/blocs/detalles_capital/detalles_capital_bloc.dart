import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'detalles_capital_event.dart';
part 'detalles_capital_state.dart';

class DetallesCapitalBloc extends Bloc<DetallesCapitalEvent, DetallesCapitalState> {
  DetallesCapitalBloc() : super(DetallesCapitalInitial());

  @override
  Stream<DetallesCapitalState> mapEventToState(
    DetallesCapitalEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
