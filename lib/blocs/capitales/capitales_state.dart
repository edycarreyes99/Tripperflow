part of 'capitales_bloc.dart';

abstract class CapitalesState extends Equatable {
  const CapitalesState();
}

class CapitalesInitialState extends CapitalesState {
  @override
  List<Object> get props => [];
}

/// Estados para el evento [OnSortCapitales]
class ShowCapitalesDescending extends CapitalesState {
  @override
  List<Object> get props => [];
}

class ShowCapitalesAscending extends CapitalesState {
  @override
  List<Object> get props => [];
}
