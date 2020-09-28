import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'detalles_capital_event.dart';

part 'detalles_capital_state.dart';

class DetallesCapitalBloc
    extends Bloc<DetallesCapitalEvent, DetallesCapitalState> {
  DetallesCapitalBloc() : super(DetallesCapitalInitial());

  @override
  Stream<DetallesCapitalState> mapEventToState(
    DetallesCapitalEvent event,
  ) async* {
    switch (event.runtimeType) {
      case IncrementCapitalLikes:
        await FirebaseFirestore.instance
            .collection('Capitales')
            .doc(event.props[0])
            .update({"Likes": FieldValue.increment(1)});
        break;
    }
  }
}
