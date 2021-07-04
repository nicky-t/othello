import 'package:flutter/material.dart';
import 'package:othello/constants.dart';
import 'package:othello/judge.dart';

class DialogButton extends StatelessWidget {
  final List<List<OthelloStatus>> list;
  DialogButton(this.list);

  dialogText(int whiteCount, int blackCount) {
    if (whiteCount < blackCount) {
      return Container(
        child: Text(
          'player1 wins',
          style: TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
          ),
        ),
      );
    } else if (blackCount < whiteCount) {
      return Container(
        child: Text(
          'player2 wins',
          style: TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
          ),
        ),
      );
    } else {
      return Container(
        child: Text('DRAW'),
      );
    }
  }

  resultCount() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Container(
          child: Row(
            children: <Widget>[
              Container(
                child: Text('Black:'),
              ),
              Container(
                child: Text(count(OthelloStatus.black).toString()),
              ),
              Container(
                child: Text(''),
              ),
            ],
          ),
        ),
        Container(
          child: Row(
            children: <Widget>[
              Container(
                child: Text('White:'),
              ),
              Container(
                child: Text(count(OthelloStatus.white).toString()),
              ),
              Container(
                child: Text(''),
              ),
            ],
          ),
        ),
      ],
    );
  }

  int count(OthelloStatus othelloColor) {
    return OthelloLogic(list: list).counter(othelloColor);
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Text(
        'Result',
        style: TextStyle(
          fontSize: 50,
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.italic,
        ),
      ),
      onPressed: () async {
        // ダイアログを表示------------------------------------
        var result = await showDialog<int>(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    child: Text(
                      'Result',
                      style: TextStyle(
                        color: Colors.red,
                      ),
                    ),
                  ),
                  Container(
                    child: resultCount(),
                  ),
                ],
              ),
              content: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                      child: dialogText(count(OthelloStatus.white),
                          count(OthelloStatus.black)),
                    ),
                  ]),
              actions: <Widget>[
                TextButton(
                  child: Text('Cancel'),
                  onPressed: () => Navigator.of(context).pop(0),
                ),
                TextButton(
                  child: Text('Title'),
                  onPressed: () => Navigator.of(context).pop(1),
                ),
              ],
            );
          },
        );
        print('dialog result: $result');
        // --
      },
    );
  }
}
