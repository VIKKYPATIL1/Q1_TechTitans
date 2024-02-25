import 'package:flutter/material.dart';
import 'package:scavenger_hunt/model/task.dart';
import 'package:scavenger_hunt/dummydata/listofdummytask.dart';

class TaskWidget extends StatelessWidget {
  const TaskWidget({super.key, required this.index});
  final int index;
  @override
  Widget build(BuildContext context) {
    Task task = scavengerHuntTasks[index];
    return Container(
      padding: const EdgeInsets.all(5),
      height: 200,
      child: Card(
        shape:
            ContinuousRectangleBorder(borderRadius: BorderRadius.circular(30)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(task.title, style: const TextStyle(fontSize: 24)),
              Text(task.description, style: const TextStyle(fontSize: 18))
            ],
          ),
        ),
      ),
    );
  }
}
