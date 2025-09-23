import 'package:flutter/material.dart';

//import 'second_page.dart';
import 'home_page.dart';
import 'settings_page.dart';
import 'profile_page.dart';

class FirstPage extends StatefulWidget {
  /// if we want to change from a statless to a stateful widget we hover on the StatlessWidget and tap: alt + enter
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  int _selectedIndex =
      0; // we don't use final in stateful widget in most of the time

  void _navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List _pages = const [HomePage(), ProfilePage(), SettingsPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("My App Bar first title")),
      //----The Drawer!!-----//
      drawer: Drawer(
        backgroundColor: Colors.pink[100],
        child: Column(
          children: [
            DrawerHeader(
              child: Icon(Icons.favorite, size: 48, color: Colors.pink),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text("H O M E"),
              onTap: () {
                Navigator.pop(
                  context,
                ); //we made this so we pop the drawer so when we return to the page we won't find the drawer opened
                Navigator.pushNamed(context, '/homepage');
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text("S E T T I N G S"),
              onTap: () {
                Navigator.pop(
                  context,
                ); //we made this so we pop the drawer so when we return to the page we won't find the drawer opened
                Navigator.pushNamed(context, '/settings');
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _navigateBottomBar,
        items: [
          //home
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          //home
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          //home
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: "Settings",
          ),
        ],
      ),
      body: _pages[_selectedIndex],
      // body: Center(
      //   child: ElevatedButton(
      //     onPressed: () {
      //       // Navigator.push(context,
      //       //     MaterialPageRoute(builder: (context) => SecondPage())); //this is the classic way
      //       //with the route name:
      //       Navigator.pushNamed(context, "/secondpage");
      //     },
      //     child: Text("go to second page"),
      //   ),
      // ),
    );
  }
}
