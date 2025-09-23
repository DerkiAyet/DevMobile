import 'package:flutter/material.dart';
import 'package:tutorial_pr/Projects/1_ToDo_APP/main.dart' as todo;
import 'package:tutorial_pr/Projects/2_Ecommerce_APP/main.dart' as ecommerce;
import 'package:tutorial_pr/Projects/3_Light_vs_Dark_Mode/main.dart' as theme;
import 'package:tutorial_pr/Projects/4_Responsive_Design/main.dart' as responsive;

void main() async {
  // Choose which project to run by uncommenting:
    responsive.main();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text("Select a Project")),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () => todo.main(),
                child: const Text("Run TODO App"),
              ),
              const SizedBox(height: 8,),
              ElevatedButton(
                onPressed: () => ecommerce.main(),
                child: const Text("Run Ecommerce App"),
              ),
              const SizedBox(height: 8,),
              ElevatedButton(
                onPressed: () => theme.main(),
                child: const Text("Light & Dark mode App"),
              ),
              const SizedBox(height: 8,),
              ElevatedButton(
                onPressed: () => responsive.main(),
                child: const Text("Responsive Design"),
              )
            ],
          ),
        ),
      ),
    );
  }
}