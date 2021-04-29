import 'package:flutter/material.dart';

import 'othello_page.dart';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Othello'),
          backgroundColor: Colors.blue,
        ),
        body: OthelloPage(),
      ),
    ),
  );
}
