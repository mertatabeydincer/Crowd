import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:crowd/utils/colors.dart';
import 'package:crowd/utils/styles.dart';

class Feed extends StatefulWidget {
  @override
  _Feed createState() => _Feed();
}

class _Feed extends State<Feed> {
  @override
  Widget build(BuildContext context) => DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            toolbarHeight: 25,
            flexibleSpace: Container(
              padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
              child: TabBar(
                  indicatorColor: Colors.white,
                  indicatorWeight: 1,
                  tabs: [
                    Tab(
                      icon: Icon(Icons.dynamic_feed),
                      text: "Feed",
                    ),
                    Tab(
                      icon: Icon(Icons.trending_up),
                      text: "Trend",
                    ),
                    Tab(
                      icon: Icon(Icons.people_outlined),
                      text: "Meet",
                    ),
                    Tab(
                      icon: Icon(Icons.favorite),
                      text: "Favorites",
                    )
                  ]),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [AppColors.pink4, AppColors.pink2],
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                ),
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: AppColors.candy,
            child: Icon(Icons.add),
            onPressed: () {},
          ),
          body: TabBarView(
            children: [
              buildPage(context),
              buildT("Trend Page"),
              buildT("Meet Page"),
              buildT("Favorites Page")
            ],
          ),
        ),
      );

  Widget buildPage(BuildContext context) => Scaffold(
        body: ListView(
          children: <Widget>[
            Card(
                color: AppColors.captionColor,
                child: Padding(
                  padding: EdgeInsets.all(0.0),
                  child: Column(
                    children: <Widget>[
                      ListTile(
                        leading: CircleAvatar(
                          radius: 30.0,
                          backgroundImage: AssetImage("lib/assets/male-avatar.jpg"),
                        ),
                        title: Text("Yiğit Tamer",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20.0)),
                        subtitle: Text("Crowd-CTO"),
                        trailing: Icon(Icons.more_horiz),
                        contentPadding: EdgeInsets.all(1.0),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: Text(
                          "Elon Bey coin aldım tweet atar mısınız?",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20.0),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: Text(
                          "",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20.0),
                        ),
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                SizedBox(width: 240.0),
                                Icon(
                                  Icons.thumb_up,
                                  size: 18.0,
                                  color: Colors.green,
                                ),
                                SizedBox(width: 2.0),
                                Text("11"),
                                SizedBox(width: 12.0),
                                Icon(
                                  Icons.thumb_down,
                                  size: 18.0,
                                  color: Colors.red,
                                ),
                                SizedBox(width: 2.0),
                                Text("15"),
                                SizedBox(width: 16.0),
                                Icon(
                                  Icons.comment,
                                  size: 18.0,
                                  color: Colors.blueGrey,
                                ),
                                SizedBox(width: 2.0),
                                Text("138"),
                              ],
                            )
                          ],
                        ),
                      ),
                      Divider(
                        color: Colors.grey,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Icon(
                                Icons.thumb_up,
                                size: 20.0,
                              ),
                              SizedBox(width: 5.0),
                              Text("Like"),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Icon(
                                Icons.thumb_down,
                                size: 20.0,
                              ),
                              SizedBox(width: 5.0),
                              Text("Dislike"),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Icon(
                                Icons.comment,
                                size: 20.0,
                              ),
                              SizedBox(width: 5.0),
                              Text("Comment"),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Icon(
                                Icons.share,
                                size: 20.0,
                              ),
                              SizedBox(width: 5.0),
                              Text("Share"),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                )),
            Card(
                color: AppColors.captionColor,
                child: Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Column(
                    children: <Widget>[
                      ListTile(
                        leading: CircleAvatar(
                          radius: 30.0,
                          backgroundImage: AssetImage("lib/assets/Elon.jpg"),
                        ),
                        title: Text("Elon Musk",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20.0)),
                        subtitle: Text("Crowd-Former CTO"),
                        trailing: Icon(Icons.more_horiz),
                        contentPadding: EdgeInsets.all(1.0),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: Text(
                          "No highs, no lows, only Doge",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20.0),
                        ),
                      ),
                      Container(
                        child: Image.asset(""),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: Text(
                          "",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20.0),
                        ),
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                SizedBox(width: 160.0),
                                Icon(
                                  Icons.thumb_up,
                                  size: 18.0,
                                  color: Colors.green,
                                ),
                                SizedBox(width: 2.0),
                                Text("1123442"),
                                SizedBox(width: 12.0),
                                Icon(
                                  Icons.thumb_down,
                                  size: 18.0,
                                  color: Colors.red,
                                ),
                                SizedBox(width: 2.0),
                                Text("0"),
                                SizedBox(width: 16.0),
                                Icon(
                                  Icons.comment,
                                  size: 18.0,
                                  color: Colors.blueGrey,
                                ),
                                SizedBox(width: 2.0),
                                Text("1382342984"),
                              ],
                            )
                          ],
                        ),
                      ),
                      Divider(
                        color: Colors.grey,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Icon(
                                Icons.thumb_up,
                                size: 20.0,
                              ),
                              SizedBox(width: 5.0),
                              Text("Like"),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Icon(
                                Icons.thumb_down,
                                size: 20.0,
                              ),
                              SizedBox(width: 5.0),
                              Text("Dislike"),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Icon(
                                Icons.comment,
                                size: 20.0,
                              ),
                              SizedBox(width: 5.0),
                              Text("Comment"),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Icon(
                                Icons.share,
                                size: 20.0,
                              ),
                              SizedBox(width: 5.0),
                              Text("Share"),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                )),
            Card(
                color: AppColors.captionColor,
                child: Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Column(
                    children: <Widget>[
                      ListTile(
                        leading: CircleAvatar(
                          radius: 30.0,
                          backgroundImage: AssetImage("lib/assets/male-avatar.jpg"),
                        ),
                        title: Text("Yiğit Tamer",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20.0)),
                        subtitle: Text("Crowd-CTO"),
                        trailing: Icon(Icons.more_horiz),
                        contentPadding: EdgeInsets.all(1.0),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: Text(
                          "Good job Elon",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20.0),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: Text(
                          "Thanks!!",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20.0),
                        ),
                      ),
                      Container(
                        child: Image.asset("lib/assets/doge.jpg"),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: Text(
                          "",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20.0),
                        ),
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                SizedBox(width: 240.0),
                                Icon(
                                  Icons.thumb_up,
                                  size: 18.0,
                                  color: Colors.green,
                                ),
                                SizedBox(width: 2.0),
                                Text("11"),
                                SizedBox(width: 12.0),
                                Icon(
                                  Icons.thumb_down,
                                  size: 18.0,
                                  color: Colors.red,
                                ),
                                SizedBox(width: 2.0),
                                Text("15"),
                                SizedBox(width: 16.0),
                                Icon(
                                  Icons.comment,
                                  size: 18.0,
                                  color: Colors.blueGrey,
                                ),
                                SizedBox(width: 2.0),
                                Text("138"),
                              ],
                            )
                          ],
                        ),
                      ),
                      Divider(
                        color: Colors.grey,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Icon(
                                Icons.thumb_up,
                                size: 20.0,
                              ),
                              SizedBox(width: 5.0),
                              Text("Like"),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Icon(
                                Icons.thumb_down,
                                size: 20.0,
                              ),
                              SizedBox(width: 5.0),
                              Text("Dislike"),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Icon(
                                Icons.comment,
                                size: 20.0,
                              ),
                              SizedBox(width: 5.0),
                              Text("Comment"),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Icon(
                                Icons.share,
                                size: 20.0,
                              ),
                              SizedBox(width: 5.0),
                              Text("Share"),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                )),
            Card(
                color: AppColors.captionColor,
                child: Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Column(
                    children: <Widget>[
                      ListTile(
                        leading: CircleAvatar(
                          radius: 30.0,
                          backgroundImage: AssetImage("lib/assets/female-avatar.jpg"),
                        ),
                        title: Text("Asuman Aslı Sivri",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20.0)),
                        subtitle: Text("Crowd-Executive Board Member"),
                        trailing: Icon(Icons.more_horiz),
                        contentPadding: EdgeInsets.all(1.0),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: Text(
                          "Elon,are you kidding us? This was the last warning!! Be smart",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20.0),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: Text(
                          "",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20.0),
                        ),
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                SizedBox(width: 240.0),
                                Icon(
                                  Icons.thumb_up,
                                  size: 18.0,
                                  color: Colors.green,
                                ),
                                SizedBox(width: 2.0),
                                Text("11"),
                                SizedBox(width: 12.0),
                                Icon(
                                  Icons.thumb_down,
                                  size: 18.0,
                                  color: Colors.red,
                                ),
                                SizedBox(width: 2.0),
                                Text("15"),
                                SizedBox(width: 16.0),
                                Icon(
                                  Icons.comment,
                                  size: 18.0,
                                  color: Colors.blueGrey,
                                ),
                                SizedBox(width: 2.0),
                                Text("138"),
                              ],
                            )
                          ],
                        ),
                      ),
                      Divider(
                        color: Colors.grey,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Icon(
                                Icons.thumb_up,
                                size: 20.0,
                              ),
                              SizedBox(width: 5.0),
                              Text("Like"),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Icon(
                                Icons.thumb_down,
                                size: 20.0,
                              ),
                              SizedBox(width: 5.0),
                              Text("Dislike"),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Icon(
                                Icons.comment,
                                size: 20.0,
                              ),
                              SizedBox(width: 5.0),
                              Text("Comment"),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Icon(
                                Icons.share,
                                size: 20.0,
                              ),
                              SizedBox(width: 5.0),
                              Text("Share"),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                )),
            Card(
                color: AppColors.captionColor,
                child: Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Column(
                    children: <Widget>[
                      ListTile(
                        leading: CircleAvatar(
                          radius: 30.0,
                          backgroundImage: AssetImage("lib/assets/Elon.jpg"),
                        ),
                        title: Text("Elon Musk",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20.0)),
                        subtitle: Text("Crowd-Former CTO"),
                        trailing: Icon(Icons.more_horiz),
                        contentPadding: EdgeInsets.all(1.0),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: Text(
                          "Sorry guys, It was a joke",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20.0),
                        ),
                      ),
                      Container(
                        child: Image.asset(""),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: Text(
                          "",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20.0),
                        ),
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                SizedBox(width: 160.0),
                                Icon(
                                  Icons.thumb_up,
                                  size: 18.0,
                                  color: Colors.green,
                                ),
                                SizedBox(width: 2.0),
                                Text("1123442"),
                                SizedBox(width: 12.0),
                                Icon(
                                  Icons.thumb_down,
                                  size: 18.0,
                                  color: Colors.red,
                                ),
                                SizedBox(width: 2.0),
                                Text("0"),
                                SizedBox(width: 16.0),
                                Icon(
                                  Icons.comment,
                                  size: 18.0,
                                  color: Colors.blueGrey,
                                ),
                                SizedBox(width: 2.0),
                                Text("1382342984"),
                              ],
                            )
                          ],
                        ),
                      ),
                      Divider(
                        color: Colors.grey,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Icon(
                                Icons.thumb_up,
                                size: 20.0,
                              ),
                              SizedBox(width: 5.0),
                              Text("Like"),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Icon(
                                Icons.thumb_down,
                                size: 20.0,
                              ),
                              SizedBox(width: 5.0),
                              Text("Dislike"),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Icon(
                                Icons.comment,
                                size: 20.0,
                              ),
                              SizedBox(width: 5.0),
                              Text("Comment"),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Icon(
                                Icons.share,
                                size: 20.0,
                              ),
                              SizedBox(width: 5.0),
                              Text("Share"),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                )),
            Card(
                color: AppColors.captionColor,
                child: Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Column(
                    children: <Widget>[
                      ListTile(
                        leading: CircleAvatar(
                          radius: 30.0,
                          backgroundImage: AssetImage("lib/assets/male-avatar.jpg"),
                        ),
                        title: Text("Yiğit Gümüşlü",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20.0)),
                        subtitle: Text("Crowd-CFO"),
                        trailing: Icon(Icons.more_horiz),
                        contentPadding: EdgeInsets.all(1.0),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: Text(
                          "Shut up broo!! @elonmusk",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20.0),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: Text(
                          "",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20.0),
                        ),
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                SizedBox(width: 240.0),
                                Icon(
                                  Icons.thumb_up,
                                  size: 18.0,
                                  color: Colors.green,
                                ),
                                SizedBox(width: 2.0),
                                Text("11"),
                                SizedBox(width: 12.0),
                                Icon(
                                  Icons.thumb_down,
                                  size: 18.0,
                                  color: Colors.red,
                                ),
                                SizedBox(width: 2.0),
                                Text("15"),
                                SizedBox(width: 16.0),
                                Icon(
                                  Icons.comment,
                                  size: 18.0,
                                  color: Colors.blueGrey,
                                ),
                                SizedBox(width: 2.0),
                                Text("138"),
                              ],
                            )
                          ],
                        ),
                      ),
                      Divider(
                        color: Colors.grey,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Icon(
                                Icons.thumb_up,
                                size: 20.0,
                              ),
                              SizedBox(width: 5.0),
                              Text("Like"),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Icon(
                                Icons.thumb_down,
                                size: 20.0,
                              ),
                              SizedBox(width: 5.0),
                              Text("Dislike"),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Icon(
                                Icons.comment,
                                size: 20.0,
                              ),
                              SizedBox(width: 5.0),
                              Text("Comment"),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Icon(
                                Icons.share,
                                size: 20.0,
                              ),
                              SizedBox(width: 5.0),
                              Text("Share"),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                )),
            Card(
              color: AppColors.captionColor,
              child: Padding(
                padding: EdgeInsets.all(5.0),
                child: Column(
                  children: <Widget>[
                    ListTile(
                      leading: CircleAvatar(
                        radius: 30.0,
                        backgroundImage: AssetImage("lib/assets/male-avatar.jpg"),
                      ),
                      title: Text("Mert Atabey Dinçer",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20.0)),
                      subtitle: Text("Crowd-Owner"),
                      trailing: Icon(Icons.more_horiz),
                      contentPadding: EdgeInsets.all(1.0),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: Text(
                        "Akıllı olun hepinizi kovarım",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20.0),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: Text(
                        "",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20.0),
                      ),
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              SizedBox(width: 240.0),
                              Icon(
                                Icons.thumb_up,
                                size: 18.0,
                                color: Colors.green,
                              ),
                              SizedBox(width: 2.0),
                              Text("11"),
                              SizedBox(width: 12.0),
                              Icon(
                                Icons.thumb_down,
                                size: 18.0,
                                color: Colors.red,
                              ),
                              SizedBox(width: 2.0),
                              Text("15"),
                              SizedBox(width: 16.0),
                              Icon(
                                Icons.comment,
                                size: 18.0,
                                color: Colors.blueGrey,
                              ),
                              SizedBox(width: 2.0),
                              Text("138"),
                            ],
                          )
                        ],
                      ),
                    ),
                    Divider(
                      color: Colors.grey,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Icon(
                              Icons.thumb_up,
                              size: 20.0,
                            ),
                            SizedBox(width: 5.0),
                            Text("Like"),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Icon(
                              Icons.thumb_down,
                              size: 20.0,
                            ),
                            SizedBox(width: 5.0),
                            Text("Dislike"),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Icon(
                              Icons.comment,
                              size: 20.0,
                            ),
                            SizedBox(width: 5.0),
                            Text("Comment"),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Icon(
                              Icons.share,
                              size: 20.0,
                            ),
                            SizedBox(width: 5.0),
                            Text("Share"),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );

  Widget buildT(String text) => Center(
          child: Text(
        text,
        style: TextStyle(fontSize: 28),
      ));
}
