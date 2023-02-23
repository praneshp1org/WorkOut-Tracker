import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class WorkOutPage extends StatefulWidget {
  final String workOutName;
  const WorkOutPage({super.key, required this.workOutName});

  @override
  State<WorkOutPage> createState() => _WorkOutPageState();
}

class _WorkOutPageState extends State<WorkOutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.workOutName),
      ),
    );
  }
}