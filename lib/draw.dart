import 'package:flutter/material.dart';

Widget drawOneLine() {
  return Center(
    child: Row(children: <Widget>[
      NewWidget(),
      NewWidget(),
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
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(1.0),
        color: Colors.green,
      ),
    );
  }
}
