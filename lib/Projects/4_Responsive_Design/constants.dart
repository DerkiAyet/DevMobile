import 'package:flutter/material.dart';

var myDefaultBackground = Colors.grey[300];

var myAppBar = AppBar(
  backgroundColor: Colors.grey[900],
  elevation: 0,
  leading: Builder(
    builder: (context) {
      return Padding(
        padding: const EdgeInsets.only(left: 12.0),
        child: IconButton(
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
          icon: Icon(Icons.menu, color: Colors.white),
        ),
      );
    },
  ),
);

var myDrawer =  Drawer(
  backgroundColor: myDefaultBackground,
  child: Column(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Column(
        children: [
          DrawerHeader(child: Icon(Icons.favorite, size: 40)),
          ListTile(
            leading: Icon(Icons.home),
            title: Text("D A S H B O A R D"),
          ),
          ListTile(leading: Icon(Icons.chat), title: Text("M E S S A G E")),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text("S E T T I N G S"),
          ),
        ],
      ),
      Padding(
        padding: const EdgeInsets.only(bottom: 20.0),
        child: ListTile(leading: Icon(Icons.logout), title: Text("L O G O U T")),
      ),
    ],
  ),
);