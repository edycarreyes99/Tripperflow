part of 'capitales_bloc.dart';

abstract class CapitalesEvent extends Equatable {
  const CapitalesEvent();
}

class OnSortCapitales extends CapitalesEvent {
  final SharedPreferences preferences;

  OnSortCapitales({this.preferences});

  @override
  List<Object> get props => [preferences, preferences.getBool("sortDescending")];
}
