import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:othello/constants.dart';
import 'package:othello/screens/ai_othello_page.dart';

class ColorSelectPage extends StatefulWidget {
  @override
  _ColorSelectPageState createState() => _ColorSelectPageState();
}

class _ColorSelectPageState extends State<ColorSelectPage> {
  OthelloStatus selectedColor = OthelloStatus.black;
  OthelloStatus unSelectedColor = OthelloStatus.white;
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
                  style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.all(20),
                      shape: const StadiumBorder(),
                      side: const BorderSide(color: Colors.black),
                      primary: Colors.white,
                      onPrimary: Colors.black),
                  onPressed: () {
                    setState(() {
                      selectedColor = OthelloStatus.white;
                      unSelectedColor = OthelloStatus.black;
                      if (selectedColor == OthelloStatus.white) {
                        print('color:white');
                      }
                    });
                  },
                  child: Text(
                    'WHITE',
                    style: GoogleFonts.notoSerif(
                      textStyle: TextStyle(fontSize: 25),
                      color: Colors.black,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(8),
                  margin: EdgeInsets.all(8),
                ),
                OutlinedButton(
                  style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.all(20),
                      shape: const StadiumBorder(),
                      primary: Colors.black,
                      onPrimary: Colors.white),
                  onPressed: () {
                    setState(() {
                      selectedColor = OthelloStatus.black;
                      unSelectedColor = OthelloStatus.white;
                      if (selectedColor == OthelloStatus.black) {
                        print('color:black');
                      }
                    });
                  },
                  child: Text(
                    'BLACK',
                    style: GoogleFonts.notoSerif(
                      textStyle: TextStyle(fontSize: 25),
                      color: Colors.white,
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
                selectedColor == OthelloStatus.black
                    ? "あなたの色は BLACKです"
                    : "あなたの色は WHITEです",
                style: GoogleFonts.notoSerif(
                  textStyle: TextStyle(fontSize: 25),
                  color: Colors.black,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(8),
              margin: EdgeInsets.all(8),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
                onPrimary: Colors.lightBlue,
              ),
              onPressed: selectedColor == null
                  ? null
                  : () => {
                        // no.1
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AiOthelloPage(
                                myColor: selectedColor,
                                opponentColor: unSelectedColor,
                              ),
                            ))
                      },
              child: Text(
                'NEXT',
                style: GoogleFonts.notoSerif(
                  textStyle: TextStyle(fontSize: 35),
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
