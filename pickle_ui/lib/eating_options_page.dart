import 'package:flutter/material.dart';


class WhatToEatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('What to Eat?'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildOptionButton(context, 'Cook at home', false, null),
            _buildOptionButton(context, 'Eat outside', false, null),
            _buildOptionButton(context, 'Choose for me', false, null),
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