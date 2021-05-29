import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';

import 'stones.dart';

class StoneFlip extends StatelessWidget {
  final GlobalKey<FlipCardState> cardKey = GlobalKey<FlipCardState>();

  @override
  Widget build(BuildContext context) {
    return FlipCard(
      key: cardKey,
      flipOnTouch: false,
      front: Container(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              primary: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(50)))),
          onPressed: () => cardKey.currentState.toggleCard(),
          child: WhiteStone(),
        ),
      ),
      back: Container(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              primary: Colors.black,
              onPrimary: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(50)))),
          onPressed: () => cardKey.currentState.toggleCard(),
          child: BlackStone(),
        ),
      ),
    );
  }
}
