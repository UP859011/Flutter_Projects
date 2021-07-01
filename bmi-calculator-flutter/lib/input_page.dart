import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'round_icon_button.dart';
import 'results_page.dart';
import 'package:flutter/material.dart';
import 'calculator_brain.dart';
import 'icon_content.dart';
import 'reusable_card.dart';
import 'constants.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int height = 190;
  int weight = 80;
  int age = 22;

  Color maleCardColour = kInactiveCardColour;
  Color femaleCardColour = kInactiveCardColour;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('BMI CALCULATOR'),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReusableCard(
                      selectedGender == Gender.male
                          ? kActiveCardColour
                          : kInactiveCardColour,
                      IconContent(FontAwesomeIcons.mars, 'MALE'),
                      () {
                        setState(
                          () {
                            selectedGender = Gender.male;
                          },
                        );
                      },
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      selectedGender == Gender.female
                          ? kActiveCardColour
                          : kInactiveCardColour,
                      IconContent(FontAwesomeIcons.venus, 'FEMALE'),
                      () {
                        setState(
                          () {
                            selectedGender = Gender.female;
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ReusableCard(
                  kActiveCardColour,
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'HEIGHT',
                        style: kLabelTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: <Widget>[
                          Text('$height', style: kNumberTextStyle),
                          Text(
                            'cm',
                            style: kLabelTextStyle,
                          )
                        ],
                      ),
                      Slider(
                        value: height.toDouble(),
                        min: 120,
                        max: 220,
                        activeColor: kAccentColour,
                        inactiveColor: Color(0xFF8D8E98),
                        onChanged: (double newValue) {
                          setState(
                            () {
                              height = newValue.round();
                            },
                          );
                        },
                      ),
                    ],
                  ),
                  () {}),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReusableCard(
                        kActiveCardColour,
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text('WEIGHT', style: kLabelTextStyle),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.baseline,
                              textBaseline: TextBaseline.alphabetic,
                              children: [
                                Text(
                                  weight.toString(),
                                  style: kNumberTextStyle,
                                ),
                                Text(
                                  'kg',
                                  style: kLabelTextStyle,
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                RoundIconButton(
                                  icon: FontAwesomeIcons.minus,
                                  pressFunction: () {
                                    setState(
                                      () {
                                        weight--;
                                      },
                                    );
                                  },
                                ),
                                RoundIconButton(
                                  icon: FontAwesomeIcons.plus,
                                  pressFunction: () {
                                    setState(
                                      () {
                                        weight++;
                                      },
                                    );
                                  },
                                ),
                              ],
                            )
                          ],
                        ),
                        () {}),
                  ),
                  Expanded(
                    child: ReusableCard(
                        kActiveCardColour,
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text('AGE', style: kLabelTextStyle),
                            Text(
                              age.toString(),
                              style: kNumberTextStyle,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                RoundIconButton(
                                  icon: FontAwesomeIcons.minus,
                                  pressFunction: () {
                                    setState(
                                      () {
                                        age--;
                                      },
                                    );
                                  },
                                ),
                                RoundIconButton(
                                  icon: FontAwesomeIcons.plus,
                                  pressFunction: () {
                                    setState(
                                      () {
                                        age++;
                                      },
                                    );
                                  },
                                ),
                              ],
                            )
                          ],
                        ),
                        () {}),
                  ),
                ],
              ),
            ),
            Container(
              color: kAccentColour,
              margin: EdgeInsets.only(top: 10.0),
              width: double.infinity,
              height: kBottomContainerHeight,
              child: FlatButton(
                child: Text(
                  'CALCULATE YOUR BMI',
                  style: kCalculateTextStyle,
                ),
                onPressed: () {
                  CalculatorBrain calc = CalculatorBrain(height, weight);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ResultsPage(
                        bmiResult:calc.calculateBMI(),
                        resultText: calc.getResult(),
                        resultInfo: calc.getInterpretation(),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
