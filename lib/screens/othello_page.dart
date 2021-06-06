import 'package:flutter/material.dart';
import 'package:othello/judge.dart';

import '../constants.dart';
import 'widgets/draw_horizontal.dart';

class OthelloPage extends StatefulWidget {
  @override
  _OthelloPageState createState() => _OthelloPageState();
}

class _OthelloPageState extends State<OthelloPage> {
  List<List<OthelloStatus>> list = initList;
  Turn turn = Turn.myself;
  final OthelloStatus myColor = OthelloStatus.black;
  final OthelloStatus opponentColor = OthelloStatus.white;

  void setStone({int columnIndex, int rowIndex}) {
    if (turn == Turn.myself) {
      setState(() {
        list[columnIndex][rowIndex] = myColor;
      });
      turn = Turn.opponent;
    } else {
      setState(() {
        list[columnIndex][rowIndex] = opponentColor;
      });
      turn = Turn.myself;
    }
  }

  void setCanPut() {
    if (turn == Turn.myself) {
      setState(() {
        OthelloLogic(
          myself: OthelloStatus.black,
          list: list,
          turn: OthelloStatus.black,
          nextTurn: OthelloStatus.white,
        ).updateCanPut();
      });
    } else {
      setState(() {
        OthelloLogic(
          myself: OthelloStatus.black,
          list: list,
          turn: OthelloStatus.white,
          nextTurn: OthelloStatus.black,
        ).updateCanPut();
      });
    }
  }
/*
  void update({int col, int row}) {
    OthelloLogic(
            myself: OthelloStatus.black,
            list: list,
            turn: OthelloStatus.black,
            nextTurn: OthelloStatus.white)
        .updateBoard(col, row);
  }
 */

  void update() {
    for (int i = 1; i < 9; i++) {
      for (int j = 1; j < 9; j++) {
        OthelloLogic(
                myself: OthelloStatus.black,
                list: list,
                turn: OthelloStatus.black,
                nextTurn: OthelloStatus.white)
            .updateBoard(i, j);
      }
    }
  }

  @override
  void initState() {
    setCanPut();
    // changeTurn();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Othello'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(10.0),
          color: Colors.black,
          width: 320,
          height: 320,
          child: Column(children: <Widget>[
            Expanded(
              child: Container(
                child: DrawHorizontal(
                  columnIndex: 1,
                  listState: list,
                  setStone: setStone,
                  setCanPut: setCanPut,
                  update: update,
                ),
              ),
            ),
            Expanded(
              child: Container(
                child: DrawHorizontal(
                  columnIndex: 2,
                  listState: list,
                  setStone: setStone,
                  setCanPut: setCanPut,
                  update: update,
                ),
              ),
            ),
            Expanded(
              child: Container(
                child: DrawHorizontal(
                  columnIndex: 3,
                  listState: list,
                  setStone: setStone,
                  setCanPut: setCanPut,
                  update: update,
                ),
              ),
            ),
            Expanded(
              child: Container(
                child: DrawHorizontal(
                  columnIndex: 4,
                  listState: list,
                  setStone: setStone,
                  setCanPut: setCanPut,
                  update: update,
                ),
              ),
            ),
            Expanded(
              child: Container(
                child: DrawHorizontal(
                  columnIndex: 5,
                  listState: list,
                  setStone: setStone,
                  setCanPut: setCanPut,
                  update: update,
                ),
              ),
            ),
            Expanded(
              child: Container(
                child: DrawHorizontal(
                  columnIndex: 6,
                  listState: list,
                  setStone: setStone,
                  setCanPut: setCanPut,
                  update: update,
                ),
              ),
            ),
            Expanded(
              child: Container(
                child: DrawHorizontal(
                  columnIndex: 7,
                  listState: list,
                  setStone: setStone,
                  setCanPut: setCanPut,
                  update: update,
                ),
              ),
            ),
            Expanded(
              child: Container(
                child: DrawHorizontal(
                  columnIndex: 8,
                  listState: list,
                  setStone: setStone,
                  setCanPut: setCanPut,
                  update: update,
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
