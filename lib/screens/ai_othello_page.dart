import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:othello/judge.dart';

import '../constants.dart';
import 'widgets/draw_horizontal.dart';

class AiOthelloPage extends StatefulWidget {
  ///color_select_pageからデータの受け取り
  final OthelloStatus myColor;
  final OthelloStatus opponentColor;

  const AiOthelloPage({
    Key key,
    @required this.myColor,
    @required this.opponentColor,
  }) : super(key: key);

  @override
  _AiOthelloPageState createState() => _AiOthelloPageState();
}

class _AiOthelloPageState extends State<AiOthelloPage> {
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

  OthelloStatus turn = OthelloStatus.black;

  int gray = 0;
  bool showPass = false;
  int none = 60;

  ///石を置く
  void setStone({int columnIndex, int rowIndex}) {
    if (turn == widget.myColor) {
      setState(() {
        list[columnIndex][rowIndex] = widget.myColor;
        none--;
      });
    } else {
      setState(() {
        list[columnIndex][rowIndex] = widget.opponentColor;
        none--;
      });
    }
  }

  ///置ける位置の表示
  void setCanPut() {
    if (turn == widget.myColor) {
      setState(() {
        OthelloLogic(
          list: list,
          turn: widget.myColor,
          nextTurn: widget.opponentColor,
        ).updateCanPut();
      });
    } else {
      setState(() {
        OthelloLogic(
          list: list,
          turn: widget.opponentColor,
          nextTurn: widget.myColor,
        ).updateCanPut();
      });
    }

    ///置ける位置の数をカウント
    for (int i = 1; i < 9; i++) {
      for (int j = 1; j < 9; j++) {
        if (list[i][j] == OthelloStatus.canPut) {
          gray += 1;
        }
      }
    }
    print('gray$gray');
    print('turn: $turn');
    print('myColor: ${widget.myColor}');
    print('opponentColor: ${widget.opponentColor}');
    // print('nextTurn: $nextTurn');
  }

  ///ボードの更新
  void update({int columnIndex, int rowIndex}) {
    if (turn == widget.myColor) {
      OthelloLogic(
        list: list,
        turn: widget.myColor,
        nextTurn: widget.opponentColor,
      ).updateBoard(columnIndex: columnIndex, rowIndex: rowIndex);
    } else {
      OthelloLogic(
        list: list,
        turn: widget.opponentColor,
        nextTurn: widget.myColor,
      ).updateBoard(columnIndex: columnIndex, rowIndex: rowIndex);
    }
  }

  ///各石をカウント
  int count(OthelloStatus othelloColor) {
    return OthelloLogic(list: list).counter(othelloColor);
  }

  ///ターンの交代
  void changeTurn() {
    if (turn == widget.myColor) {
      turn = widget.opponentColor;
      gray = 0;
    } else {
      turn = widget.myColor;
      gray = 0;
    }
    showPass = false;
  }

  ///置けないときにターンを飛ばす
  void skip() {
    if (gray == 0) {
      if (!(none == 0)) {
        if (turn == widget.myColor) {
          showPass = true;
          turn = widget.opponentColor;
          setCanPut();
        } else {
          showPass = true;
          turn = widget.myColor;
          setCanPut();
        }
      }
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

  ///石の数を表示する背景の石のいろを合わせる
  aiColor() {
    if (widget.myColor == OthelloStatus.black) {
      return Container(
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
      );
    } else {
      return Container(
        constraints: BoxConstraints.expand(height: 35, width: 35),
        margin: EdgeInsets.all(1.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: Colors.black,
        ),
        child: Center(
          child: Container(
            child: Text(
              count(OthelloStatus.black).toString(),
              style: TextStyle(
                fontSize: 30,
                color: Colors.white,
              ),
            ),
          ),
        ),
      );
    }
  }

  ///石の数を表示する背景の石のいろを合わせる
  playerColor() {
    if (widget.myColor == OthelloStatus.black) {
      return Container(
        constraints: BoxConstraints.expand(height: 35, width: 35),
        margin: EdgeInsets.all(1.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: Colors.black,
        ),
        child: Center(
          child: Container(
            child: Text(
              count(OthelloStatus.black).toString(),
              style: TextStyle(
                fontSize: 30,
                color: Colors.white,
              ),
            ),
          ),
        ),
      );
    } else {
      return Container(
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
      );
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
          playerInfomation(name: "AI", contents: aiColor()),
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
          playerInfomation(name: "player", contents: playerColor())
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

  Center playerInfomation({String name, Widget contents}) {
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
                  child: contents,
                ),
                Container(
                  child: Text(
                    "枚",
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
