import 'package:flutter/material.dart';
import 'what_to_watch_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pickle App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pickle App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildOptionButton(context, 'Help me choose what to watch', true, () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => WhatToWatchPage()),
              );
            }),
            _buildOptionButton(context, 'Help me choose what to eat', false, null),
            _buildOptionButton(context, 'Help me choose what to read', false, null),
            _buildOptionButton(context, 'Help me choose where to go', false, null),
            _buildOptionButton(context, 'Help me choose what to do next', false, null),
          ],
        ),
      ),
    );
  }

  Widget _buildOptionButton(BuildContext context, String text, bool enabled, VoidCallback? onPressed) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ElevatedButton(
        onPressed: enabled ? onPressed : null,
        child: Text(text),
        style: ElevatedButton.styleFrom(
          minimumSize: Size(200, 50),
        ),
      ),
    );
  }
}