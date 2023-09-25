import 'package:flutter/material.dart';

class BackSquatDetails extends StatelessWidget {
  final List<String> weeks;
  final int maxSquat;
  final int maxBenchPress;
  final int maxDeadlift;

  BackSquatDetails({
    required this.weeks,
    required this.maxSquat,
    required this.maxBenchPress,
    required this.maxDeadlift,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Back Squat Weeks'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            for (int index = 0; index < weeks.length; index++)
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Card(
                  elevation: 3,
                  child: ListTile(
                    title: Text(
                      'Week ${index + 1}',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Squat: ${maxSquat}kg'),
                        Text('Bench Press: ${maxBenchPress}kg'),
                        Text('Deadlift: ${maxDeadlift}kg'),
                        // Add more details as needed
                      ],
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
