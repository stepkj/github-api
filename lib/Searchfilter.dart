import 'package:flutter/material.dart';
import 'package:api_project/constants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:api_project/model.dart';
import 'package:api_project/searchpage.dart';

class Search extends StatefulWidget {
  final String search;
  Search(this.search);

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

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
