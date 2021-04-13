import 'package:flutter/material.dart';

import 'package:crowd/routes/walkthrough.dart';
import 'package:crowd/routes/welcome.dart';
import 'package:crowd/routes/login.dart';
import 'package:crowd/routes/signup.dart';


void main() => runApp(MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => WalkThrough(),
        '/welcome': (context) => Welcome(),
        '/login': (context) => Login(),
        '/signup': (context) => SignUp(),

      },
    ));
