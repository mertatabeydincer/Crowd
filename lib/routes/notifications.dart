import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:flutter/material.dart';
import 'package:crowd/utils/colors.dart';

class Notifications extends StatefulWidget {
  const Notifications({Key key, this.analytics, this.observer}) : super(key: key);

  final FirebaseAnalytics analytics;
  final FirebaseAnalyticsObserver observer;
  @override
  _Notifications createState() => _Notifications();
}

class _Notifications extends State<Notifications> {

  Future<void> _setCurrentScreen() async{
    await widget.analytics.setCurrentScreen(screenName: 'Notifications Page');

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Notifications"),
        centerTitle: true,
        backgroundColor: AppColors.candy,
      ),
      body: ListView(
        children: <Widget>[
          Card(
              color: AppColors.captionColor,
              child: Padding(
                padding: EdgeInsets.all(5.0),
                child: Column(
                  children: <Widget>[
                    Container(
                      width: MediaQuery
                          .of(context)
                          .size
                          .width,
                      child: Text("Notification 1", style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18.0),),
                    ),


                  ],
                ),
              )
          ),
          Card(
              color: AppColors.captionColor,
              child: Padding(
                padding: EdgeInsets.all(5.0),
                child: Column(
                  children: <Widget>[
                    Container(
                      width: MediaQuery
                          .of(context)
                          .size
                          .width,
                      child: Text("Notification 2", style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18.0),),
                    ),


                  ],
                ),
              )
          ),
          Card(
              color: AppColors.captionColor,
              child: Padding(
                padding: EdgeInsets.all(5.0),
                child: Column(
                  children: <Widget>[
                    Container(
                      width: MediaQuery
                          .of(context)
                          .size
                          .width,
                      child: Text("Notification 3", style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18.0),),
                    ),


                  ],
                ),
              )
          ),
          Card(
              color: AppColors.captionColor,
              child: Padding(
                padding: EdgeInsets.all(5.0),
                child: Column(
                  children: <Widget>[
                    Container(
                      width: MediaQuery
                          .of(context)
                          .size
                          .width,
                      child: Text("Notification 4", style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18.0),),
                    ),


                  ],
                ),
              )
          ),
          Card(
              color: AppColors.captionColor,
              child: Padding(
                padding: EdgeInsets.all(5.0),
                child: Column(
                  children: <Widget>[
                    Container(
                      width: MediaQuery
                          .of(context)
                          .size
                          .width,
                      child: Text("Notification 5", style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18.0),),
                    ),


                  ],
                ),
              )
          ),
          Card(
              color: AppColors.captionColor,
              child: Padding(
                padding: EdgeInsets.all(5.0),
                child: Column(
                  children: <Widget>[
                    Container(
                      width: MediaQuery
                          .of(context)
                          .size
                          .width,
                      child: Text("Notification 6", style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18.0),),
                    ),


                  ],
                ),
              )
          ),
          Card(
              color: AppColors.captionColor,
              child: Padding(
                padding: EdgeInsets.all(5.0),
                child: Column(
                  children: <Widget>[
                    Container(
                      width: MediaQuery
                          .of(context)
                          .size
                          .width,
                      child: Text("Notification 7", style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18.0),),
                    ),


                  ],
                ),
              )
          ),
          Card(
              color: AppColors.captionColor,
              child: Padding(
                padding: EdgeInsets.all(5.0),
                child: Column(
                  children: <Widget>[
                    Container(
                      width: MediaQuery
                          .of(context)
                          .size
                          .width,
                      child: Text("Notification 8", style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18.0),),
                    ),


                  ],
                ),
              )
          ),
          Card(
              color: AppColors.captionColor,
              child: Padding(
                padding: EdgeInsets.all(5.0),
                child: Column(
                  children: <Widget>[
                    Container(
                      width: MediaQuery
                          .of(context)
                          .size
                          .width,
                      child: Text("Notification 9", style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18.0),),
                    ),


                  ],
                ),
              )
          ),
          Card(
              color: AppColors.captionColor,
              child: Padding(
                padding: EdgeInsets.all(5.0),
                child: Column(
                  children: <Widget>[
                    Container(
                      width: MediaQuery
                          .of(context)
                          .size
                          .width,
                      child: Text("Notification 10", style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18.0),),
                    ),


                  ],
                ),
              )
          ),
          Card(
              color: AppColors.captionColor,
              child: Padding(
                padding: EdgeInsets.all(5.0),
                child: Column(
                  children: <Widget>[
                    Container(
                      width: MediaQuery
                          .of(context)
                          .size
                          .width,
                      child: Text("Notification 11", style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18.0),),
                    ),


                  ],
                ),
              )
          ),
          Card(
              color: AppColors.captionColor,
              child: Padding(
                padding: EdgeInsets.all(5.0),
                child: Column(
                  children: <Widget>[
                    Container(
                      width: MediaQuery
                          .of(context)
                          .size
                          .width,
                      child: Text("Notification 12", style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18.0),),
                    ),


                  ],
                ),
              )
          ),
          Card(
              color: AppColors.captionColor,
              child: Padding(
                padding: EdgeInsets.all(5.0),
                child: Column(
                  children: <Widget>[
                    Container(
                      width: MediaQuery
                          .of(context)
                          .size
                          .width,
                      child: Text("Notification 13", style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18.0),),
                    ),


                  ],
                ),
              )
          ),Card(
              color: AppColors.captionColor,
              child: Padding(
                padding: EdgeInsets.all(5.0),
                child: Column(
                  children: <Widget>[
                    Container(
                      width: MediaQuery
                          .of(context)
                          .size
                          .width,
                      child: Text("Notification 14", style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18.0),),
                    ),
                  ],
                ),
              )
          ),
        ],
      ),
    );
  }
}
