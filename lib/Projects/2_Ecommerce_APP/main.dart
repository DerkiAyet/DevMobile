import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tutorial_pr/Projects/2_Ecommerce_APP/models/cart.dart';
import 'package:tutorial_pr/Projects/2_Ecommerce_APP/utils/intro_page.dart';

void main() {
  runApp(EcommerceApp());
}

class EcommerceApp extends StatelessWidget {
  const EcommerceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider( ///the provider is a state management solution: very similar to useContext in React
      create: (context) => Cart(),/// se can make providers as many as we want of course
      builder: (context, child) =>
      const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: IntroPage(),
      ),
    );
  }
}
