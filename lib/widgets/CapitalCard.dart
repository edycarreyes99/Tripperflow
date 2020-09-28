import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tripperflow/blocs/detalles_capital/detalles_capital_bloc.dart';
import 'package:tripperflow/models/Capital.dart';
import 'package:tripperflow/views/datalles-capital.dart';

class CapitalCardWidget extends StatefulWidget {
  final Capital capital;
  final BuildContext context;
  final SharedPreferences preferences;

  CapitalCardWidget(
      {@required this.capital,
      @required this.context,
      @required this.preferences});

  @override
  _CapitalCardWidgetState createState() => _CapitalCardWidgetState();
}

class _CapitalCardWidgetState extends State<CapitalCardWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          this.widget.context,
          MaterialPageRoute(
            builder: (context) => BlocProvider(
              create: (blocContext) => DetallesCapitalBloc(),
              child: DetallesCapitalView(
                preferences: this.widget.preferences,
                capital: this.widget.capital,
              ),
            ),
          ),
        );
      },
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.all(12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(20),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 6,
                  blurRadius: 5,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Stack(
                children: [
                  CachedNetworkImage(
                    fit: BoxFit.fill,
                    imageUrl: this.widget.capital.coverCapital,
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
                  Positioned(
                    bottom: 0,
                    child: Container(
                      width: 200,
                      padding: EdgeInsets.all(10),
                      color: Colors.black.withOpacity(.17),
                      child: RichText(
                        text: TextSpan(
                          text: this.widget.capital.nombreCapital + "\n",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                          ),
                          children: [
                            TextSpan(
                              text: this.widget.capital.nombrePais,
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 10,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 8,
                    right: 10,
                    child: Row(
                      children: [
                        Text(
                          this.widget.capital.likes.toString(),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Icon(
                          Icons.thumb_up,
                          color: Colors.white,
                          size: 10,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
