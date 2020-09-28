import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.light.copyWith(
          systemNavigationBarColor: Colors.white,
          statusBarColor: Colors.white,
          systemNavigationBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.light),
    );
    return MaterialApp(
      title: 'Tripperflow',
      theme: lightTheme,
      debugShowCheckedModeBanner: !kReleaseMode,
      home: FutureBuilder(
        future: Firebase.initializeApp(),
        builder: (firebaseInitContext, firebaseInitSnapshot) {
          if (firebaseInitSnapshot.connectionState == ConnectionState.done) {
            return BlocProvider(
              create: (blocContext) => CapitalesBloc(),
              child: CapitalesView(),
            );
          } else {
            return Scaffold(
              body: Center(
                child: Image.asset(
                  'assets/images/Tripperflow-Logo.png',
                  width: 80,
                  height: 90,
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
