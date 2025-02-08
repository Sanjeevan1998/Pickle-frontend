import 'package:flutter/material.dart';
import 'movie_search_page.dart';

class WatchOptionsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Watch Options'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildOptionButton(context, 'Watch at Home', true, () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MovieSearchPage()),
              );
            }),
            _buildOptionButton(context, 'Watch at Nearby Cinemas', false, null),
            _buildOptionButton(context, 'Choose for Me', false, null),
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