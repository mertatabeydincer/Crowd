import 'package:flutter/material.dart';
import 'package:crowd/utils/styles.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Welcome extends StatefulWidget {
  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  void login() {
    setState(() {
      Navigator.pushNamed(context, '/login');
    });
  }

  void signUp() {
    setState(() {
      Navigator.pushNamed(context, '/signup');
    });
  }

  void anonymousLogin() async {
    String initialRoute;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print("Login status is Anonymous and ${prefs.getBool("anonymousLogin")}");
    prefs.setBool("anonymousLogin", true);
    print("Login status is Anonymous and ${prefs.getBool("anonymousLogin")}");
    Navigator.pushNamedAndRemoveUntil(context, '/landingPage', (_) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(
                children: [
                  Image(
                    image: AssetImage("lib/assets/crowdapp.png"),
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  OutlineButton(
                    color: Colors.teal.shade300,
                    onPressed: login,
                    child: Text(
                      "Login",
                      style: kButtonTextStylePrimary,
                    ),
                  ),
                  OutlineButton(
                    color: Colors.teal.shade300,
                    onPressed: signUp,
                    child: Text(
                      "Sign Up",
                      style: kButtonTextStyleCandy,
                    ),
                  ),
                ],
              ),
              TextButton(
                onPressed: anonymousLogin,
                child: Text(
                  "continue as anonymous",
                  style: kButtonTextStyleSuccess,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
