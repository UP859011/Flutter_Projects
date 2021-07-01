import 'constants.dart';
import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  RoundIconButton({@required this.icon, @required this.pressFunction});

  final IconData icon;
  final Function pressFunction;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
        child: Icon(icon),
        elevation: 6.0,
        constraints: BoxConstraints.tightFor(
          width: 56.0,
          height: 56.0,
        ),
        shape: CircleBorder(),
        fillColor: kInactiveCardColour,
        onPressed: pressFunction);
  }
}
