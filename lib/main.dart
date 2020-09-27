import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:tripperflow/themes/light-theme.dart';
import 'package:tripperflow/views/home.dart';

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
      home: HomeView(),
    );
  }
}
