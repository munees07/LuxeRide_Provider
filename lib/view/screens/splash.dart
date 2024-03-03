import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:luxeride/view/screens/bottom_nav.dart';
import 'package:luxeride/view/screens/signup.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  // ignore: constant_identifier_names
  static const String KEYLOGIN = "Login";

  @override
  void initState() {
    super.initState();

    toGo();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
    );
  }

  void toGo() async {
    var sharedPref = await SharedPreferences.getInstance();

    var isLoggedIn = sharedPref.getBool(KEYLOGIN);

    Future.delayed(const Duration(milliseconds: 1), () {
      if (isLoggedIn != null) {
        if (isLoggedIn) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const BottomNav()),
          );
        } else {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) =>  SignUp()),
          );
        }
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) =>  SignUp()),
        );
      }
    });
  }
}
