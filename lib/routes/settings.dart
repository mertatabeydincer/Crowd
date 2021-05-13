import 'package:crowd/utils/colors.dart';
import 'package:crowd/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:crowd/routes/profile.dart';
import 'package:email_validator/email_validator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  void logout() async {
    String initialRoute;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isUser = prefs.getBool("userLogin");
    bool isAnonymous = prefs.getBool("anonymousLogin");
    if (isUser == true) {
      prefs.setBool("userLogin", false);
      print("Logout status is userLogout and ${prefs.getBool("userLogin")}");
    } else if (isAnonymous == true) {
      prefs.setBool("anonymousLogin", false);
      print(
          "Logout status is anonymousLogout and ${prefs.getBool("anonymousLogin")}");
    }
    Navigator.pushNamedAndRemoveUntil(context, '/welcome', (_) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
        centerTitle: true,
        backgroundColor: AppColors.candy,
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextButton(
                child: Text(
                  "Profile Settings",
                  style: kButtonTextStyleCandyLarge,
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/profileSettings');
                },
              ),
              Divider(
                color: AppColors.candy,
                height: 1,
                thickness: 2.0,
              ),
              TextButton(
                child: Text(
                  "Privacy Settings",
                  style: kButtonTextStyleCandyLarge,
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/privacySettings');
                },
              ),
              Divider(
                color: AppColors.candy,
                height: 1,
                thickness: 2.0,
              ),
              TextButton(
                child:
                    Text("Crowd Settings", style: kButtonTextStyleCandyLarge),
                onPressed: () {
                  Navigator.pushNamed(context, '/crowdSettings');
                },
              ),
              Divider(
                color: AppColors.candy,
                height: 1,
                thickness: 2.0,
              ),
              TextButton(
                child: Text(
                  "Logout",
                  style: kButtonTextStyleCandyLarge,
                ),
                onPressed: logout,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
