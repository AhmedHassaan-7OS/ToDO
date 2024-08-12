import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo18/database.dart';
import 'package:todo18/dialog_box.dart';
import 'package:todo18/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _myBox = Hive.box('myBox');
  ToDoDataBase db = ToDoDataBase();

  @override
  void initState() {
    if (_myBox.get("TODOLIST") == null) {
      db.createInitialData();
    } else {
      db.loadData();
    }
    super.initState();
  }

  final _controler = TextEditingController();

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });

    if (value == true) {
      setState(() {
        db.doneList.add(db.toDoList[index]);
      });
    } else {
      setState(() {
        db.doneList.removeWhere((task) => task[0] == db.toDoList[index][0]);
      });
    }

    db.updateDataBase();
  }

  void saveNewTask() {
    setState(() {
      db.toDoList.add([_controler.text, false]);
      _controler.clear();
    });
    Navigator.of(context).pop();
    db.updateDataBase();
  }

  void createnewtask() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
            controller: _controler,
            onSave: saveNewTask,
            oncancel: () => Navigator.of(context).pop(),
          );
        });
  }

  void deleteTask(int index) {
    setState(() {
      String taskName = db.toDoList[index][0];
      db.toDoList.removeAt(index);
      db.doneList.removeWhere((task) => task[0] == taskName);
    });
    db.updateDataBase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 41, 3, 48),
          centerTitle: true,
          title: const Text(
            '7OS ToDo No.18',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          elevation: 200,
        ),
        drawer: const Drawer(),
        floatingActionButton: FloatingActionButton(
          onPressed: createnewtask,
          child: const Icon(CupertinoIcons.add),
        ),
        body: ListView.builder(
          itemCount: db.toDoList.length,
          itemBuilder: (context, index) {
            return ToDoTile(
              taskName: db.toDoList[index][0],
              taskCompleted: db.toDoList[index][1],
              onChanged: (value) => checkBoxChanged(value, index),
              deleteFunction: (context) => deleteTask(index),
            );
          },
        ));
  }
}
