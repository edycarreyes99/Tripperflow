part of 'capitales_bloc.dart';

abstract class CapitalesState extends Equatable {
  const CapitalesState();
}

class CapitalesInitialState extends CapitalesState {
  @override
  List<Object> get props => [];
}

/// Estados para el evento [OnMostrarSortDialog]
class ShowingSortDialog extends CapitalesState {
  @override
  List<Object> get props => [];
}
