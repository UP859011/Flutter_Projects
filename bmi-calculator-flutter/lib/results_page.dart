import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'round_icon_button.dart';
import 'input_page.dart';
import 'package:flutter/material.dart';
import 'icon_content.dart';
import 'reusable_card.dart';
import 'constants.dart';

class ResultsPage extends StatelessWidget {
  ResultsPage(
      {@required this.bmiResult,
      @required this.resultText,
      @required this.resultInfo});

  final String bmiResult;
  final String resultText;
  final String resultInfo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('BMI RESULTS'),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Text(
              'YOUR RESULT',
              style: kCalculateTextStyle,
            ),
            Expanded(
              child: ReusableCard(
                kActiveCardColour,
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(
                      resultText.toUpperCase(),
                      style: kHealthyTextStyle.copyWith(
                        color: resultText == 'NORMAL'
                            ? kHealthyColour
                            : kUnhealthyColour,
                      ),
                    ),
                    Text(bmiResult, style: kResultTextStyle),
                    Center(
                        child: Text(
                      'Normal BMI Range is 18.5 - 25 kg/m2',
                      style: kBigLabelTextStyle,
                    )),
                    Center(
                      child: Text(
                        resultInfo,
                        style: kBigLabelTextStyle,
                      ),
                    ),
                  ],
                ),
                () {},
              ),
            ),
            Container(
              color: kAccentColour,
              margin: EdgeInsets.only(top: 10.0),
              width: double.infinity,
              height: kBottomContainerHeight,
              child: FlatButton(
                child: Text(
                  'RE-CALCULATE YOUR BMI',
                  style: kCalculateTextStyle,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
