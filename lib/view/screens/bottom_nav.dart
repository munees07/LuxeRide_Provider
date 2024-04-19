import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:luxeride/controller/bottombar_provider.dart';
import 'package:provider/provider.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({super.key});
  @override
  Widget build(BuildContext context) {
    
    final provider = Provider.of<BottomBarProvider>(context);
    return Scaffold(
      backgroundColor: const Color(0x00f3f5f7),
      body: provider.pages[provider.currentIndex],
      bottomNavigationBar:
          CurvedNavigationBar(
              backgroundColor: const Color.fromARGB(255, 249, 249, 249),
              color: Colors.black54,
              buttonBackgroundColor: Colors.black,
              animationDuration: const Duration(milliseconds: 300),
              index: provider.currentIndex,
              onTap: provider.onTap,
              items: const [
                Icon(Icons.home_filled, color: Colors.white),
                Icon(Icons.add, color: Colors.white),
                Icon(Icons.done_all_rounded, color: Colors.white),
                Icon(Icons.settings, color: Colors.white)
              ]),
    );
  }
}
