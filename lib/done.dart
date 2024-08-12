// ignore: unnecessary_import
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo18/database.dart';

class DonePage extends StatelessWidget {
  const DonePage({super.key, required String completedTask});

  @override
  Widget build(BuildContext context) {
    Hive.box('myBox');
    ToDoDataBase db = ToDoDataBase();
    db.loadData();

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 18, 18, 18),
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Center(
          child: Text(
            'عاش يا بطل',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: db.doneList.length,
        itemBuilder: (context, index) {
          return SizedBox(
            height: 50,
            child: Card(
              child: Text(
                db.doneList[index][0],
                style: const TextStyle(color: Colors.red),
              ),
            ),
          );
        },
      ),
    );
  }
}
