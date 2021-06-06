import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:othello/judge.dart';
import 'package:othello/screens/widgets/stones.dart';

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

  void setCanPut({OthelloStatus myself}) {
    setState(() {
      OthelloLogic(myself: myself, listState: list).updateCanPut();
    });
  }

  void changeTurn() {
    setState(() {
      OthelloLogic(myself: OthelloStatus.black, listState: list).changeTurn();
    });
  }

  void update() {
    for (int i = 1; i < 9; i++) {
      for (int j = 1; j < 9; j++) {
        OthelloLogic(myself: OthelloStatus.black, listState: list)
            .updateBoard(i, j);
      }
    }
  }

  int count(OthelloStatus othelloColor){
return OthelloLogic(myself: OthelloStatus.black, listState: list).counter(othelloColor);
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
        title: Text('オセロ',
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
      child:
        Container(
        height: 60,
        width: 300,
        padding: EdgeInsets.all(10.0),
        margin: EdgeInsets.all(10.0),
        child:
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
               child: Text("AI",
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
                    color: Colors.white,
                  ),
                 child: Center(
                   child: Container(
                     child: Text(count(OthelloStatus.white).toString(),
                       style: TextStyle(
                         fontSize: 30,
                         color: Colors.black,
                       ),
                     ),
                   ),
                 ),
                ),
              Container(
                child: Text("枚",
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
          ),
          Center(
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
                      changeTurn: changeTurn,
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
                      changeTurn: changeTurn,
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
                      changeTurn: changeTurn,
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
                      changeTurn: changeTurn,
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
                      changeTurn: changeTurn,
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
                      changeTurn: changeTurn,
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
                      changeTurn: changeTurn,
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
                      changeTurn: changeTurn,
                      update: update,
                    ),
                  ),
                ),
              ]),
            ),
          ),
              Center(
                child: Container(
                  height: 60,
                  width: 300,
                  padding: EdgeInsets.all(10.0),
                  margin: EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                    Container(
                     child: Text("player",
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
                      color: Colors.black,
                    ),
                      child: Center(
                        child: Container(
                          child: Text(count(OthelloStatus.black).toString(),
                            style: TextStyle(
                              fontSize: 30,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                 Container(
                  child: Text("枚",
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
              ),
        ],
      ),
    );
  }
}

