import 'package:api_project/Searchfilter.dart';
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
  bool _validate = false;
  TextEditingController search = TextEditingController();
  var swipeDirection;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: Scaffold(
            backgroundColor: Colors.black,
            appBar: AppBar(
                title: Text("GitPub"),
                centerTitle: true,
                backgroundColor: Colors.cyan,
                titleTextStyle: TextStyle(
                  color: kSecondaryColor,
                  fontSize: 20,
                )),
            body: SingleChildScrollView(
                child: Container(
                    child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 100),
                Image(
                  image: AssetImage("lib/images/github.png"),
                  height: 125,
                  width: 175,
                ),
                SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: TextField(
                    controller: search,
                    autofocus: false,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                    decoration: InputDecoration(
                      hintText: "Github Repository",
                      errorText: _validate ? "Search can't be null" : null,
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                      hintStyle: TextStyle(
                        color: Colors.white60,
                      ),
                    ),
                  ),
                ),
                InkWell(
                  borderRadius: BorderRadius.circular(30),
                  onTap: () {
                    if (search.text.isEmpty) {
                      setState(() {});
                      _validate = true;
                    } else {
                      _validate = false;
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Search(search.text)));
                    }
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 13),
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(255, 255, 255, 0.9),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    height: 50,
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width - 48,
                    child: Text(
                      'Search',
                      style: TextStyle(
                          color: Colors.black87,
                          fontSize: 21,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                )
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

class About extends StatelessWidget {
  const About({Key? key}) : super(key: key);
  int forks;
  int stars;
  int watchers;
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [Slider(value: forks)],
    ));
  }
}
