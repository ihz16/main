import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Item Chooser',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ItemChooser(),
    );
  }
}

class ItemChooser extends StatefulWidget {
  @override
  _ItemChooserState createState() => _ItemChooserState();
}

class _ItemChooserState extends State<ItemChooser> {
  final TextEditingController _controller = TextEditingController();
  String _chosenItem = '';
  final Map<String, String> _items = {
    'apple': 'assets/apple.jpeg',
    'orange': 'assets/orange.jpg',
    'rambutan': 'assets/rambutan.jpg',
    'bicycle': 'assets/bicycle.jpeg',
    'iphone': 'assets/iphone.jpeg',
    'samsung': 'assets/samsung.jpeg',
  };

  void _displayChoice() {
    setState(() {
      _chosenItem = _controller.text.toLowerCase();
    });
  }

  void _randomChoice() {
    setState(() {
      var random = Random();
      var keys = _items.keys.toList();
      _chosenItem = keys[random.nextInt(keys.length)];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Item Chooser'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Enter an item name',
                border: OutlineInputBorder(),
                suffixIcon: IconButton(
                  onPressed: _controller.clear,
                  icon: Icon(Icons.clear),
                ),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: _displayChoice,
                  child: Text('Display Choice'),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green,
                    onPrimary: Colors.white,
                  ),
                ),
                ElevatedButton(
                  onPressed: _randomChoice,
                  child: Text("I'm Feeling Lucky"),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.orange,
                    onPrimary: Colors.white,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Expanded(
              child: _items.containsKey(_chosenItem)
                  ? Image.asset(_items[_chosenItem]!)
                  : Center(
                      child: Text('No item selected',
                          style: TextStyle(fontSize: 18))),
            ),
          ],
        ),
      ),
    );
  }
}
