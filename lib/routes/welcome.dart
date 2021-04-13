import 'package:flutter/material.dart';
import 'package:crowd/utils/styles.dart';

class Welcome extends StatefulWidget {
  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  void goLogin() {
    setState(() {
      Navigator.pushNamed(context, '/login');
    });
  }

  void goSignUp() {
    setState(() {
      Navigator.pushNamed(context, '/signup');
    });
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
                    onPressed: goLogin,
                    child: Text(
                      "Login",
                      style: kButtonTextStylePrimary,
                    ),
                  ),
                  OutlineButton(
                    color: Colors.teal.shade300,
                    onPressed: goSignUp,
                    child: Text("Sign Up",
                      style: kButtonTextStyleCandy,
                    ),
                  ),
                ],
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '');
                },
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
