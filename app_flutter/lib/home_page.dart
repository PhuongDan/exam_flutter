import 'package:app_flutter/place_detail_page.dart';
import 'package:app_flutter/profile_page.dart';
import 'package:app_flutter/search_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<dynamic> places = [];

  @override
  void initState() {
    super.initState();
    fetchPlaces();
  }

  Future<void> fetchPlaces() async {
    final response = await http.get(Uri.parse('http://localhost:8080/api/getAllPlace'));
    if (response.statusCode == 200) {
      setState(() {
        places = json.decode(response.body);
      });
    } else {
      throw Exception('Failed to load places');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hi Guy! Where are you going next?'),
        backgroundColor: Colors.purple,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search your destination',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onSubmitted: (query) {
                // Navigate to search page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SearchPage(query: query)),
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildCategoryButton('Hotels', Icons.hotel),
              _buildCategoryButton('Flights', Icons.flight),
              _buildCategoryButton('All', Icons.all_inclusive),
            ],
          ),
          SizedBox(height: 16),
          Text(
            'Popular Destinations',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Expanded(
            child: ListView.builder(
              itemCount: places.length,
              itemBuilder: (context, index) {
                return _buildPlaceCard(places[index]);
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        onTap: (index) {
          // Navigate to corresponding page
          if (index == 0) {
            // Home
          } else if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SearchPage()),
            );
          } else if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProfilePage()),
            );
          }
        },
      ),
    );
  }

  Widget _buildCategoryButton(String text, IconData icon) {
    return ElevatedButton.icon(
      onPressed: () {},
      icon: Icon(icon),
      label: Text(text),
    );
  }

  Widget _buildPlaceCard(place) {
    return GestureDetector(
      onTap: () {
        // Navigate to place detail page
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => PlaceDetailPage(place: place)),
        );
      },
      child: Card(
        child: ListTile(
          leading: Image.network(place['imageUrl']),
          title: Text(place['name']),
          subtitle: Text('${place['rating']} stars'),
        ),
      ),
    );
  }
}
