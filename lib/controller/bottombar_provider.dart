import 'package:flutter/material.dart';
import 'package:luxeride/view/screens/bookings.dart';
import 'package:luxeride/view/screens/home.dart';
import 'package:luxeride/view/screens/settings.dart';
import 'package:luxeride/view/subscreens/add_screen.dart';

class BottomBarProvider extends ChangeNotifier {
  int currentIndex = 0;
  onTap(int index) {
    currentIndex = index;
    notifyListeners();
  }

  final List pages = [
    const Home(),
    const AddScreen(),
    const Bookings(),
    const Profile()
  ];
}
