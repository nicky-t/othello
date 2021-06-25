import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:othello/judge.dart';

import 'dialog.dart';
import '../constants.dart';
import 'widgets/draw_horizontal.dart';

class FriendOthelloPage extends StatefulWidget {
  @override
  _FriendOthelloPageState createState() => _FriendOthelloPageState();
}

class _FriendOthelloPageState extends State<FriendOthelloPage> {
  // List<List<OthelloStatus>> list = initList;
  List<List<OthelloStatus>> list = [
    [
      OthelloStatus.edge,
      OthelloStatus.edge,
      OthelloStatus.edge,
      OthelloStatus.edge,
      OthelloStatus.edge,
      OthelloStatus.edge,
      OthelloStatus.edge,
      OthelloStatus.edge,
      OthelloStatus.edge,
      OthelloStatus.edge,
    ],
    [
      OthelloStatus.edge,
      OthelloStatus.none,
      OthelloStatus.none,
      OthelloStatus.none,
      OthelloStatus.none,
      OthelloStatus.none,
      OthelloStatus.none,
      OthelloStatus.none,
      OthelloStatus.none,
      OthelloStatus.edge,
    ],
    [
      OthelloStatus.edge,
      OthelloStatus.none,
      OthelloStatus.none,
      OthelloStatus.none,
      OthelloStatus.none,
      OthelloStatus.none,
      OthelloStatus.none,
      OthelloStatus.none,
      OthelloStatus.none,
      OthelloStatus.edge,
    ],
    [
      OthelloStatus.edge,
      OthelloStatus.none,
      OthelloStatus.none,
      OthelloStatus.none,
      OthelloStatus.none,
      OthelloStatus.none,
      OthelloStatus.none,
      OthelloStatus.none,
      OthelloStatus.none,
      OthelloStatus.edge,
    ],
    [
      OthelloStatus.edge,
      OthelloStatus.none,
      OthelloStatus.none,
      OthelloStatus.none,
      OthelloStatus.black,
      OthelloStatus.white,
      OthelloStatus.none,
      OthelloStatus.none,
      OthelloStatus.none,
      OthelloStatus.edge,
    ],
    [
      OthelloStatus.edge,
      OthelloStatus.none,
      OthelloStatus.none,
      OthelloStatus.none,
      OthelloStatus.white,
      OthelloStatus.black,
      OthelloStatus.none,
      OthelloStatus.none,
      OthelloStatus.none,
      OthelloStatus.edge,
    ],
    [
      OthelloStatus.edge,
      OthelloStatus.none,
      OthelloStatus.none,
      OthelloStatus.none,
      OthelloStatus.none,
      OthelloStatus.none,
      OthelloStatus.none,
      OthelloStatus.none,
      OthelloStatus.none,
      OthelloStatus.edge,
    ],
    [
      OthelloStatus.edge,
      OthelloStatus.none,
      OthelloStatus.none,
      OthelloStatus.none,
      OthelloStatus.none,
      OthelloStatus.none,
      OthelloStatus.none,
      OthelloStatus.none,
      OthelloStatus.none,
      OthelloStatus.edge,
    ],
    [
      OthelloStatus.edge,
      OthelloStatus.none,
      OthelloStatus.none,
      OthelloStatus.none,
      OthelloStatus.none,
      OthelloStatus.none,
      OthelloStatus.none,
      OthelloStatus.none,
      OthelloStatus.none,
      OthelloStatus.edge,
    ],
    [
      OthelloStatus.edge,
      OthelloStatus.edge,
      OthelloStatus.edge,
      OthelloStatus.edge,
      OthelloStatus.edge,
      OthelloStatus.edge,
      OthelloStatus.edge,
      OthelloStatus.edge,
      OthelloStatus.edge,
      OthelloStatus.edge,
    ],
  ];
  Turn turn = Turn.black;

  final OthelloStatus myColor = OthelloStatus.black;
  final OthelloStatus opponentColor = OthelloStatus.white;

  int gray = 0;
  bool showPass = false;
  bool showFinish = false;
  int none = 60;

  ///石を置く
  void setStone({int columnIndex, int rowIndex}) {
    if (turn == Turn.black) {
      setState(() {
        list[columnIndex][rowIndex] = OthelloStatus.black;
        none--;
      });
    } else {
      setState(() {
        list[columnIndex][rowIndex] = OthelloStatus.white;
        none--;
      });
    }
  }

  ///置ける位置を表示
  void setCanPut() {
    if (turn == Turn.black) {
      setState(() {
        OthelloLogic(
          list: list,
          turn: OthelloStatus.black,
          nextTurn: OthelloStatus.white,
        ).updateCanPut();
      });
    } else {
      setState(() {
        OthelloLogic(
          list: list,
          turn: OthelloStatus.white,
          nextTurn: OthelloStatus.black,
        ).updateCanPut();
      });
    }
    for (int i = 1; i < 9; i++) {
      for (int j = 1; j < 9; j++) {
        if (list[i][j] == OthelloStatus.canPut) {
          gray += 1;
        }
      }
    }
    print('gray$gray');
    print('turn: $turn');
    print('myColor: $myColor');
    print('opponentColor: $opponentColor');
    // print('nextTurn: $nextTurn');
  }

  ///盤面更新
  void update({int columnIndex, int rowIndex}) {
    if (turn == Turn.black) {
      OthelloLogic(
              list: list,
              turn: OthelloStatus.black,
              nextTurn: OthelloStatus.white)
          .updateBoard(columnIndex: columnIndex, rowIndex: rowIndex);
    } else {
      OthelloLogic(
              list: list,
              turn: OthelloStatus.white,
              nextTurn: OthelloStatus.black)
          .updateBoard(columnIndex: columnIndex, rowIndex: rowIndex);
    }
  }

  ///各石の数をカウント
  int count(OthelloStatus othelloColor) {
    return OthelloLogic(list: list).counter(othelloColor);
  }

  ///ターンの交代
  void changeTurn() {
    if (turn == Turn.black) {
      turn = Turn.white;
      gray = 0;
    } else {
      turn = Turn.black;
      gray = 0;
    }
    showPass = false;
  }

  ///置けないときに次のターンに進める
  void skip() {
    if (gray == 0) {
      if (!(none == 0)) {
        if (turn == Turn.black) {
          showPass = true;
          turn = Turn.white;
          setCanPut();
          finishResult();
        } else {
          showPass = true;
          turn = Turn.black;
          setCanPut();
          finishResult();
        }
      } else {
        showFinish = true;
      }
    }
  }

  finishResult() {
    if (turn == Turn.white && gray == 0) {
      showPass = false;
      showFinish = true;
    } else if (turn == Turn.black && gray == 0) {
      showPass = false;
      showFinish = true;
    }
  }

  ///パスの表示
  pass() {
    if (showPass) {
      return Text(
        "PASS",
        style: TextStyle(
          fontSize: 90,
          fontWeight: FontWeight.bold,
        ),
      );
    }
  }

  finish() {
    if (true) {
      return DialogButton();
    }
  }

  @override
  void initState() {
    setCanPut();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      appBar: AppBar(
        title: Text(
          'オセロ',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.blueAccent,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: pass(),
          ),
          Center(
            child: finish(),
          ),
          playerInformation(
              name: "player2",
              stoneColor: Colors.white,
              numberColor: Colors.black),
          Center(
            child: Container(
              margin: const EdgeInsets.all(10.0),
              color: Colors.black,
              width: 320,
              height: 320,
              child: Column(children: <Widget>[
                squares(columnIndex: 1),
                squares(columnIndex: 2),
                squares(columnIndex: 3),
                squares(columnIndex: 4),
                squares(columnIndex: 5),
                squares(columnIndex: 6),
                squares(columnIndex: 7),
                squares(columnIndex: 8),
              ]),
            ),
          ),
          playerInformation(
              name: "player1",
              stoneColor: Colors.black,
              numberColor: Colors.white),
        ],
      ),
    );
  }

  Expanded squares({int columnIndex}) {
    return Expanded(
      child: Container(
        child: DrawHorizontal(
          columnIndex: columnIndex,
          listState: list,
          setStone: setStone,
          setCanPut: setCanPut,
          update: update,
          changeTurn: changeTurn,
          skip: skip,
        ),
      ),
    );
  }

  Center playerInformation({String name, Color stoneColor, Color numberColor}) {
    return Center(
      child: Container(
        height: 60,
        width: 300,
        padding: EdgeInsets.all(10.0),
        margin: EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              child: Text(
                // "player2",
                name,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  constraints: BoxConstraints.expand(height: 35, width: 35),
                  margin: EdgeInsets.all(1.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: stoneColor,
                  ),
                  child: Center(
                    child: Container(
                      child: Text(
                        count(OthelloStatus.white).toString(),
                        style: TextStyle(
                          fontSize: 30,
                          color: numberColor,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  child: Text(
                    '枚',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
