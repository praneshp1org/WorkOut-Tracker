import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ExerciseTile extends StatelessWidget {

  final String exerciseName;
  final String weight;
  final String reps;
  final String sets;
  bool isCompleted;
  void Function(bool?)? onChanged;
  
    ExerciseTile({super.key, 
  required this.exerciseName, 
  required this.weight, 
  required this.reps, 
  required this.sets, 
  this.isCompleted=false, 
  required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
          color: Colors.grey,
          child: ListTile(
            trailing: Checkbox(value: isCompleted, 
            onChanged: (value)=> onChanged!(value)),
          title: Text(exerciseName),
          subtitle: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Chip(label: Text(weight+" kgs")),

              Chip(label: Text(reps+" reps")), 

              Chip(label: Text(sets+ " sets")),
            ],
          ),
              ),
        );
  }
}