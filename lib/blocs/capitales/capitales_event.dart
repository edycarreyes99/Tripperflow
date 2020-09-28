part of 'capitales_bloc.dart';

abstract class CapitalesEvent extends Equatable {
  const CapitalesEvent();
}

class OnMostrarSortDialog extends CapitalesEvent {
  final bool sortDescending;

  OnMostrarSortDialog({this.sortDescending});

  @override
  List<Object> get props => [];
}
