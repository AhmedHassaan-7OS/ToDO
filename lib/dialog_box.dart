import 'package:flutter/material.dart';
import 'package:todo18/my%20button.dart';

// ignore: must_be_immutable
class DialogBox extends StatelessWidget {
 // ignore: prefer_typing_uninitialized_variables
 final controller;
 VoidCallback onSave;
  VoidCallback oncancel;

   DialogBox({super.key, required this.controller, required this.onSave, required this.oncancel,});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      content: SizedBox(
        height: 120,
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          TextField(
            controller: controller,
            decoration: const InputDecoration(
                border: OutlineInputBorder(), hintText: 'add a new task'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              MyButton(text: 'save', onPressed: onSave),
              const SizedBox(
                width: 10,
              ),
              MyButton(text: 'cancel', onPressed: oncancel)
            ],
          )
        ]),
      ),
    );
  }
}
