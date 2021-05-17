import 'package:flutter/material.dart';
import 'othellonext.dart';

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

  void setStone(int columnIndex, int rowIndex,Colour color) {
    setState(() {
      list[columnIndex][rowIndex] = color;
    });
  }

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
            child: Container(child: drawHorizontal(0,list,setStone)),
          ),
          Expanded(
            child: Container(child: drawHorizontal(1,list,setStone)),
          ),
          Expanded(
            child: Container(child: drawHorizontal(2,list,setStone)),
          ),
          Expanded(
            child: Container(child: drawHorizontal(3,list,setStone)),
          ),
          Expanded(
            child: Container(child: drawHorizontal(4,list,setStone)),
          ),
          Expanded(
            child: Container(child: drawHorizontal(5,list,setStone)),
          ),
          Expanded(
            child: Container(child: drawHorizontal(6,list,setStone)),
          ),
          Expanded(
            child: Container(child: drawHorizontal(7,list,setStone)),
          ),
        ]),
      ),
    );
  }
}
Widget drawHorizontal(int columnIndex, List<List<Colour>> listState, Function(int columnIndex, int rowIndex,Colour color) setStone) {
  return Center(
    child: Row(children: <Widget>[
      Expanded(
          child: colorDetector(columnIndex, 0, listState,setStone) ),
      Expanded(
          child: colorDetector(columnIndex, 1, listState,setStone) ),
      Expanded(
          child: colorDetector(columnIndex, 2, listState,setStone) ),
      Expanded(
          child: colorDetector(columnIndex, 3, listState,setStone) ),
      Expanded(
          child: colorDetector(columnIndex, 4, listState,setStone) ),
      Expanded(
          child: colorDetector(columnIndex, 5, listState,setStone) ),
      Expanded(
          child: colorDetector(columnIndex, 6, listState,setStone) ),
      Expanded(
          child: colorDetector(columnIndex, 7, listState,setStone) ),
    ]),
  );
}


