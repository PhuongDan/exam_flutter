import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  final String query;

  SearchPage({this.query = ''});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search'),
      ),
      body: Center(
        child: Text('Search results for: $query'),
      ),
    );
  }
}
