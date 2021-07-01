import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(
      MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: Text('Ask Me Anything'),
            backgroundColor: Colors.blue[900],
          ),
          body: Magic8Ball(),
          backgroundColor: Colors.blue,
        ),
      ),
    );

class Magic8Ball extends StatefulWidget {
  @override
  _Magic8BallState createState() => _Magic8BallState();
}

class _Magic8BallState extends State<Magic8Ball> {
  int ballImgNum = 1;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        onPressed: () {
          setState(
            () {
              ballImgNum = Random().nextInt(5) + 1;
            },
          );
        },
        child: Image.asset('images/ball$ballImgNum.png'),
      ),
    );
  }
}
