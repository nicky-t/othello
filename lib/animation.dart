import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';

import 'stone.dart';

class StoneFlip extends StatelessWidget {
  GlobalKey<FlipCardState> cardKey = GlobalKey<FlipCardState>();

  @override
  Widget build(BuildContext context) {
    return FlipCard(
      key: cardKey,
      flipOnTouch: false,
      front: Container(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.black,
          ),
          onPressed: () => cardKey.currentState.toggleCard(),
          child: BlackStone(),
        ),
      ),
      back: Container(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.white,
            onPrimary: Colors.black,
          ),
          onPressed: () => cardKey.currentState.toggleCard(),
          child: WhiteStone(),
        ),
      ),
    );
  }
}
