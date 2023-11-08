import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

// ignore: must_be_immutable
class MyButtonNavBar extends StatelessWidget {
  void Function(int)? onTabChange;
  MyButtonNavBar({super.key, required this.onTabChange});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: GNav(
          color: Colors.grey[400],
          activeColor: Colors.grey.shade700,
          tabActiveBorder: Border.all(color: Colors.white),
          tabBackgroundColor: Colors.grey.shade100,
          tabBorderRadius: 16,
          mainAxisAlignment: MainAxisAlignment.center,
          onTabChange: onTabChange,
          gap: 8,
          tabs: const [
            GButton(
              icon: Icons.home,
              text: 'Shop',
            ),
            GButton(
              icon: Icons.shopping_bag_rounded,
              text: 'Cart',
            ),
          ]),
    );
  }
}
