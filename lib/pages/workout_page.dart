import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';
import 'package:workout/components/exercise_tile.dart';
import 'package:workout/data/workout_data.dart';

class WorkOutPage extends StatefulWidget {
  final String workOutName;
  const WorkOutPage({super.key, required this.workOutName});

  @override
  State<WorkOutPage> createState() => _WorkOutPageState();
}

class _WorkOutPageState extends State<WorkOutPage> {
  void onCheckBoxChanged(String workOutName, String exerciseName)
  {
    Provider.of<WorkoutData>(context, listen: false).checkOffExercise(workOutName, exerciseName);
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<WorkoutData>(builder: (context, value, child) => Scaffold(
      appBar: AppBar(
        title: Text(widget.workOutName),
      ),
      body: ListView.builder(
        itemCount: value.numberOfExerciseInWorkOut(widget.workOutName),
        itemBuilder: (context, index) => ExerciseTile(
          onChanged: (val)=>onCheckBoxChanged(widget.workOutName, value.getRelevantWorkout(widget.workOutName).exercises[index].name),
          exerciseName: value.getRelevantWorkout(widget.workOutName).exercises[index].name, 
          weight: value.getRelevantWorkout(widget.workOutName).exercises[index].weight, 
          reps: value.getRelevantWorkout(widget.workOutName).exercises[index].reps, 
          sets: value.getRelevantWorkout(widget.workOutName).exercises[index].sets, 
          isCompleted: value.getRelevantWorkout(widget.workOutName).exercises[index].isCompleted),
          
        ),
    ),);
  }
}