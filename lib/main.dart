import 'package:flutter/material.dart';

import 'screens/color_select_page.dart';
import 'screens/friend_othello_page.dart';
import 'screens/select_page.dart';

void main() {
  return runApp(
    MaterialApp(
        // home: OthelloPage(),
        home: SelectPage(),
        routes: <String, WidgetBuilder>{
          '/home': (BuildContext context) => new SelectPage(),
          '/second': (BuildContext context) => new ColorSelectPage(),
          '/fourth': (BuildContext context) => new FriendOthelloPage(),
        }),
  );
}
