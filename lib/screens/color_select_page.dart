import 'package:flutter/material.dart';
import 'package:othello/constants.dart';
import 'package:othello/screens/ai_othello_page.dart';

class ColorSelectPage extends StatefulWidget {
  @override
  _ColorSelectPageState createState() => _ColorSelectPageState();
}

class _ColorSelectPageState extends State<ColorSelectPage> {
  OthelloStatus selectedColor;
  OthelloStatus unSelectedColor;
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
                      unSelectedColor = OthelloStatus.black;
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
                      unSelectedColor = OthelloStatus.white;
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
                // no.1
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AiOthelloPage(
                        myColor: selectedColor,
                        opponentColor: unSelectedColor,
                      ),
                    ))

                //   // no.2
                //   Navigator.of(context)
                //       .pushNamed('/third', arguments: selectedColor)
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
