import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:flutter/material.dart';
import 'package:crowd/utils/colors.dart';
import 'package:crowd/utils/styles.dart';
import 'package:email_validator/email_validator.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key key, this.analytics, this.observer}) : super(key: key);

  final FirebaseAnalytics analytics;
  final FirebaseAnalyticsObserver observer;
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  int attemptCount;
  String email, username, password;
  final _formKey = GlobalKey<FormState>();
  Future<void> _setCurrentScreen() async{
    await widget.analytics.setCurrentScreen(screenName: 'SignUp Page');

  }
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          stops: [0.05, 0.2, 0.4, 0.9, 0.95],
          colors: AppColors.gradientBlue,
        ),
      ),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image(image: AssetImage("lib/assets/SIGN UP.png")),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                            fillColor: Colors.white38,
                            filled: true,
                            hintText: "E-mail",
                            // This is place holder, disappears
                            //labelText: "E-mail",
                            // This does not disappear
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.pink),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30.0)),
                            )),
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value.isEmpty) return "Please enter your e-mail";
                          if (!EmailValidator.validate(value))
                            return "Email is not valid";
                          return null;
                        },
                        onSaved: (String value) {
                          email = value;
                        },
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: TextFormField(
                              decoration: InputDecoration(
                                  fillColor: Colors.white38,
                                  filled: true,
                                  hintText: "Username",
                                  // This is place holder, disappears
                                  //labelText: "Username",
                                  // This does not disappear
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.pink),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(30.0)),
                                  )),
                              keyboardType: TextInputType.text,
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Please enter your username';
                                }
                                return null;
                              },
                              onSaved: (String value) {
                                username = value;
                              },
                            ),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            flex: 1,
                            child: TextFormField(
                              decoration: InputDecoration(
                                  fillColor: Colors.white38,
                                  filled: true,
                                  hintText: "Password",
                                  // This is place holder, disappears
                                  //labelText: "Password",
                                  // This does not disappear
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(30.0)),
                                  )),
                              keyboardType: TextInputType.text,
                              obscureText: true,
                              enableSuggestions: false,
                              autocorrect: false,
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Please enter your password';
                                }
                                if (value.length < 8) {
                                  return 'Password must be at least 8 characters';
                                }
                                return null;
                              },
                              onSaved: (String value) {
                                password = value;
                              },
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                            flex: 1,
                            child: OutlinedButton(
                              onPressed: () {
                                if (_formKey.currentState.validate()) {
                                  _formKey.currentState.save();

                                  setState(() {
                                    attemptCount += 1;
                                  });
                                  Scaffold.of(context).showSnackBar(
                                      SnackBar(content: Text('Signing up')));
                                }
                              },
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 12.0),
                                child: Text(
                                  'Sign Up',
                                  style: kButtonTextStyleCandy,
                                ),
                              ),
                              style: OutlinedButton.styleFrom(),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      child: Text(
                        "Already have an account?",
                        style: kLinkTextStyleCandy,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.pushNamed(context, '/login');
                      },
                    )
                  ],
                )
              ],
            ),
          )),
    );
  }
}
