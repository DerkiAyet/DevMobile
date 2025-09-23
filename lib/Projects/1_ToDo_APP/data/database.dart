import 'package:hive/hive.dart';

class ToDoDataBase {
  List toDoList = [];

  // refernce our box
  final _mybox = Hive.box("myHiveBox");

  // run this method if this is the first time ever opening this app
  void createInitialData() {
    toDoList = [
      ["Make Tutorial", false],
      ["do exercice", false]
    ];
  }

  // load the data from database
  void loadData() {
    toDoList = _mybox.get("TODOLIST");
  }

  //update the db
  void updateDataBase() {
    _mybox.put("TODOLIST", toDoList);
  }

}