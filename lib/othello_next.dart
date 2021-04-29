import 'package:flutter/material.dart';
import 'stones.dart';

List<List<colour>> list = [
  [
    colour.none,
    colour.none,
    colour.none,
    colour.none,
    colour.none,
    colour.none,
    colour.none,
    colour.none,
  ],
  [
    colour.none,
    colour.none,
    colour.none,
    colour.none,
    colour.none,
    colour.none,
    colour.none,
    colour.none,
  ],
  [
    colour.none,
    colour.none,
    colour.none,
    colour.none,
    colour.none,
    colour.none,
    colour.none,
    colour.none,
  ],
  [
    colour.none,
    colour.none,
    colour.none,
    colour.black,
    colour.white,
    colour.none,
    colour.none,
    colour.none,
  ],
  [
    colour.none,
    colour.none,
    colour.none,
    colour.white,
    colour.black,
    colour.none,
    colour.none,
    colour.none,
  ],
  [
    colour.none,
    colour.none,
    colour.none,
    colour.none,
    colour.none,
    colour.none,
    colour.none,
    colour.none,
  ],
  [
    colour.none,
    colour.none,
    colour.none,
    colour.none,
    colour.none,
    colour.none,
    colour.none,
    colour.none,
  ],
  [
    colour.none,
    colour.none,
    colour.none,
    colour.none,
    colour.none,
    colour.none,
    colour.none,
    colour.none,
  ],
];

enum colour {
  black,
  white,
  none,
}

Widget colorDetector(int columnIndex, int rowIndex) {
  if (list[columnIndex][rowIndex] == colour.white) {
    return Container(
      margin: EdgeInsets.all(1.0),
      color: Colors.green,
      child: WhiteStone(),
    );
  } else if (list[columnIndex][rowIndex] == colour.black) {
    return Container(
      margin: EdgeInsets.all(1.0),
      color: Colors.green,
      child: BlackStone(),
    );
  } else {
    return Container(
      margin: EdgeInsets.all(1.0),
      color: Colors.green,
    );
  }
}
