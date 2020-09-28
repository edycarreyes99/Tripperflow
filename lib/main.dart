import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tripperflow/blocs/capitales/capitales_bloc.dart';
import 'package:tripperflow/themes/light-theme.dart';
import 'package:tripperflow/views/capitales.dart';
import 'package:tripperflow/views/waiting.dart';

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
      home: FutureBuilder<FirebaseApp>(
        future: Firebase.initializeApp(),
        builder: (firebaseInitContext,
            AsyncSnapshot<FirebaseApp> firebaseInitSnapshot) {
          if (firebaseInitSnapshot.connectionState == ConnectionState.done) {
            print("Firebase connection done!.");
            return FutureBuilder<SharedPreferences>(
              future: SharedPreferences.getInstance(),
              builder: (sharedPrefsContext,
                  AsyncSnapshot<SharedPreferences> sharedPrefsSnapshot) {
                if (sharedPrefsSnapshot.connectionState ==
                    ConnectionState.done) {
                  print("SharedPreferences connection done!.");
                  return BlocProvider(
                    create: (blocContext) => CapitalesBloc(),
                    child: CapitalesView(
                      sharedPreferences: sharedPrefsSnapshot.data,
                    ),
                  );
                } else {
                  return WaitingView();
                }
              },
            );
          } else {
            return WaitingView();
          }
        },
      ),
    );
  }
}
