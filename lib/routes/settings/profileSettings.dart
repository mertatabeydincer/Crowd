import 'package:crowd/models/objects.dart';
import 'package:crowd/utils/colors.dart';
import 'package:crowd/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:email_validator/email_validator.dart';
import 'package:dropdown_formfield/dropdown_formfield.dart';

class ProfileSettings extends StatefulWidget {
  @override
  _ProfileSettingsState createState() => _ProfileSettingsState();
}

Future<bool> setPreferences(User currentUser) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setBool('settingsChanged', true);
  await prefs.setString('name', currentUser.name);
  await prefs.setString('userName', currentUser.userName);
  await prefs.setString('email', currentUser.email);
  await prefs.setString('gender', currentUser.gender);
  await prefs.setString('biography', currentUser.biography);
  await prefs.setBool('private', currentUser.private);
  return prefs.commit();
}

Future<User> _getPreferences() async {
  var currentUser =
      User(name: "", userName: "", email: "", gender: "", biography: "");
  SharedPreferences prefs = await SharedPreferences.getInstance();
  currentUser.name = prefs.getString('name');
  currentUser.userName = prefs.getString('userName');
  currentUser.email = prefs.getString('email');
  currentUser.biography = prefs.getString('biography');
  currentUser.gender = prefs.getString('gender');

  return currentUser;
}

class _ProfileSettingsState extends State<ProfileSettings> {
  final _formKey = GlobalKey<FormState>();
  var _currentUserSettings =
      User(name: "", userName: "", email: "", gender: "");
  var _newUserSettings = User(name: "", userName: "", email: "", gender: "");

  @override
  void initState() {
    setState(() {
      _getPreferences().then((User currentUser) {
        setState(() {
          this._currentUserSettings = currentUser;
        });
      });
      super.initState();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(

          title: Text("Profile Settings"),
          centerTitle: true,
          backgroundColor: AppColors.candy,
        ),
        body: ListView(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Name:"),
                          TextFormField(
                            initialValue: _currentUserSettings.name,
                            decoration: InputDecoration(
                                fillColor: Colors.white38,
                                filled: true,
                                hintText: _currentUserSettings.name,
                                // This is place holder, disappears
                                //labelText:  _currentUser.name,
                                // This does not disappear
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.pink),
                                )),
                            onSaved: (String value) {
                              if (value == "")
                                value = _currentUserSettings.name;
                              _newUserSettings.name = value;
                            },
                            validator: (value) {
                              return null;
                            },
                          ),
                        ]),
                    SizedBox(
                      height: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Username:"),
                        TextFormField(
                          initialValue: _currentUserSettings.userName,
                          decoration: InputDecoration(
                              fillColor: Colors.white38,
                              filled: true,
                              hintText: _currentUserSettings.userName,
                              // This is place holder, disappears
                              //labelText: "Name",
                              // This does not disappear
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.pink),
                              )),
                          onSaved: (String value) {
                            if (value == "")
                              value = _currentUserSettings.userName;
                            _newUserSettings.userName = value;
                          },
                          validator: (value) {
                            if (value.length > 10) {
                              return 'Username must be at most 10 characters';
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Email:"),
                        TextFormField(
                          initialValue: _currentUserSettings.email,
                          decoration: InputDecoration(
                              fillColor: Colors.white38,
                              filled: true,
                              hintText: _currentUserSettings.email,
                              // This is place holder, disappears
                              //labelText: _currentUser.biography,
                              // This does not disappear
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.pink),
                              )),
                          onSaved: (String value) {
                            if (value == "") value = _currentUserSettings.email;
                            _newUserSettings.email = value;
                          },
                          validator: (value) {
                            return null;
                          },
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Biography:"),
                        TextFormField(
                          initialValue: _currentUserSettings.biography,
                          decoration: InputDecoration(
                              fillColor: Colors.white38,
                              filled: true,
                              hintText: _currentUserSettings.biography,
                              // This is place holder, disappears
                              //labelText: _currentUser.biography,
                              // This does not disappear
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.pink),
                              )),
                          onSaved: (String value) {
                            if (value == "")
                              value = _currentUserSettings.biography;
                            _newUserSettings.biography = value;
                          },
                          validator: (value) {
                            return null;
                          },
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Gender:"),
                        DropDownFormField(
                          titleText: "Please Choose one",
                          value: _currentUserSettings.gender,
                          dataSource: [
                            {
                              "display": "Male",
                              "value": "male",
                            },
                            {
                              "display": "Female",
                              "value": "female",
                            },
                          ],
                          textField: 'display',
                          valueField: 'value',
                          onSaved: (value) {
                            setState(() {
                              if (value == "")
                                value = _currentUserSettings.gender;
                              _newUserSettings.gender = value;
                            });
                          },
                          onChanged: (value) {
                            setState(() {
                              if (value == null)
                                value = _currentUserSettings.gender;
                              _newUserSettings.gender = value;
                            });
                          },
                          validator: (value) {
                            return null;
                          },
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        OutlinedButton(
                          onPressed: () {
                            if (_formKey.currentState.validate()) {
                              _formKey.currentState.save();
                              setPreferences(_newUserSettings)
                                  .then((bool committed) {
                                Navigator.pop(context);
                              });
                            }
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 0),
                            child: Text(
                              'Save Changes',
                              style: kButtonTextStyleCandy,
                            ),
                          ),
                          style: OutlinedButton.styleFrom(),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
