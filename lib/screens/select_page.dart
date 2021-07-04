import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:othello/screens/friend_othello_page.dart';

import 'color_select_page.dart';

class SelectPage extends StatefulWidget {
  @override
  _SelectPageState createState() => _SelectPageState();
}

class _SelectPageState extends State<SelectPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  primary: Colors.white54,
                  onPrimary: Colors.black,
                ),
                onPressed: () => {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ColorSelectPage()))
                    },
                icon: Icon(Icons.person,size: 40,),
                label: Text(
                  '1人用',
                  style:
                      GoogleFonts.notoSerif(textStyle: TextStyle(fontSize: 50)),
                )),
            Container(
              padding: EdgeInsets.all(8),
              margin: EdgeInsets.all(8),
            ),
            ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  primary: Colors.white54,
                  onPrimary: Colors.black,
                ),
                onPressed: () => {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => FriendOthelloPage(),
                          ))
                    },
                icon: Icon(
                  Icons.people_alt_outlined,
                  size: 40,
                ),
                label: Text(
                  '2人用',
                  style:
                      GoogleFonts.notoSerif(textStyle: TextStyle(fontSize: 50)),
                )),
          ],
        ),
      ),
    );
  }
}
