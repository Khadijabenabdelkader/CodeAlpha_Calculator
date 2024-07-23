import 'package:flutter/material.dart';

class Favori extends StatefulWidget {
  @override
  _FavoriState createState() => _FavoriState();
}

class _FavoriState extends State<Favori> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favoris'),
        actions: [
          IconButton(
            icon: Icon(Icons.plus_one),
            onPressed: () {
              // Add your onPressed code here!
            },
          ),
        ],
      ),
      body: Center(
        child: Text('Aucun Favori'),
      ),
    );
  }
}
