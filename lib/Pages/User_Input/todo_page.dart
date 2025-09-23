import 'package:flutter/material.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {

  String greetingMessage = "";
  TextEditingController myControlller = TextEditingController();

  void greetUser (){
    setState(() {
      greetingMessage = "Hello" + myControlller.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(greetingMessage),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.8, // 80% width of screen
              child: TextField(
                controller: myControlller,
                keyboardType: TextInputType.text, // keyboard type
                obscureText: false, // set true if it's a password
                maxLength: 50, // max characters
                maxLines: 1, // single line input
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.start,
                cursorColor: Colors.deepPurple,
                autofocus: false,
                decoration: InputDecoration(
                  hintText: "Enter your name",
                  labelText: "Name",
                  helperText: "We will not share your userName",
                  //errorText: "That's not a valid email",
                  prefixIcon: Icon(Icons.email),
                  suffixIcon: Icon(Icons.check_circle, color: Colors.green),
                  prefixText: "👉 ",
                  suffixText: " ✅",
                  filled: true,
                  fillColor: Colors.grey.shade100,
                  contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),

                  // Borders
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: Colors.grey, width: 1),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: Colors.deepPurple, width: 2),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: Colors.red, width: 2),
                  ),
                ),

                // Callbacks
                onChanged: (value) {
                  print("Text changed: $value");
                },
                onSubmitted: (value) {
                  print("User submitted: $value");
                },
              ),
            ),
            ElevatedButton(onPressed: greetUser, child: Text("Tap"))
          ],
        ),
      ),
    );
  }
}
