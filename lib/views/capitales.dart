import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:tripperflow/models/Capital.dart';
import 'package:tripperflow/widgets/CapitalCard.dart';

class CapitalesView extends StatefulWidget {
  @override
  _CapitalesViewState createState() => _CapitalesViewState();
}

class _CapitalesViewState extends State<CapitalesView> {
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
        brightness: Brightness.light,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection("Capitales")
            .orderBy('Likes', descending: true)
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
                ),
                staggeredTileBuilder: (int index) => new StaggeredTile.fit(2),
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 20.0,
              );
          }
        },
      ),
    );
  }
}
