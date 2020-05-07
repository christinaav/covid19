import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget colorCard(String text, String fields, BuildContext context, Color color,
    String image) {
  final _media = MediaQuery.of(context).size;
  return Container(
    margin: EdgeInsets.only(top: 9, right: 9),
    padding: EdgeInsets.all(25),
    height: 120 * MediaQuery.of(context).size.height / 650.0,
    width: _media.width / 2 - 25,
    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(17),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          text,
          style: TextStyle(
            fontSize: 15,
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
          Text(
            "${fields.toString()}",
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            width: 3,
          ),
          Image.asset(
            image,
            color: Colors.white,
            height: 50.0,
            fit: BoxFit.cover,
          )
        ]),
      ],
    ),
  );
}

// ------------------------------------ switch card----------------------

Widget switchCard(
    String text, String fields, BuildContext context, Color color) {
  final _media = MediaQuery.of(context).size;
  return Container(
    margin: EdgeInsets.only(top: 9, right: 9),
    padding: EdgeInsets.all(25),
    height: 105 * MediaQuery.of(context).size.height / 500.0,
    width: _media.width / 3 - 20,
    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(17),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          text,
          style: TextStyle(
            fontSize: 15,
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          "${fields.toString()}",
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    ),
  );
}
