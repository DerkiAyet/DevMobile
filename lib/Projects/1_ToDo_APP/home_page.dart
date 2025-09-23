import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:tutorial_pr/Projects/1_ToDo_APP/data/database.dart';
import 'package:tutorial_pr/Projects/1_ToDo_APP/utils/dialog_box.dart';
import 'package:tutorial_pr/Projects/1_ToDo_APP/utils/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final _mybox = Hive.box("myHiveBox");
  ToDoDataBase db = ToDoDataBase();

  @override
  void initState() {
    // TODO: implement initState
    if(_mybox.get("TODOLIST") == null){
      db.createInitialData();
    } else {
      db.loadData();
    }
    super.initState();
  }

  void checkBoxChanged (bool? value, int index){
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
    db.updateDataBase();//whever there is a whanging ths will store it in the db see the dart file to understand more
  }

  final _controller = TextEditingController();

  void saveNewTask() {
    setState(() {
      db.toDoList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.updateDataBase();
  }

  void createNewTask() {
    showDialog(
        context: context,
        builder: (context) {
            return DialogBox(
              controller: _controller,
              onSave: saveNewTask,
              onCancel: () => Navigator.of(context).pop(),
            );
        }
    );
  }
  
  void deleteTask(int index) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Delete Task"),
          content: const Text("Are you sure you want to delete this task?"),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(), // cancel
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  db.toDoList.removeAt(index);
                });
                Navigator.of(context).pop(); // close dialog
                db.updateDataBase();
              },
              child: const Text("Delete", style: TextStyle(color: Colors.red)),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        title: Text("TO DO"),
        centerTitle: true,
        elevation: 0, // it took off the default shadow of the appbar
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: db.toDoList.length,
        itemBuilder: (context, index) {
           return TodoTile(
               taskName: db.toDoList[index][0],
               taskCompleted: db.toDoList[index][1],
               onChanged: (value) => checkBoxChanged(value, index),
               deleteTask: (context) => deleteTask(index),
           );
        },
      ),
    );
  }
}
