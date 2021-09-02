import 'package:flutter/material.dart';

class Favorites extends StatefulWidget {
  @override
  _LocationState createState() => _LocationState();
}

class _LocationState extends State<Favorites> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Favorites'),
      ),
    );
  }
}
