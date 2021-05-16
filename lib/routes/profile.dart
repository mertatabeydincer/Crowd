import 'package:crowd/models/objects.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:crowd/utils/colors.dart';
import 'package:crowd/utils/styles.dart';

class Profile extends StatefulWidget {
  const Profile({Key key, this.analytics, this.observer}) : super(key: key);

  final FirebaseAnalytics analytics;
  final FirebaseAnalyticsObserver observer;
  @override
  _ProfileState createState() => _ProfileState();
}

Future<bool> setPreferences(User currentUser) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString('name', currentUser.name);
  await prefs.setString('userName', currentUser.userName);
  await prefs.setString('email', currentUser.email);
  await prefs.setString('gender', currentUser.gender);
  await prefs.setString('biography', currentUser.biography);
  await prefs.setBool('private', currentUser.private);
  //prefs.clear();
  return prefs.commit();
}

Future<User> _getPreferences() async {
  var currentUser = User(name: "", userName: "", email: "", gender: "");
  SharedPreferences prefs = await SharedPreferences.getInstance();
  currentUser.name = prefs.getString('name');
  currentUser.userName = prefs.getString('userName');
  currentUser.email = prefs.getString('email');
  currentUser.biography = prefs.getString('biography');
  currentUser.gender = prefs.getString('gender');
  await prefs.setBool('settingsChanged', false);
  return currentUser;
}

class _ProfileState extends State<Profile> {
  Future<void> _setCurrentScreen() async{
    await widget.analytics.setCurrentScreen(screenName: 'Profile Page');

  }
  bool newSettings = false;
  int postCount = 0;
  String name = "", userName = "", biography = "", email = "", gender = "";
  var currentUser = User(
    userID: 20637,
    name: "Mert Atabey ",
    userName: "atabeyyyyyyyy",
    followerCount: 6,
    followingCount: 0,
    email: "atabeymert@sabanciuniv.edu",
    postCount: 3,
    viewCount: 10,
    gender: "male",
    private: false,
    biography: "Cause I'm high",
  );

  void goSettings() {
    setPreferences(currentUser).then((bool committed) {
      Navigator.pushNamed(context, '/settings');
    });
  }

  void isSettingsChanged() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool state = prefs.getBool('settingsChanged');
    print("Setting is changed: ${state}");
    if (state == true) {
      await prefs.setBool('settingsChanged', false);
      newSettings = true;
    } else
      newSettings = false;
  }

  @override
  void initState() {
    setState(() {
      isSettingsChanged();
      _getPreferences().then((User newUser) {
        if (newUser.name != null) {
          setState(() {
            this.currentUser.name = newUser.name;
            this.currentUser.userName = newUser.userName;
            this.currentUser.email = newUser.email;
            this.currentUser.biography = newUser.biography;
            this.currentUser.gender = newUser.gender;
          });
        }
      });

      super.initState();
    });
  }

  List<Post> posts = [
    Post(text: 'Post 1', date: '19 March', likeCount: 30, commentCount: 10),
    Post(text: 'Post 2', date: '18 March', likeCount: 20, commentCount: 20),
    Post(text: 'Post 3', date: '17 March', likeCount: 10, commentCount: 30),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text(
          'Profile',
          style: TextStyle(
            fontFamily: 'BrandonText',
            fontSize: 24.0,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        backgroundColor: AppColors.candy,
        elevation: 0.0,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.candy,
        child: Icon(Icons.add),
        onPressed: () {},
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(20.0, 24.0, 20.0, 0.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                CircleAvatar(
                  backgroundImage: AssetImage("lib/assets/male-avatar.jpg"),
                  radius: 44.0,
                ),
                SizedBox(
                  width: 8,
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            currentUser.name,
                            style: TextStyle(
                              fontFamily: 'BrandonText',
                              fontSize: 25.0,
                              fontWeight: FontWeight.w500,
                              color: AppColors.headingColor,
                            ),
                          ),
                          IconButton(
                            icon: const Icon(
                              Icons.settings,
                            ),
                            onPressed: goSettings,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        currentUser.userName,
                        style: TextStyle(
                          fontFamily: 'BrandonText',
                          fontSize: 18.0,
                          fontWeight: FontWeight.w400,
                          color: AppColors.textColor,
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          Icon(
                            Icons.email,
                            color: AppColors.candy,
                          ),
                          SizedBox(width: 8.0),
                          Text(
                            currentUser.email,
                            style: TextStyle(
                              fontFamily: 'BrandonText',
                              fontSize: 18.0,
                              fontWeight: FontWeight.w400,
                              color: AppColors.textColor,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  currentUser.biography,
                  style: TextStyle(
                    fontFamily: 'BrandonText',
                    fontSize: 15.0,
                    fontWeight: FontWeight.w400,
                    color: AppColors.textColor,
                  ),
                ),
              ],
            ),
            Divider(
              color: AppColors.candy,
              height: 30,
              thickness: 2.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Text(
                      'Posts',
                      style: TextStyle(
                        color: AppColors.textColor,
                        fontFamily: 'BrandonText',
                        fontSize: 18.0,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      '10',
                      style: TextStyle(
                        fontFamily: 'BrandonText',
                        fontSize: 24.0,
                        fontWeight: FontWeight.w800,
                        color: AppColors.candy,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Text(
                      'Followers',
                      style: TextStyle(
                        fontFamily: 'BrandonText',
                        fontSize: 18.0,
                        fontWeight: FontWeight.w400,
                        color: AppColors.textColor,
                      ),
                    ),
                    Text(
                      '10',
                      style: TextStyle(
                        fontFamily: 'BrandonText',
                        fontSize: 24.0,
                        fontWeight: FontWeight.w800,
                        color: AppColors.candy,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Text(
                      'Following',
                      style: TextStyle(
                        fontFamily: 'BrandonText',
                        fontSize: 18.0,
                        fontWeight: FontWeight.w400,
                        color: AppColors.textColor,
                      ),
                    ),
                    Text(
                      '10',
                      style: TextStyle(
                        fontFamily: 'BrandonText',
                        fontSize: 24.0,
                        fontWeight: FontWeight.w800,
                        color: AppColors.candy,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Divider(
              color: AppColors.candy,
              height: 30,
              thickness: 2.0,
            ),
            Column(),
          ],
        ),
      ),
    );
  }
}
