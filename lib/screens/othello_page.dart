import 'package:flutter/material.dart';

import '../constants.dart';
import 'widgets/draw_horizontal.dart';

class OthelloPage extends StatefulWidget {
  @override
  _OthelloPageState createState() => _OthelloPageState();
}

class _OthelloPageState extends State<OthelloPage> {
  List<List<Colour>> list = [
    [
      Colour.none,
      Colour.none,
      Colour.none,
      Colour.none,
      Colour.none,
      Colour.none,
      Colour.none,
      Colour.none,
    ],
    [
      Colour.none,
      Colour.none,
      Colour.none,
      Colour.none,
      Colour.none,
      Colour.none,
      Colour.none,
      Colour.none,
    ],
    [
      Colour.none,
      Colour.none,
      Colour.none,
      Colour.none,
      Colour.none,
      Colour.none,
      Colour.none,
      Colour.none,
    ],
    [
      Colour.none,
      Colour.none,
      Colour.none,
      Colour.black,
      Colour.white,
      Colour.none,
      Colour.none,
      Colour.none,
    ],
    [
      Colour.none,
      Colour.none,
      Colour.none,
      Colour.white,
      Colour.black,
      Colour.none,
      Colour.none,
      Colour.none,
    ],
    [
      Colour.none,
      Colour.none,
      Colour.none,
      Colour.none,
      Colour.none,
      Colour.none,
      Colour.none,
      Colour.none,
    ],
    [
      Colour.none,
      Colour.none,
      Colour.none,
      Colour.none,
      Colour.none,
      Colour.none,
      Colour.none,
      Colour.none,
    ],
    [
      Colour.none,
      Colour.none,
      Colour.none,
      Colour.none,
      Colour.none,
      Colour.none,
      Colour.none,
      Colour.none,
    ],
  ];

  void setStone({int columnIndex, int rowIndex, Colour color}) {
    setState(() {
      list[columnIndex][rowIndex] = color;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Othello'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(10.0),
          color: Colors.black,
          width: 320,
          height: 320,
          child: Column(children: <Widget>[
            Expanded(
              child: Container(
                child: DrawHorizontal(
                  columnIndex: 0,
                  listState: list,
                  setStone: setStone,
                ),
              ),
            ),
            Expanded(
              child: Container(
                child: DrawHorizontal(
                  columnIndex: 1,
                  listState: list,
                  setStone: setStone,
                ),
              ),
            ),
            Expanded(
              child: Container(
                child: DrawHorizontal(
                  columnIndex: 2,
                  listState: list,
                  setStone: setStone,
                ),
              ),
            ),
            Expanded(
              child: Container(
                child: DrawHorizontal(
                  columnIndex: 3,
                  listState: list,
                  setStone: setStone,
                ),
              ),
            ),
            Expanded(
              child: Container(
                child: DrawHorizontal(
                  columnIndex: 4,
                  listState: list,
                  setStone: setStone,
                ),
              ),
            ),
            Expanded(
              child: Container(
                child: DrawHorizontal(
                  columnIndex: 5,
                  listState: list,
                  setStone: setStone,
                ),
              ),
            ),
            Expanded(
              child: Container(
                child: DrawHorizontal(
                  columnIndex: 6,
                  listState: list,
                  setStone: setStone,
                ),
              ),
            ),
            Expanded(
              child: Container(
                child: DrawHorizontal(
                  columnIndex: 7,
                  listState: list,
                  setStone: setStone,
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
