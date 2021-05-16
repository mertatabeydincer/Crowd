import 'dart:async';
import 'package:crowd/routes/settings/privacySettings.dart';
import 'package:crowd/routes/settings/profileSettings.dart';
import 'package:crowd/routes/settings/crowdSettings.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:crowd/routes/walkthrough.dart';
import 'package:crowd/routes/welcome.dart';
import 'package:crowd/routes/login.dart';
import 'package:crowd/routes/signup.dart';
import 'package:crowd/routes/feed.dart';
import 'package:crowd/routes/profile.dart';
import 'package:crowd/routes/settings.dart';
import 'package:crowd/routes/search.dart';
import 'package:crowd/routes/landingPage.dart';
import 'package:crowd/routes/homeP.dart';

import 'routes/welcome.dart';
import 'routes/welcome.dart';




void main() async {

  print("initializing");
  // handle exceptions caused by making main async
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  String initRoute;
  // init a shared preferences variable
  SharedPreferences prefs = await SharedPreferences.getInstance();
  // get the locally stored boolean variable
  bool isFirstLaunch = prefs.getBool('isFirstLaunch');
  print("First Launch Status: ${isFirstLaunch}");
  bool isLoggedInAnonymous = prefs.getBool('anonymousLogin');
  print("Login Status: ${isLoggedInAnonymous}");
  bool isLoggedInUser = prefs.getBool('userLogin');

  // ignore: deprecated_member_use
  //prefs.commit();

  // define the initial route based on whether the user is logged in or not
  if (isFirstLaunch == false) {
    if (isLoggedInAnonymous == true) {
      initRoute = '/landingPage';
      print("check2");
    } else {
      initRoute = '/welcome';
      print("check1");

    }
  } else {
    initRoute = '/walkthrough';
    await prefs.setBool('isFirstLaunch', false);
    print("check3");
  }
  //prefs.clear(); //uncomment and hot restart once then take into comment and hot restart again, this sets all shared preferences to null
  print("Initial route is $initRoute");

  Widget MMM = MaterialApp(

    initialRoute: initRoute,
    routes: {
      '/walkThrough': (context) => WalkThrough(),
      '/welcome': (context) => Welcome(),
      '/login': (context) => Login(),
      '/signup': (context) => SignUp(),
      '/feed': (context) => Feed(),
      '/profile': (context) => Profile(),
      '/settings': (context) => Settings(),
      '/profileSettings': (context) => ProfileSettings(),
      '/privacySettings': (context) => PrivacySettings(),
      '/crowdSettings': (context) => CrowdSettings(),
      '/search': (context) => Search(),
      '/landingPage': (context) => LandingPage(),
      '/homeP': (context) => HomePage(),
    },
  );
  //Widget AAA = MMM();
  //runApp(app);
  runApp(MMM);
}


class MMM extends StatelessWidget {
  const MMM({Key key}) : super(key: key);

  static FirebaseAnalytics analytics = FirebaseAnalytics();
  static FirebaseAnalyticsObserver observer = FirebaseAnalyticsObserver(analytics: analytics);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorObservers: <NavigatorObserver>[observer],
      home: WalkThrough(analytics: analytics,observer: observer),

    );

  }
}

