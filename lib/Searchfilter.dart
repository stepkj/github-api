import 'package:flutter/material.dart';
import 'package:api_project/constants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:api_project/model.dart';

Future<all> getData(String query) async {
  var alll;
  var response = await http.get(
    Uri.parse('https://api.github.com/search/repositories?q=$query'),
    headers: {"Accept": "application/json"},
  );

  if (response.statusCode == 200) {
    var jsonString = response.body;
    Map<String, dynamic> jsonMap = json.decode(jsonString);

    alll = all.fromJson(jsonMap);
    return alll;
  } else {
    throw Exception('Failed to fetch repos!');
  }
}

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
