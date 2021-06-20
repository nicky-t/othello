import 'package:flutter/material.dart';

import '../../constants.dart';
import 'stone_flip.dart';
import 'stones.dart';

Widget colorDetector({
  int columnIndex,
  int rowIndex,
  OthelloStatus turn = OthelloStatus.black,
  List<List<OthelloStatus>> listState,
  void Function({
    int columnIndex,
    int rowIndex,
  })
      setStone,
  void Function() setCanPut,
  void Function({
    int columnIndex,
    int rowIndex,
  })
      update,
  void Function() changeTurn,
  void Function() skip,
}) {
  if (listState[columnIndex][rowIndex] == OthelloStatus.white) {
    return Container(
      margin: EdgeInsets.all(1.0),
      color: Colors.green,
      child: StoneFlip(),
    );
  } else if (listState[columnIndex][rowIndex] == OthelloStatus.black) {
    return Container(
      margin: EdgeInsets.all(1.0),
      color: Colors.green,
      child: BlackStone(),
    );
  } else if (listState[columnIndex][rowIndex] == OthelloStatus.canPut) {
    return Container(
      margin: EdgeInsets.all(1.0),
      color: Colors.green,
      child: GestureDetector(
        onTap: () {
          setStone(
            columnIndex: columnIndex,
            rowIndex: rowIndex,
          );
          update(
            columnIndex: columnIndex,
            rowIndex: rowIndex,
          );
          changeTurn();
          setCanPut();
          skip();
        },
        child: GreyStone(),
      ),
    );
  } else {
    return Container(
      margin: EdgeInsets.all(1.0),
      color: Colors.green,
      child: GestureDetector(
        onTap: () {
          setCanPut();
          skip();
        },
      ),
    );
  }
}

class DrawHorizontal extends StatelessWidget {
  const DrawHorizontal({
    @required this.columnIndex,
    @required this.listState,
    @required this.setStone,
    @required this.setCanPut,
    @required this.update,
    @required this.changeTurn,
    @required this.skip,
  });

  final int columnIndex;
  final List<List<OthelloStatus>> listState;
  final void Function({int columnIndex, int rowIndex}) setStone;
  final void Function() setCanPut;
  final void Function({int columnIndex, int rowIndex}) update;
  final void Function() changeTurn;
  final void Function() skip;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(children: <Widget>[
        squares(rowIndex: 1),
        squares(rowIndex: 2),
        squares(rowIndex: 3),
        squares(rowIndex: 4),
        squares(rowIndex: 5),
        squares(rowIndex: 6),
        squares(rowIndex: 7),
        squares(rowIndex: 8),
      ]),
    );
  }

  Expanded squares({int rowIndex}) {
    return Expanded(
      child: colorDetector(
        columnIndex: columnIndex,
        rowIndex: rowIndex,
        listState: listState,
        setStone: setStone,
        setCanPut: setCanPut,
        update: update,
        changeTurn: changeTurn,
        skip: skip,
      ),
    );
  }
}
