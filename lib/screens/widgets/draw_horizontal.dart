import 'package:flutter/material.dart';

import 'stone_flip.dart';
import '../../constants.dart';
import 'stones.dart';

class DrawHorizontal extends StatelessWidget {
  const DrawHorizontal({
    @required this.columnIndex,
    @required this.listState,
    @required this.setStone,
  });

  final int columnIndex;
  final List<List<Colour>> listState;
  final void Function({int columnIndex, int rowIndex, Colour color}) setStone;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(children: <Widget>[
        Expanded(
          child: colorDetector(
            columnIndex: columnIndex,
            rowIndex: 0,
            listState: listState,
            setStone: setStone,
          ),
        ),
        Expanded(
          child: colorDetector(
            columnIndex: columnIndex,
            rowIndex: 1,
            listState: listState,
            setStone: setStone,
          ),
        ),
        Expanded(
          child: colorDetector(
            columnIndex: columnIndex,
            rowIndex: 2,
            listState: listState,
            setStone: setStone,
          ),
        ),
        Expanded(
          child: colorDetector(
            columnIndex: columnIndex,
            rowIndex: 3,
            listState: listState,
            setStone: setStone,
          ),
        ),
        Expanded(
          child: colorDetector(
            columnIndex: columnIndex,
            rowIndex: 4,
            listState: listState,
            setStone: setStone,
          ),
        ),
        Expanded(
          child: colorDetector(
            columnIndex: columnIndex,
            rowIndex: 5,
            listState: listState,
            setStone: setStone,
          ),
        ),
        Expanded(
          child: colorDetector(
            columnIndex: columnIndex,
            rowIndex: 6,
            listState: listState,
            setStone: setStone,
          ),
        ),
        Expanded(
          child: colorDetector(
            columnIndex: columnIndex,
            rowIndex: 7,
            listState: listState,
            setStone: setStone,
          ),
        ),
      ]),
    );
  }
}

Widget colorDetector({
  int columnIndex,
  int rowIndex,
  List<List<Colour>> listState,
  void Function({int columnIndex, int rowIndex, Colour color}) setStone,
}) {
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
  } else if (listState[columnIndex][rowIndex] == Colour.gray) {
    return Container(
      margin: EdgeInsets.all(1.0),
      color: Colors.green,
      child: GreyStone(),
    );
  } else {
    return Container(
      margin: EdgeInsets.all(1.0),
      color: Colors.green,
      child: GestureDetector(
        onTap: () {
          setStone(
            columnIndex: columnIndex,
            rowIndex: rowIndex,
            color: Colour.black,
          );
        },
      ),
    );
  }
}
