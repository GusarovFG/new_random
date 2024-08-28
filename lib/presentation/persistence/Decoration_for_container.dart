import 'package:flutter/material.dart';

class DecorationForContainer {
  static BoxDecoration decoration = BoxDecoration(
    border: Border.all(
      color: Colors.black,
      width: 3,
    ),
    color: Colors.white,
    boxShadow: const [
      BoxShadow(
        color: Colors.black,
        spreadRadius: 2,

        offset: Offset(8, 10), // changes position of shadow
      ),
    ],
  );
}
