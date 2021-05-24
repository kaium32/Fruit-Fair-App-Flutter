import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fruit Fair',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // This holds a list of fiction users
  // You can use data fetched from a database or cloud as well
  final List<Map<String, dynamic>> _allFruits = [
    {"id": 1, "name": "Apples", "quantity": 29},
    {"id": 2, "name": "Apricots", "quantity": 40},
    {"id": 3, "name": "Avocados", "quantity": 5},
    {"id": 4, "name": "Bananas", "quantity": 35},
    {"id": 5, "name": "Blueberries", "quantity": 21},
    {"id": 6, "name": "Bing Cherry", "quantity": 55},
    {"id": 7, "name": "Cherries", "quantity": 30},
    {"id": 8, "name": "Clementine", "quantity": 14},
    {"id": 9, "name": "Cucumbers", "quantity": 100},
    {"id": 10, "name": "Dates", "quantity": 35},
    {"id": 11, "name": "Dragon Fruit", "quantity": 15},
    {"id": 12, "name": "Dewberries", "quantity": 19},
    {"id": 13, "name": "Elderberry", "quantity": 22},
    {"id": 14, "name": "Entawak", "quantity": 12},
    {"id": 15, "name": "Fig", "quantity": 32},
    {"id": 16, "name": "Farkleberry", "quantity": 44},
    {"id": 17, "name": "Guava", "quantity": 52},
    {"id": 18, "name": "Grapes", "quantity": 8},
    {"id": 19, "name": "Honeydew melon", "quantity": 17},
    {"id": 20, "name": "Hackberry", "quantity": 11},
    {"id": 21, "name": "Indian Prune", "quantity": 14},
    {"id": 22, "name": "Imbe", "quantity": 60},
    {"id": 23, "name": "Jambolan", "quantity": 65},
    {"id": 24, "name": "Jackfruit", "quantity": 70},
    {"id": 25, "name": "Kumquat", "quantity": 45},
    {"id": 26, "name": "Kiwi", "quantity": 38},
    {"id": 27, "name": "Lemon", "quantity": 22},
    {"id": 28, "name": "Loquat", "quantity": 77},
    {"id": 29, "name": "Mango", "quantity": 80},
    {"id": 30, "name": "Melon", "quantity": 99},
    {"id": 31, "name": "Nectarine", "quantity": 95},
    {"id": 32, "name": "Navel Orange", "quantity": 13},
    {"id": 33, "name": "Olive", "quantity": 14},
    {"id": 34, "name": "Orange", "quantity": 19},
    {"id": 35, "name": "Papaya", "quantity": 58},
    {"id": 36, "name": "Prickly Pear", "quantity": 49},
    {"id": 37, "name": "Quince", "quantity": 74},
    {"id": 38, "name": "Rambutan", "quantity": 81},
    {"id": 39, "name": "Strawberries", "quantity": 90},
    {"id": 40, "name": "Tomato", "quantity": 100},
    {"id": 41, "name": "Ugli Fruit", "quantity": 78},
    {"id": 42, "name": "Vanilla Bean", "quantity": 97},
    {"id": 43, "name": "Watermelon", "quantity": 5},
    {"id": 44, "name": "Wolfberry", "quantity": 28},
    {"id": 45, "name": "Xigua", "quantity": 23},
    {"id": 46, "name": "Yangmei", "quantity": 13},
    {"id": 47, "name": "Yellow Passion Fruit", "quantity": 26},
    {"id": 48, "name": "Yunnan Hackberry", "quantity": 37},
    {"id": 49, "name": "Zucchini", "quantity": 99},
    {"id": 50, "name": "Zinfandel Grapes", "quantity": 112},
  ];

  List<Map<String, dynamic>> _foundFruits = [];
  @override
  initState() {
    _foundFruits = _allFruits;
    super.initState();
  }

  void _runFilter(String enteredKeyword) {
    List<Map<String, dynamic>> results = [];
    if (enteredKeyword.isEmpty) {
      results = _allFruits;
    } else {
      results = _allFruits
          .where((user) =>
          user["name"].toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
    }
    setState(() {
      _foundFruits = results;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fruit Fair'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            TextField(
              onChanged: (value) => _runFilter(value),
              decoration: InputDecoration(
                  labelText: 'Search', suffixIcon: Icon(Icons.search)),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: _foundFruits.length > 0
                  ? ListView.builder(
                itemCount: _foundFruits.length,
                itemBuilder: (context, index) => Card(
                  key: ValueKey(_foundFruits[index]["id"]),
                  color: Colors.amberAccent,
                  elevation: 4,
                  margin: EdgeInsets.symmetric(vertical: 10),
                  child: ListTile(
                    leading: Text(
                      _foundFruits[index]["id"].toString(),
                      style: TextStyle(fontSize: 24),
                    ),
                    title: Text(_foundFruits[index]['name']),
                    subtitle: Text(
                        '${_foundFruits[index]["quantity"].toString()} years old'),
                  ),
                ),
              )
                  : Text(
                'No results found',
                style: TextStyle(fontSize: 24),
              ),
            ),
          ],
        ),
      ),
    );
  }
}