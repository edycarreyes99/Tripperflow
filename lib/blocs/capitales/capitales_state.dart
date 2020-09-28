part of 'capitales_bloc.dart';

abstract class CapitalesState extends Equatable {
  const CapitalesState();
}

class CapitalesInitialState extends CapitalesState {
  @override
  List<Object> get props => [];
}

/// Estados para [OnGetCapitales]
class FetchingCapitalesState extends CapitalesState {
  @override
  List<Object> get props => [];
}

class FetchedCapitalesState extends CapitalesState {
  @override
  List<Object> get props => [];
}

class EmptyCapitalesState extends CapitalesState {
  @override
  List<Object> get props => [];
}

class ErrorFetchingCapitalesState extends CapitalesState {
  final String message;

  ErrorFetchingCapitalesState(this.message);

  @override
  List<Object> get props => [message];
}
