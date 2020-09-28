import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tripperflow/blocs/capitales/capitales_bloc.dart';
import 'package:tripperflow/models/Capital.dart';
import 'package:tripperflow/widgets/CapitalCard.dart';

enum SortTypes { ascending, descending }

class CapitalesView extends StatefulWidget {
  final SharedPreferences sharedPreferences;

  CapitalesView({Key key, @required this.sharedPreferences}) : super(key: key);

  @override
  _CapitalesViewState createState() => _CapitalesViewState();
}

class _CapitalesViewState extends State<CapitalesView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (this.widget.sharedPreferences.getBool("sortDescending") == null) {
      setDescending();
    }
  }

  @override
  Widget build(BuildContext context) {
    // Se ejecuta el metodo para ordenar las capitales
    BlocProvider.of<CapitalesBloc>(context).add(
      OnSortCapitales(
        preferences: this.widget.sharedPreferences,
      ),
    );
    return BlocBuilder<CapitalesBloc, CapitalesState>(
        builder: (capitalesContext, capitalesState) {
      return Scaffold(
        key: this.widget.key,
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
              icon: capitalesState is ShowCapitalesAscending
                  ? Icon(Icons.vertical_align_top)
                  : capitalesState is ShowCapitalesDescending
                      ? Icon(Icons.vertical_align_bottom)
                      : Icon(Icons.sort_by_alpha),
              color: Colors.grey[900],
              onPressed: () => BlocProvider.of<CapitalesBloc>(context).add(
                OnSortCapitales(
                  preferences: this.widget.sharedPreferences,
                ),
              ),
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
        body: StreamBuilder<QuerySnapshot>(
          stream: capitalesState is ShowCapitalesDescending
              ? FirebaseFirestore.instance
                  .collection("Capitales")
                  .orderBy('Likes', descending: true)
                  .snapshots()
              : FirebaseFirestore.instance
                  .collection("Capitales")
                  .orderBy('Likes', descending: false)
                  .snapshots(),
          builder: (BuildContext streamBuilderContext,
              AsyncSnapshot<QuerySnapshot> capitalSnapshot) {
            if (capitalSnapshot.hasError)
              return Center(
                  child: Padding(
                padding: EdgeInsets.all(18),
                child: Text(
                    "Hubo un error al extraer las capitales de firestore: ${capitalSnapshot.error}"),
              ));

            switch (capitalSnapshot.connectionState) {
              case ConnectionState.waiting:
                return Center(child: CircularProgressIndicator());
              default:
                List<Capital> capitales = new List<Capital>();

                capitalSnapshot.data.docs.forEach((element) {
                  capitales.add(Capital.parse(element.data()));
                });

                return StaggeredGridView.countBuilder(
                  crossAxisCount: 4,
                  itemCount: capitalSnapshot.data.docs.length,
                  itemBuilder: (BuildContext context, int index) =>
                      CapitalCardWidget(
                    capital: capitales[index],
                    context: context,
                    preferences: this.widget.sharedPreferences,
                  ),
                  staggeredTileBuilder: (int index) => new StaggeredTile.fit(2),
                  mainAxisSpacing: 10.0,
                  crossAxisSpacing: 20.0,
                );
            }
          },
        ),
      );
    });
  }

  void setDescending() async {
    await this.widget.sharedPreferences.setBool("sortDescending", false);
  }
}
