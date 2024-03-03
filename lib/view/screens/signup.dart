import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:luxeride/view/screens/login.dart';
import 'package:luxeride/view/screens/splash.dart';
import 'package:luxeride/view/widgets/global_widgets.dart';

class SignUp extends StatelessWidget {
   SignUp({super.key});

  final _formkey = GlobalKey<FormState>();

  final usernamecontroller = TextEditingController();

  final passwordcontroller = TextEditingController();

  void login(BuildContext context) async {
    String username = usernamecontroller.text;
    String password = passwordcontroller.text;

    if (username == usernamecontroller.text &&
        password == passwordcontroller.text) {
      var sharedPref = await SharedPreferences.getInstance();
      sharedPref.setBool(SplashScreenState.KEYLOGIN, true);

      // ignore: use_build_context_synchronously
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => Login(
                username: usernamecontroller.text,
                password: passwordcontroller.text)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: const Color(0x00f3f5f7),
          width: double.infinity,
          child: Column(children: [
            const Gap(60),
            const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 30),
                child: Text(
                  'LUXE-RIDE',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 30, left: 28),
              child: Text('RIDE YOUR DREAMS', style: TextStyle(fontSize: 33)),
            ),
            const MainImageWidget(imagepath: 'assets/images/corvette.png'),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28),
              child: Form(
                key: _formkey,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('SIGN UP', style: TextStyle(fontSize: 25)),
                      const Gap(18),
                      SignupTextFormWidget(
                          hinttext: 'USERNAME',
                          controller: usernamecontroller,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Enter Username';
                            } else {
                              return null;
                            }
                          }),
                      const Gap(32),
                      SignupTextFormWidget(
                          hinttext: 'PASSWORD',
                          controller: passwordcontroller,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Enter Password';
                            } else {
                              return null;
                            }
                          }),
                    ]),
              ),
            ),
            const Gap(25),
            FilledButtonWidget(
                onPressedButton: () {
                  if (_formkey.currentState!.validate()) {
                    login(context);
                  }
                },
                buttontext: 'SIGN UP')
          ]),
        ),
      ),
    );
  }
}
