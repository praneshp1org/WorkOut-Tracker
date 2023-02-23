import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:workout/data/workout_data.dart';
import 'package:workout/pages/workout_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final workoutNameController = TextEditingController();
  //create anew workout

  void createNewWorkOut()
  {
    showDialog(context: context, builder: (context) => AlertDialog(
      title: Text('Create a new workout'),
      content: TextField(controller: workoutNameController,),
      actions: [
        MaterialButton(child: Text('Save'), onPressed: _save),
        MaterialButton(child: Text('Cancel'), onPressed: _cancel),
        
      ],
    ),);
  }
  void goToWorkOutPage(String workOutName)
  {
    Navigator.push(context, MaterialPageRoute(builder: (context) => WorkOutPage(workOutName: workOutName),));
  }
  void _save()
  {
    Provider.of<WorkoutData>(context, listen: false).addWorkout(workoutNameController.text);
    Navigator.pop(context);
    _clear();
  }
  void _cancel()
  {
    Navigator.pop(context);
    _clear();
  }
  void _clear()
  {
    workoutNameController.clear();
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<WorkoutData>(builder: (context,value, child)=> Scaffold(
      appBar: AppBar(
        title: Text('Workout Tracker'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: createNewWorkOut),
      body: ListView.builder(
        itemCount: value.getWorkoutList().length,
        itemBuilder: (context, index)=>ListTile(
          trailing: IconButton(onPressed: ()=>goToWorkOutPage(value.getWorkoutList()[index].name), icon: Icon(Icons.arrow_forward_ios)),
          title: Text(value.getWorkoutList()[index].name),)),
    ));
  }
}