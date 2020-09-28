import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tripperflow/blocs/capitales/capitales_bloc.dart';
import 'package:tripperflow/themes/light-theme.dart';
import 'package:tripperflow/views/capitales.dart';

void main() {
  runApp(TripperflowApp());
}

class TripperflowApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tripperflow',
      theme: lightTheme,
      debugShowCheckedModeBanner: !kReleaseMode,
      home: BlocProvider(
        create: (context) => CapitalesBloc(context: context),
        child: CapitalesView(),
      ),
    );
  }
}
