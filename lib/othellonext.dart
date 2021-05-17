import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'stone.dart';
import 'animation.dart';

enum Colour {
  black,
  white,
  none,
}

Widget colorDetector(int columnIndex, int rowIndex, List<List<Colour>> listState, Function(int columnIndex, int rowIndex,Colour color) setStone) {
  if (listState[columnIndex][rowIndex] == Colour.white) {
    return Container(
      margin: EdgeInsets.all(1.0),
      color: Colors.green,
      child: StoneFlip(),
    );
  } else if (listState[columnIndex][rowIndex] == Colour.black) {
    return Container(
      margin: EdgeInsets.all(1.0),
      color: Colors.green,
      child: BlackStone(),
    );
  } else if (listState[columnIndex][rowIndex] == Colour.none) {
    return Container(
    margin: EdgeInsets.all(1.0),
  color: Colors.green,
      child: GestureDetector(
        onTap: (){
          setStone(columnIndex, rowIndex,Colour.black);
          },
      ),
  );
  }
}