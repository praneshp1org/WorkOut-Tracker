import 'package:flutter/widgets.dart';
import 'package:workout/models/exercise.dart';
import 'package:workout/models/workout.dart';

class WorkoutData extends ChangeNotifier
{

  /*
  DATA STRUCTURES USED


  */
  List<Workout> workoutList=[Workout(name: "Upper Body", exercises: [
    Exercise(name: "Bicep Curl", weight: "10", reps: "10", sets: "3", )
  ])];

  //getting list of workout
  List<Workout> getWorkoutList(){
    return workoutList;
  }


  //add workout
  void addWorkout(String name)
  {
    workoutList.add(Workout(name: name, exercises: []));
    notifyListeners();
  }


  //add an exercise
  void addExercise(String workoutName, String exerciseName, String weight, String reps, String sets)
  {
    //fijnd relevant workout
    Workout relevantWorkout = getRelevantWorkout(workoutName);
    // Workout relevantWorkout = workoutList.firstWhere((element) => false);

    relevantWorkout.exercises.add(Exercise(name: exerciseName, weight: weight, reps: reps, sets: sets, ));
    notifyListeners();
  }

  //check off exercise
  void checkOffExercise(String workOutName, String exerciseName)
  {
    Exercise relevantExercise  = getRelevantExercise(workOutName, exerciseName);

    //check off boolean to show user completed the workoput
    relevantExercise.isCompleted = !relevantExercise.isCompleted;
  }

  //get length of workout
  int numberOfExerciseInWorkOut(String workOutName)
  {
    Workout relevantWorkout = getRelevantWorkout(workOutName);
    return relevantWorkout.exercises.length;
  }

  //return relevant workout object given a workoutname
  Workout getRelevantWorkout(String workOutName)
  {
        Workout relevantWorkout = workoutList.firstWhere((workout) => workout.name == workOutName);

        return relevantWorkout;
  }

  //return relevant wexercise object given a exercisename

    Exercise getRelevantExercise(String workOutName, String exerciseName)
  {
        // Workout relevantWorkout = workoutList.firstWhere((element) => false);
        Workout relevantWorkout = getRelevantWorkout(workOutName);


        Exercise relevantExercise = relevantWorkout.exercises.firstWhere((exercise) => exercise.name == exerciseName);
        return relevantExercise;
  }
}