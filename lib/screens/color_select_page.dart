import 'package:flutter/material.dart';
import 'package:othello/constants.dart';

import 'othello_page.dart';

class ColorSelectPage extends StatefulWidget {
  @override
  _ColorSelectPageState createState() => _ColorSelectPageState();
}

class _ColorSelectPageState extends State<ColorSelectPage> {
  OthelloStatus selectedColor;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                OutlinedButton(
                  onPressed: () {
                    setState(() {
                      selectedColor = OthelloStatus.white;
                      print('color:$selectedColor');
                    });
                  },
                  child: Text(
                    'WHITE',
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(8),
                  margin: EdgeInsets.all(8),
                ),
                OutlinedButton(
                  onPressed: () {
                    setState(() {
                      selectedColor = OthelloStatus.black;
                      print('color:$selectedColor');
                    });
                  },
                  child: Text(
                    'BLACK',
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.all(8),
              margin: EdgeInsets.all(8),
            ),
            Container(
              child: Text(
                "your color $selectedColor",
                style: TextStyle(fontSize: 25),
              ),
            ),
            TextButton(
              onPressed: () => {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => OthelloPage(),
                    ))
              },
              child: Text(
                '次へ',
                style: TextStyle(fontSize: 30),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
