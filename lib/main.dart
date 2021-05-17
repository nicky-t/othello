import 'package:flutter/material.dart';
import 'othellopage.dart';
import 'animation.dart';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('Othello'),
          backgroundColor: Colors.blue,
        ),
        body: OthelloPage(),
        //body: StoneFlip(),
      ),
    ),
  );
}
