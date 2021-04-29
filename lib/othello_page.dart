import 'package:flutter/material.dart';
import 'othello_next.dart';

class OthelloPage extends StatefulWidget {
  @override
  _OthelloPageState createState() => _OthelloPageState();
}

class _OthelloPageState extends State<OthelloPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.all(10.0),
        color: Colors.black,
        width: 320,
        height: 320,
        child: Column(children: <Widget>[
          Expanded(
            child: Container(child: drawHorizontal(0)),
          ),
          Expanded(
            child: Container(child: drawHorizontal(1)),
          ),
          Expanded(
            child: Container(child: drawHorizontal(2)),
          ),
          Expanded(
            child: Container(child: drawHorizontal(3)),
          ),
          Expanded(
            child: Container(child: drawHorizontal(4)),
          ),
          Expanded(
            child: Container(child: drawHorizontal(5)),
          ),
          Expanded(
            child: Container(child: drawHorizontal(6)),
          ),
          Expanded(
            child: Container(child: drawHorizontal(7)),
          ),
        ]),
      ),
    );
  }
}

Widget drawHorizontal(int columnIndex) {
  return Center(
    child: Row(children: <Widget>[
      Expanded(child: colorDetector(columnIndex, 0)),
      Expanded(child: colorDetector(columnIndex, 1)),
      Expanded(child: colorDetector(columnIndex, 2)),
      Expanded(child: colorDetector(columnIndex, 3)),
      Expanded(child: colorDetector(columnIndex, 4)),
      Expanded(child: colorDetector(columnIndex, 5)),
      Expanded(child: colorDetector(columnIndex, 6)),
      Expanded(child: colorDetector(columnIndex, 7)),
    ]),
  );
}
