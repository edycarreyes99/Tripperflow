import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Capitales",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w700,
            color: Colors.grey[900],
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.wb_sunny),
            color: Colors.grey[900],
            onPressed: () => print("Tema"),
            tooltip: "Seleccionar tema",
          ),
          IconButton(
            icon: Icon(Icons.sort),
            color: Colors.grey[900],
            onPressed: () => print("Buscar carpital"),
            tooltip: "Ordenar capitales",
          ),
          IconButton(
            icon: Icon(Icons.search),
            color: Colors.grey[900],
            onPressed: () => print("Buscar carpital"),
            tooltip: "Buscar capital",
          ),
        ],
      ),
      body: Center(
        child: Text("HomeView works!."),
      ),
    );
  }
}
