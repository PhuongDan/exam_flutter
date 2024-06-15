import 'package:flutter/material.dart';

class PlaceDetailPage extends StatelessWidget {
  final dynamic place;

  PlaceDetailPage({required this.place});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(place['name']),
      ),
      body: Column(
        children: [
          Image.network(place['imageUrl']),
          SizedBox(height: 16.0),
          Text(
            place['name'],
            style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8.0),
          Text(
            '${place['rating']} stars',
            style: TextStyle(fontSize: 18.0),
          ),
          SizedBox(height: 8.0),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Description of the place can go here.',
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
