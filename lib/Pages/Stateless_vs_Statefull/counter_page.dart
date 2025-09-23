import 'package:flutter/material.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  // variable
  int _counter = 0;

  //methode
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("You pushed the button this many time"),
                Text(
                    _counter.toString(),
                  style: TextStyle(
                    fontSize: 40
                  ),
                ),
                ElevatedButton(onPressed: _incrementCounter, child: Text("Increment"))
              ]
          )
      ),
    );
  }
}

/*_________Class MyApp for this code__________*/

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  void userTapped () {
    print("User Tapped");
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:false,
      home: CounterPage(),
    );
  }
}

