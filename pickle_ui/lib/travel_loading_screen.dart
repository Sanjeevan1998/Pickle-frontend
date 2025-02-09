import 'package:flutter/material.dart';
import 'api_service.dart';
import 'travel_itinerary_page.dart';

class TravelLoadingScreen extends StatefulWidget {
  final String destination;
  final int duration;
  final List<String> interests;
  final String budget;
  final String? exclude;

  const TravelLoadingScreen({
    super.key,
    required this.destination,
    required this.duration,
    required this.interests,
    required this.budget,
    this.exclude,
  });

  @override
  _TravelLoadingScreenState createState() => _TravelLoadingScreenState();
}

class _TravelLoadingScreenState extends State<TravelLoadingScreen> {
  @override
  void initState() {
    super.initState();
    _fetchItinerary();
  }

  Future<void> _fetchItinerary() async {
    try {
      final itinerary = await ApiService().getTravelItinerary(
        destination: widget.destination,
        duration: widget.duration,
        interests: widget.interests,
        budget: widget.budget,
        exclude: widget.exclude,
      );
      
      if (!mounted) return;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => TravelItineraryPage(itinerary: itinerary),
        ),
      );
    } catch (e) {
      // Handle error
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircularProgressIndicator(),
            const SizedBox(height: 20),
            Text('Planning your ${widget.duration}-day trip to ${widget.destination}...'),
          ],
        ),
      ),
    );
  }
} 