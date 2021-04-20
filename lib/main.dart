import 'package:flutter/material.dart';
import 'package:othello/stone.dart';
import 'input_page.dart';

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
      ),
    ),
  );
}
