import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tripperflow/models/Capital.dart';
import 'package:tripperflow/widgets/capital-info.dart';

class DetallesCapitalView extends StatefulWidget {
  final SharedPreferences preferences;
  final Capital capital;

  DetallesCapitalView({
    Key key,
    @required this.preferences,
    @required this.capital,
  }) : super(key: key);

  @override
  _DetallesCapitalViewState createState() => _DetallesCapitalViewState();
}

class _DetallesCapitalViewState extends State<DetallesCapitalView> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("Capitales")
            .doc(this.widget.capital.idCapital)
            .snapshots(),
        builder: (documentContext,
            AsyncSnapshot<DocumentSnapshot> documentSnapshot) {
          if (documentSnapshot.connectionState == ConnectionState.waiting) {
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else {
            Capital capital = new Capital.parse(documentSnapshot.data.data());
            return Scaffold(
              backgroundColor: Colors.white,
              body: CustomScrollView(
                slivers: [
                  SliverAppBar(
                    title: Text(
                      capital.nombreCapital,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    expandedHeight: 350,
                    flexibleSpace: FlexibleSpaceBar(
                      background: CachedNetworkImage(
                        fit: BoxFit.fill,
                        imageUrl: capital.coverCapital,
                        progressIndicatorBuilder:
                            (context, url, downloadProgress) => Container(
                          width: 100,
                          height: 100,
                          child: Center(
                            child: CircularProgressIndicator(
                              value: downloadProgress.progress,
                            ),
                          ),
                        ),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      ),
                    ),
                  ),
                  SliverList(
                    delegate: SliverChildListDelegate(
                      [
                        Padding(
                          padding: EdgeInsets.only(top: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              CapitalInfoWidget(
                                icono: Icons.my_location,
                                title: "Locación",
                                subTitle: capital.nombrePais,
                              ),
                              CapitalInfoWidget(
                                icono: Icons.thumb_up,
                                title: "Likes",
                                subTitle: capital.likes.toString(),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              CapitalInfoWidget(
                                icono: Icons.people,
                                title: "Población",
                                subTitle: capital.poblacion.toString(),
                              ),
                              CapitalInfoWidget(
                                icono: Icons.landscape,
                                title: "Superficie",
                                subTitle: capital.superficie.toString(),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              CapitalInfoWidget(
                                icono: Icons.arrow_upward,
                                title: "Altitud",
                                subTitle: capital.altitud.toString(),
                              ),
                              CapitalInfoWidget(
                                icono: Icons.wb_sunny,
                                title: "Temperatura",
                                subTitle:
                                    capital.temperaturaMediaAnual.toString(),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            top: 30,
                            bottom: 30,
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            child: CapitalInfoWidget(
                                icono: Icons.history,
                                title: "Reseña histórica",
                                subTitle: capital.resenaHistorica,
                                fontSize: 14,
                                fontWeight: FontWeight.w500),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            );
          }
        });
  }
}
