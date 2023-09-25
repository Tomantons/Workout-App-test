import 'package:flutter/material.dart';

class WorkoutDay {
  final String exercise;
  final int sets;
  final int reps;
  final double loadPercentage;

  WorkoutDay(this.exercise, this.sets, this.reps, this.loadPercentage);
}

class WorkoutWeek {
  final String name;
  final List<WorkoutDay> days;

  WorkoutWeek(this.name, this.days);
}

final List<WorkoutWeek> powerliftingWeeks = [
  WorkoutWeek('Day 1', [
    WorkoutDay('High-Bar Back Squat', 5, 10, 0.5),
    WorkoutDay('Goodmornings + Lat Pull Downs', 4, 18, 0.4),
    WorkoutDay('Man-Makers + Sit-Ups', 4, 20, 0.5),
  ]),
  WorkoutWeek('Day 2', [
    WorkoutDay('Competition Bench', 3, 4, 0.75),
    WorkoutDay('Competition Bench', 2, 2, 0.8),
    WorkoutDay('Facepulls + IYTW\'s', 4, 18, 0.1),
    WorkoutDay('Dips + Single Arm Suitcase hold', 4, 12, 0.5),
  ]),
  WorkoutWeek('Day 3', [
    WorkoutDay('Deadlift pause @ knee', 4, 3, 0.5),
    WorkoutDay('Deadlift pause @ knee + Deadlift', 3, 4, 0.5),
    WorkoutDay('Reverse Lunges Dumbbell + Hamstring Curls', 6, 18, 0.4),
  ]),
  WorkoutWeek('Day 4', [
    WorkoutDay('Competition Back Squat', 1, 8, 0.7),
    WorkoutDay('Competition Back Squat', 3, 8, 0.55),
    WorkoutDay('Close Grip Bench Press', 6, 8, 0.6),
    WorkoutDay('Back Extensions', 4, 8, 0.15),
    WorkoutDay('Barbell Curl + Flys', 4, 27, 0.3),
  ]),
];

class PowerliftingDetails extends StatelessWidget {
  final WorkoutWeek week;
  final int maxSquat;

  PowerliftingDetails({required this.week, required this.maxSquat});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(week.name),
      ),
      body: ListView.builder(
        itemCount: week.days.length,
        itemBuilder: (context, index) {
          final day = week.days[index];
          final max = (maxSquat * day.loadPercentage)
              .toStringAsFixed(2); // Calculate load

          return ListTile(
            title: Text(day.exercise),
            subtitle:
                Text('Sets: ${day.sets}, Reps: ${day.reps}, Load: $max kg'),
          );
        },
      ),
    );
  }
}
