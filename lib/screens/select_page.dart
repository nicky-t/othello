import 'package:flutter/material.dart';
import 'package:othello/screens/othello_page.dart';

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
            ElevatedButton(
                onPressed: () => {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ColorSelectPage()))
                    },
                child: Text(
                  'AI',
                  style: TextStyle(fontSize: 50),
                )),
            Container(
              padding: EdgeInsets.all(8),
              margin: EdgeInsets.all(8),
            ),
            ElevatedButton(
                onPressed: () => {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => OthelloPage(),
                          ))
                    },
                child: Text(
                  '友達同士',
                  style: TextStyle(fontSize: 50),
                )),
          ],
        ),
      ),
    );
  }
}
