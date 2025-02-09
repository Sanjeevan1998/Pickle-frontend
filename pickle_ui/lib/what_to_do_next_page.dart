import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/services.dart';
import 'task_input_page.dart';

class WhatToDoNextPage extends StatefulWidget {
  @override
  _WhatToDoNextPageState createState() => _WhatToDoNextPageState();
}

class _WhatToDoNextPageState extends State<WhatToDoNextPage> {
  bool _isAppleCalendarConnected = false;
  String _calendarStatus = '';
  List<dynamic> _calendarEvents = []; // Add this line to store events

  Future<void> _connectToAppleCalendar() async {
    try {
      final events = await _fetchAppleCalendarEvents();
      setState(() {
        _isAppleCalendarConnected = true;
        _calendarStatus = 'Connected to Apple Calendar';
        _calendarEvents = events; // Store the events
      });
      // Navigate directly to TaskInputPage
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => TaskInputPage(calendarEvents: _calendarEvents),
        ),
      );
    } catch (e) {
      setState(() {
        _calendarStatus = 'Failed to connect: $e';
      });
    }
  }

  Future<List<dynamic>> _fetchAppleCalendarEvents() async {
    const platform = MethodChannel('com.pickle.app/calendar');
    try {
      final events = await platform.invokeMethod('fetchAppleCalendarEvents');
      return events;
    } on PlatformException catch (e) {
      print("Failed to fetch events: ${e.message}");
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('What to Do Next'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (!_isAppleCalendarConnected) ...[
              ElevatedButton(
                onPressed: _connectToAppleCalendar,
                child: Text('Connect to Apple Calendar'),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: null,
                child: Text('Connect to Google Calendar'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey,
                ),
              ),
            ] else ...[
              Text(
                _calendarStatus,
                style: TextStyle(fontSize: 18, color: Colors.black),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TaskInputPage(
                        calendarEvents: _calendarEvents, // Pass stored events instead of empty list
                      ),
                    ),
                  );
                },
                child: Text('Proceed to Add Tasks'),
              ),
            ]
          ],
        ),
      ),
    );
  }
}