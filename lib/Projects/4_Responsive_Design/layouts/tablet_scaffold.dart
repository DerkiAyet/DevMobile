import 'package:flutter/material.dart';
import '../constants.dart';
import '../utils/my_box.dart';
import '../utils/my_tile.dart';

class TabletScaffold extends StatefulWidget {
  const TabletScaffold({super.key});

  @override
  State<TabletScaffold> createState() => _TabletScaffoldState();
}

class _TabletScaffoldState extends State<TabletScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: myDefaultBackground,
      appBar: myAppBar,
      drawer: myDrawer,
      body: Column(
        children: [
          // 4 boxes on the top
          AspectRatio(
            aspectRatio: 4, /// If the parent gives it 400px width → height = 400 / 4 = 100px
            child: SizedBox(
              width: double.infinity, /// do for the inifinte wisth we wrap the GridView in an infinte width sizedBox
              child: GridView.builder(
                /// GridView needs finite constraints (width/height) to calculate its layout, but Column doesn't give it infinite width/height
                itemCount: 4,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                ),
                itemBuilder: (context, index) {
                  return MyBox();
                },
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, index) {
                return MyTile();
              },
            ),
          ),

          //tiles below
        ],
      ),
    );
  }
}
