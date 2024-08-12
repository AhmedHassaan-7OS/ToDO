// ignore: duplicate_ignore
// ignore: file_names
// ignore_for_file: must_be_immutable, file_names

import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String text;

  VoidCallback onPressed;
   MyButton({super.key, required this.text,required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: Theme.of(context).primaryColor,
      child: Text(text),
    );
  }
}