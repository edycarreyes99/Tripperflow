import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:tripperflow/blocs/capitales/capitales_bloc.dart';

class CapitalesView extends StatefulWidget {
  @override
  _CapitalesViewState createState() => _CapitalesViewState();
}

class _CapitalesViewState extends State<CapitalesView> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.light.copyWith(
        systemNavigationBarColor: Colors.white,
        statusBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.light,
      ),
    );

    BlocProvider.of<CapitalesBloc>(context).add(OnFetchCapitales());

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
        brightness: Brightness.light,
      ),
      body: BlocBuilder<CapitalesBloc, CapitalesState>(
        builder: (context, state) {
          return state is FetchingCapitalesState
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : StaggeredGridView.countBuilder(
                  crossAxisCount: 4,
                  itemCount: 20,
                  itemBuilder: (BuildContext context, int index) =>
                      new Container(
                    color: Colors.green,
                    child: new Center(
                      child: new CircleAvatar(
                        backgroundColor: Colors.white,
                        child: new Text('$index'),
                      ),
                    ),
                  ),
                  staggeredTileBuilder: (int index) => new StaggeredTile.fit(2),
                  mainAxisSpacing: 10.0,
                  crossAxisSpacing: 20.0,
                );
        },
      ),
    );
  }
}
