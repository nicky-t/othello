import 'package:flutter/material.dart';

import 'screens/ai_othello_page.dart';
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
          '/third': (BuildContext context) => new AiOthelloPage(),
          '/fourth': (BuildContext context) => new FriendOthelloPage(),
        }),
  );
}
