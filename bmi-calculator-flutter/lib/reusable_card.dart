import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  ReusableCard(this.colour, this.cardChild, this.onPress);

  final Color colour;
  final Function onPress;
  final Widget cardChild;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: cardChild,
        height: 200,
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: colour,
        ),
      ),
    );
  }
}
