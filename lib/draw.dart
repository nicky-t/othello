import 'package:flutter/material.dart';
import 'package:othello/stone.dart';

Widget drawOneLine(){
  return Center(
    child: Row(children: <Widget>[
      NewWidget(contents: BlStone(),),
      NewWidget(contents: WhStone(),),
      NewWidget(),
      NewWidget(),
      NewWidget(),
      NewWidget(),
      NewWidget(),
      NewWidget(),
    ]),
  );
}

class NewWidget extends StatelessWidget {
  NewWidget({this.contents});
  final contents;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(1.0),
        color: Colors.green,
        child: contents,
      ),
    );
  }
}