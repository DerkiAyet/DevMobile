import 'package:flutter/material.dart';
import 'package:tutorial_pr/Projects/4_Responsive_Design/constants.dart';
import 'package:tutorial_pr/Projects/4_Responsive_Design/utils/my_box.dart';
import 'package:tutorial_pr/Projects/4_Responsive_Design/utils/my_tile.dart';

class MobileScaffold extends StatefulWidget {
  const MobileScaffold({super.key});

  @override
  State<MobileScaffold> createState() => _MobileScaffoldState();
}

class _MobileScaffoldState extends State<MobileScaffold> {
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
            aspectRatio: 1,

            /// gives the grid finite height, based on width: which is infinite so "aspectRatio: 1" means height = width (which in this case is infinite)
            child: SizedBox(
              width: double.infinity,

              /// do for the inifinte wisth we wrap the GridView in an infinte width sizedBox
              child: GridView.builder(
                /// GridView needs finite constraints (width/height) to calculate its layout, but Column doesn't give it infinite width/height
                itemCount: 4,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
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
