// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoTile extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteFunction;

  ToDoTile(
      {super.key,
      required this.taskName,
      required this.taskCompleted,
      required this.onChanged,
      required this.deleteFunction});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 25.0, top: 25.0, right: 25.0),
        child: Slidable(
          endActionPane: ActionPane(motion: const StretchMotion(), children: [SlidableAction(onPressed: deleteFunction,icon: Icons.delete,backgroundColor: Colors.red,)]),
          child: Container(
            padding: const EdgeInsets.all(12.0),
            decoration: BoxDecoration(
                color: Colors.purple, borderRadius: BorderRadius.circular(15)),
            child: Row(children: [
              Checkbox(value: taskCompleted, onChanged: onChanged, activeColor: Colors.black,),
              Text(taskName,
              style: TextStyle(decoration: taskCompleted? TextDecoration.lineThrough:TextDecoration.none),
              ),
            ]),
          ),
        ));
  }
}
