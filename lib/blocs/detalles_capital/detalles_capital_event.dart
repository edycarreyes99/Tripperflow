part of 'detalles_capital_bloc.dart';

abstract class DetallesCapitalEvent extends Equatable {
  const DetallesCapitalEvent();
}

class IncrementLikes extends DetallesCapitalEvent {
  @override
  List<Object> get props => [];
}

class IncrementCapitalLikes extends DetallesCapitalEvent {
  final String idCapital;

  IncrementCapitalLikes({@required this.idCapital});

  @override
  // TODO: implement props
  List<Object> get props => [idCapital];
}
