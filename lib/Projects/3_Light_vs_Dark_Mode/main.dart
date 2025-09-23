import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tutorial_pr/Projects/3_Light_vs_Dark_Mode/home_page.dart';
import 'package:tutorial_pr/Projects/3_Light_vs_Dark_Mode/theme/theme.dart';
import 'package:tutorial_pr/Projects/3_Light_vs_Dark_Mode/theme/theme_provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
    child: ThemesApp(),
  )
  );
}

//----------A note if I have many providers---------

// void main() {
//   runApp(
//     MultiProvider(
//       providers: [
//         ChangeNotifierProvider(create: (context) => ThemeProvider()),
//         ChangeNotifierProvider(create: (context) => CartProvider()),
//         ChangeNotifierProvider(create: (context) => UserProvider()),
//         // add more here...
//       ],
//       child: ThemesApp(),
//     ),
//   );
// }


class ThemesApp extends StatelessWidget {
  const ThemesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Provider.of<ThemeProvider>(context).themeData,
      home: HomePage(),
    );
  }
}
