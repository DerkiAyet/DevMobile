import 'package:flutter/material.dart';
import 'package:tutorial_pr/Projects/4_Responsive_Design/layouts/desktop_scaffold.dart';
import 'package:tutorial_pr/Projects/4_Responsive_Design/layouts/mobile_scaffold.dart';
import 'package:tutorial_pr/Projects/4_Responsive_Design/layouts/tablet_scaffold.dart';
import 'package:tutorial_pr/Projects/4_Responsive_Design/responsive_layout.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ResponsiveLayout(
        mobileScaffold: const MobileScaffold(),
        tabletScaffold: const TabletScaffold(),
        desktopScaffold: const DesktopScaffold(),
      ),
    );
  }
}
