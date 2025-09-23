import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:tutorial_pr/Projects/1_ToDo_APP/home_page.dart';


void main() async {
  //init the hive:
  await Hive.initFlutter();

  // open a box:
  var box = await Hive.openBox("myHiveBox");
  runApp(ToDoApp());
}

class ToDoApp extends StatelessWidget {
  const ToDoApp({super.key});

  void userTapped () {
    print("User Tapped");
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:false,
      home: HomePage(),
      theme: ThemeData( //defines the global theme of your app (colors, fonts, styles): "equivalent a html{} in css"
          colorScheme: ColorScheme.fromSwatch(
            primarySwatch: Colors.yellow,
          ).copyWith(
            secondary: Colors.yellow, // for FAB, etc
          ), // this sets the primary color palette of the app (par defaut le primary color de flutter est blue)
          appBarTheme: AppBarTheme(//the previous property doesn't work with the app bar but it work with this
              backgroundColor: Colors.yellow,
              elevation: 0
          )
      ),
    );
  }
}
