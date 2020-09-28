part of 'capitales_bloc.dart';

abstract class CapitalesEvent extends Equatable {
  const CapitalesEvent();
}


class OnFetchCapitales extends CapitalesEvent {
  @override
  List<Object> get props => [];
}