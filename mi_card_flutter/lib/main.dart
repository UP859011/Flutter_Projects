import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          backgroundColor: Colors.teal,
          body: SafeArea(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: double.infinity,
              ),
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('images/alex.jpg'),
              ),
              Text('Alexander Donovan-Lowe', style: TextStyle(
                fontFamily: 'Pacifico',
                fontSize: 30,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),),
              Text('HUMAN RIGHTS SOLICITOR', style: TextStyle(
                fontFamily: 'SourceSansPro',
                fontSize: 20,
                color: Colors.teal[100],
                fontWeight: FontWeight.bold,
                letterSpacing: 2.5,
              ),),
              SizedBox(
                height: 20,
                width: 300,
                child: Divider(color: Colors.teal[100],),
              ),
              Card(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                  child: ListTile(leading: Icon(Icons.phone, color: Colors.teal,),
                    title: Text('+44 73999 09 699', style: TextStyle(
                      color: Colors.teal,
                      fontFamily: 'SourceSansPro',
                      fontSize: 17.5,
                    ),),)
              ),
              Card(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                  child: ListTile(leading: Icon(Icons.email, color: Colors.teal,),
                  title: Text('alexdonovanlowe@gmail.com', style: TextStyle(
                    color: Colors.teal,
                    fontFamily: 'SourceSansPro',
                    fontSize: 17.5,
                  ),),)
                ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        const url = 'https://github.com/UP859011?tab=repositories';
                        launchURL(url);
                      },
                      child: Text('GitHub')),
                  ElevatedButton(
                      onPressed: () {
                        const url = 'https://www.linkedin.com/in/adlowe/';
                        launchURL(url);
                      },
                      child: Text('LinkedIn')),
                  ElevatedButton(
                      onPressed: () {
                        const url = 'https://www.instagram.com/alexdlowe/';
                        launchURL(url);
                      },
                      child: Text('Instagram')),
                ],
              )
            ],
          ))),
    );
  }
}

launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url, forceWebView: true);
  } else {
    throw 'Could not launch $url';
  }
}
