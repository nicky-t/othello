import 'package:flutter/material.dart';

import 'package:othello/constants.dart';
import 'package:othello/judge.dart';


class DialogButton extends StatelessWidget {
  List<List<OthelloStatus>> list = initList;

  dialogText (int whiteCount, int blackCount) {
    if (whiteCount < blackCount){
      return Container(
        child: Text('黒の勝ち',
          style: TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
          ),
        ),
      );
    } else if (blackCount < whiteCount) {
      return Container(
        child: Text('白の勝ち',
          style: TextStyle(
            fontSize: 35,
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
          ),
        ),
      );
    }
  }

  int count(OthelloStatus othelloColor) {
    return OthelloLogic(myself: OthelloStatus.black, list: list)
        .counter(othelloColor);
  }



  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Text('結果',
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
              //backgroundColor: Colors.grey,
              title:
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget> [
                  Container(
                    child: Text('結果'),),
                /*Container(
                constraints: BoxConstraints.expand(height: 35, width: 35),
                margin: EdgeInsets.all(1.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Colors.white,
                ),
                 child: Center(
                  child: Container(
                    child: Text(
                      count(OthelloStatus.white).toString(),
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),*/
                ],
              ),
              content: dialogText(count(OthelloStatus.white), count(OthelloStatus.black)),
              /*Text('You Win!!',
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
              ),
              ),*/
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
