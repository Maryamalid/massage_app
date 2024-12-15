import 'package:flutter/material.dart';
import 'package:massage_app/login/screens/registeratoin_screen.dart';
import 'package:massage_app/login/screens/signin_screen.dart';
import 'package:massage_app/login/screens/widgets/button.dart';

class WelcomeScreen extends StatefulWidget {
  static const String screenRoute = 'welcome_screen';

  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Column(
              children: [
                Container(
                  height: 180,
                  child: Image.asset('assets/images/mobile1.png'),
                ),
                SizedBox(height: 40),
                Text(
                  'My Messages',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w900,
                    color: Color.fromARGB(255, 59, 57, 57),
                  ),
                ),
              ],
            ),
            SizedBox(height: 25),
            MyButton(
              color: Color.fromARGB(255, 96, 139, 139),
              title: 'Sign in',
              onPressed: () {
                Navigator.pushNamed(context, SignInScreen.screenRoute);
              },
            ),
            MyButton(
              color: Color.fromARGB(255, 227, 86, 86),
              title: 'Register',
              onPressed: () {
                Navigator.pushNamed(context, RegistrationScreen.screenRoute);
              },
            )
          ],
        ),
      ),
    );
  }
}
