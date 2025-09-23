import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second App Bar"),
      ),
      body: Center(
        child: Text("Hi I'm second page"),
      ),
    );
  }
}
