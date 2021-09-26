import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'constants.dart';

class Searchpage extends StatefulWidget {
  const Searchpage({Key? key}) : super(key: key);

  @override
  _SearchpageState createState() => _SearchpageState();
}

class _SearchpageState extends State<Searchpage> {
  TextEditingController Search = TextEditingController();
  var swipeDirection;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: Scaffold(
            appBar: AppBar(
                title: Text("GitPub"),
                centerTitle: true,
                backgroundColor: Colors.blue,
                titleTextStyle: TextStyle(
                  color: kContentColorLightTheme,
                  fontSize: 20,
                )),
            body: SingleChildScrollView(
                child: Container(
                    child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Hello"),
              ],
            )))),
        onPanUpdate: (details) {
          swipeDirection = details.delta.dx < 0 ? 'left' : 'right';
        },
        onPanEnd: (details) {
          if (swipeDirection == 'left') {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => About()));
          }
        });
  }
}

class About extends StatefulWidget {
  const About({Key? key}) : super(key: key);

  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Container(child: Text("hello"));
  }
}
