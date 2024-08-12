import 'package:hive_flutter/hive_flutter.dart';

class ToDoDataBase {
  List toDoList = [];
List doneList = [];
  
  final _myBox = Hive.box('mybox');

  void createInitialData() {
    toDoList = [
      ["Tap(+)to add a new task", false],
      ["mark the box when you do it", false],
      ["swipe from left to delete task", false],
      ["7OS اتفشخ عشان يخلص الخره ده", false],
    ];
  }

  void loadData() {
    toDoList = _myBox.get("TODOLIST");
    doneList = _myBox.get("DONELIST") ?? [];
  }


  void updateDataBase() {
    _myBox.put("TODOLIST", toDoList);
     _myBox.put("DONELIST", doneList);
  }
}