import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class MyBottomNavbar extends StatelessWidget {
  final Function(int) onTapChange;
  const MyBottomNavbar({
    super.key,
    required this.onTapChange
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: GNav(
        color: Colors.grey[400],
        activeColor: Colors.grey.shade700,
        tabActiveBorder: Border.all(color: Colors.white),
        tabBackgroundColor: Colors.grey.shade100,
        mainAxisAlignment: MainAxisAlignment.center,
        tabBorderRadius: 12,
        onTabChange: (value) => onTapChange(value),

        tabs: [
          GButton(icon: Icons.home, text: "Shop"),
          GButton(icon: Icons.shopping_bag_rounded, text: "Cart"),
        ],
      ),
    );
  }
}
