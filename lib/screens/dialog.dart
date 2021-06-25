import 'package:flutter/material.dart';

import 'package:othello/constants.dart';
import 'package:othello/judge.dart';

class DialogButton extends StatelessWidget {
  List<List<OthelloStatus>> list = initList;

  dialogText(int whiteCount, int blackCount) {
    if (whiteCount < blackCount) {
      return Container(
        child: Text(
          '黒の勝利',
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
          '白の勝利',
          style: TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
          ),
        ),
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
                child: Text('黒:'),
              ),
              Container(
                child: Text(count(OthelloStatus.black).toString()),
              ),
              Container(
                child: Text('枚'),
              ),
            ],
          ),
        ),
        Container(
          child: Row(
            children: <Widget>[
              Container(
                child: Text('白:'),
              ),
              Container(
                child: Text(count(OthelloStatus.white).toString()),
              ),
              Container(
                child: Text('枚'),
              ),
            ],
          ),
        ),
      ],
    );
  }

  int count(OthelloStatus othelloColor) {
    return OthelloLogic(myself: OthelloStatus.black, list: list)
        .counter(othelloColor);
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Text(
        '結果',
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
                      '結果',
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
                  child: Text('タイトルへ'),
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
