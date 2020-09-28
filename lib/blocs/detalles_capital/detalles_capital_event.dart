part of 'detalles_capital_bloc.dart';

abstract class DetallesCapitalEvent extends Equatable {
  const DetallesCapitalEvent();
}

class IncrementLikes extends DetallesCapitalEvent {
  @override
  List<Object> get props => [];
}
