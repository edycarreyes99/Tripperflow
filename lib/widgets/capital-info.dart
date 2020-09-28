import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CapitalInfoWidget extends StatefulWidget {
  final IconData icono;
  final String title;
  final String subTitle;
  final double fontSize;
  final FontWeight fontWeight;

  CapitalInfoWidget({
    Key key,
    @required this.icono,
    @required this.title,
    @required this.subTitle,
    this.fontSize,
    this.fontWeight,
  });

  @override
  _CapitalInfoWidgetState createState() => _CapitalInfoWidgetState();
}

class _CapitalInfoWidgetState extends State<CapitalInfoWidget> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  this.widget.icono,
                  color: Colors.grey[900],
                  size: 18,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 5),
                  child: Text(
                    this.widget.title,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Text(
            this.widget.subTitle,
            textAlign: TextAlign.justify,
            style: TextStyle(
              fontSize:
                  this.widget.fontSize != null ? this.widget.fontSize : 16,
              fontWeight: this.widget.fontWeight != null
                  ? this.widget.fontWeight
                  : FontWeight.w700,
            ),
          )
        ],
      ),
    );
  }
}
