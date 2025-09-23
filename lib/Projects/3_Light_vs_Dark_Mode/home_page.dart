import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tutorial_pr/Projects/3_Light_vs_Dark_Mode/components/box.dart';
import 'package:tutorial_pr/Projects/3_Light_vs_Dark_Mode/components/button.dart';
import 'package:tutorial_pr/Projects/3_Light_vs_Dark_Mode/theme/theme_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Center(
        child: MyBox(
          color: Theme.of(context).colorScheme.secondary,
          child: MyButton(
              color: Theme.of(context).colorScheme.tertiary,
              onTap: () {
                Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
              }
          ),
        ),
      ),
    );
  }
}
