import 'package:flutter/material.dart';

/*_______________Container, Column, AppBar_____________*/
class GenralInfosPage extends StatelessWidget {
  const GenralInfosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        backgroundColor: Colors.deepPurple[400],
        appBar: AppBar(
          title: Text("My App Bar"),
          backgroundColor: Colors.deepPurple,
          leading: Icon(Icons.menu),
          actions: [IconButton(onPressed: () {}, icon: Icon(Icons.logout))],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,//there is .center, .spaceBetween, .spaceEvenly and .spaceAround like css
          crossAxisAlignment: CrossAxisAlignment.center, //it aligns according to the column widget itself not the entire width of the app, if we want that we wrap it in a center widget

          children: [
            Container(
              height: 150,
              width: 150,
              //color: Colors.black,  //we can't use color with BoxDecoration together
              padding: EdgeInsets.all(25),
              //there is .symetric(horizontal:, vertical: ) and
              decoration: BoxDecoration(
                color: Colors.blue[300],
                // curving the corners
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                "Hi I'm a container",
                style: TextStyle(
                  color: Colors.red, // text color
                  fontSize: 16, // optional: text size
                  fontWeight: FontWeight.bold, // optional: bold
                ),
              ),
            ),
            SizedBox(height: 20),
            //we can't use Expanded in a column when the parent is singlescrollview because it'll try to take all the remaining space which is in this cas is infinite even though we fixed the height
            Container(
              height: 100,
              width: 100,
              //color: Colors.black,  //we can't use color with BoxDecoration together
              padding: EdgeInsets.all(25),
              //there is .symetric(horizontal:, vertical: ) and
              decoration: BoxDecoration(
                color: Color(0xFFFF5722),
                // curving the corners
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Icon(Icons.favorite, size: 50, color: Colors.white),
              ),
            ),
            Expanded(child: Container(
              width: 150,//when we don't assign a height to the expanded widget it will automatically take the rest of the column, same thing goes with Row for width
              color: Colors.amber,
            ))
          ],
        ),
    );
  }
}

/*__________________ListView________________*/

class ListViewPage extends StatelessWidget {
  const ListViewPage({super.key});

  final List names = const ["Ayet", "Halima", "Derki"];

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        backgroundColor: Colors.deepPurple[400],
        body: ListView.builder(
          // scrollDirection: Axis.horizontal, //the scroll behaviour
          itemCount: names.length,
          itemBuilder: (context, index)  {
            return ListTile(
              title: Text('Hello ${names[index]}'),
            );
          },
        ),
      );
  }
}

/*__________________GridView_________________*/

class GridViewPage extends StatelessWidget {
  const GridViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GridView.builder(
          itemCount: 64,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 8),
          //it means: “I want a grid with a fixed number of columns across the cross-axis.”, in this case 8 columns
          itemBuilder: (context, index) =>
              Container(
                color: Colors.pink,
                margin: EdgeInsets.all(2),
              ),
        ),
    );
  }
}

/*_____________________Stack____________________*/

class StackPage extends StatelessWidget {
  const StackPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          alignment: Alignment.bottomRight,//and there is other properties
          children: [
            //big container
            Container(
              height: 300,
              width: 300,
              color: Colors.pink,
            ),
            //medium container
            Container(
              height: 200,
              width: 200,
              color: Colors.pink[400],
            ),
            //small container
            Container(
              height: 100,
              width: 100,
              color: Colors.pink[200],
            )
          ],
        ),
      );
  }
}