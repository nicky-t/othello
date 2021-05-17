import 'package:flutter/material.dart';

import 'draw.dart';

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
          // Containerは不要？？
          Expanded(
            child: Container(child: drawOneLine()),
          ),
          Expanded(
            child: Container(child: drawOneLine()),
          ),
          Expanded(
            child: Container(child: drawOneLine()),
          ),
          Expanded(
            child: Container(child: drawOneLine()),
          ),
          Expanded(
            child: Container(child: drawOneLine()),
          ),
          Expanded(
            child: Container(child: drawOneLine()),
          ),
          Expanded(
            child: Container(child: drawOneLine()),
          ),
          Expanded(
            child: Container(child: drawOneLine()),
          ),
        ]),
      ),
    );
  }
}
