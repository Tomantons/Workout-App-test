import 'package:flutter/material.dart';
import 'package:coolapp/screens/powerlifting_details.dart';
import 'package:coolapp/screens/back_squat.dart';
import 'package:coolapp/screens/deadlift.dart';
import 'package:coolapp/screens/bench_press.dart';

void main() {
  runApp(MyApp());
}

class Workout {
  final String title;
  final String description;
  final List<String> weeks;
  final int maxSquat;
  final int maxBenchPress;
  final int maxDeadlift;

  Workout(this.title, this.description, this.weeks, this.maxSquat,
      this.maxBenchPress, this.maxDeadlift);
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int maxSquat = 0;
  int maxBenchPress = 0;
  int maxDeadlift = 0;

  final List<Workout> workouts = [
    Workout(
        'Powerlifting',
        'Sika Strength',
        List.generate(16, (index) => 'Week ${index + 1}'),
        0, // Initial max squat value
        0, // Initial max bench press value
        0), // Initial max deadlift value
    Workout(
        'Back Squat',
        'Road to Anywhere - Sika Strength',
        List.generate(8, (index) => 'Week ${index + 1}'),
        0, // Initial max squat value
        0, // Initial max bench press value
        0), // Initial max deadlift value
    Workout(
        'Bench Press',
        'Sika Strength',
        List.generate(8, (index) => 'Week ${index + 1}'),
        0, // Initial max squat value
        0, // Initial max bench press value
        0), // Initial max deadlift value
    Workout(
        'Deadlift',
        'Sika Strength',
        List.generate(8, (index) => 'Week ${index + 1}'),
        0, // Initial max squat value
        0, // Initial max bench press value
        0), // Initial max deadlift value
    // Add more workout plans here
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Workout App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Workouts'),
        ),
        body: Column(
          children: [
            // User input fields
            Padding(
              padding: EdgeInsets.all(16.0),
              child: TextFormField(
                decoration: InputDecoration(labelText: 'Max Squat (kgs)'),
                onChanged: (value) {
                  setState(() {
                    maxSquat = int.tryParse(value) ?? 0;
                  });
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: TextFormField(
                decoration: InputDecoration(labelText: 'Max Bench Press (kgs)'),
                onChanged: (value) {
                  setState(() {
                    maxBenchPress = int.tryParse(value) ?? 0;
                  });
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: TextFormField(
                decoration: InputDecoration(labelText: 'Max Deadlift (kgs)'),
                onChanged: (value) {
                  setState(() {
                    maxDeadlift = int.tryParse(value) ?? 0;
                  });
                },
              ),
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Number of columns in the grid
                ),
                itemCount: workouts.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      // Navigate to the corresponding workout details screen
                      if (index == 0) {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => PowerliftingDetails(
                            weeks: workouts[index].weeks,
                            maxSquat: maxSquat,
                            maxBenchPress: maxBenchPress,
                            maxDeadlift: maxDeadlift,
                          ),
                        ));
                      } else if (index == 1) {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => BackSquatDetails(
                            weeks: workouts[index].weeks,
                            maxSquat: maxSquat,
                            maxBenchPress: maxBenchPress,
                            maxDeadlift: maxDeadlift,
                          ),
                        ));
                      } else if (index == 2) {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => BenchPressDetails(
                            weeks: workouts[index].weeks,
                            maxSquat: maxSquat,
                            maxBenchPress: maxBenchPress,
                            maxDeadlift: maxDeadlift,
                          ),
                        ));
                      } else if (index == 3) {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => DeadliftDetails(
                            weeks: workouts[index].weeks,
                            maxSquat: maxSquat,
                            maxBenchPress: maxBenchPress,
                            maxDeadlift: maxDeadlift,
                          ),
                        ));
                      }
                    },
                    child: WorkoutTile(workout: workouts[index]),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class WorkoutTile extends StatelessWidget {
  final Workout workout;

  WorkoutTile({required this.workout});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.fitness_center, size: 64.0, color: Colors.blue),
          SizedBox(height: 10.0),
          Text(workout.title, style: TextStyle(fontSize: 18.0)),
          SizedBox(height: 5.0),
          Text(workout.description, style: TextStyle(fontSize: 16.0)),
        ],
      ),
    );
  }
}
