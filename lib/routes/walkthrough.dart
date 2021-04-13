import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: WalkThrough(),
  ));
}

class WalkThrough extends StatefulWidget {
  @override
  _WalkThroughState createState() => _WalkThroughState();
}

class _WalkThroughState extends State {
  int currentPage;
  int pageNumber;

  final List<String> appBarTitles = ["WELCOME", "INTRO", "PROFILES", "CONTENT"];
  final List<String> pageTitles = [
    "CROWD",
    "Signup easily",
    "Create your profile",
    "Start meeting new people"
  ];
  final List<String> imageURLs = [
    "https://adtechresources.com/wp-content/uploads/2020/02/Mobile-Application.jpeg",
    "https://cdn.pttrns.com/764/8981_f.jpg",
    "https://cdn.pttrns.com/614/7772_f.jpg",
    "https://cdn.pttrns.com/614/7773_f.jpg"
  ];

  final List<String> imageCaptions = [
    "Your personal course material",
    "Just use your SU-Net account",
    "Update your flutter knowledge",
    "Connect with fellow flutterists"
  ];

  void start(){
    setState(() {
      Navigator.pushReplacementNamed(context, '/welcome');
      //Navigator.pushNamed(context, '/welcome');
    });
  }
  
  void nextPage() {
    setState(() {
      if (currentPage != pageNumber) currentPage++;
      else if(currentPage != pageNumber) start();
    });
  }

  void prevPage() {
    setState(() {
      if (currentPage != 1) currentPage--;
    });
  }

  @override
  void initState() {
    super.initState();
    pageNumber = 4;
    currentPage = 1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade400,
        centerTitle: true,
        title: Text(
          appBarTitles[currentPage - 1],
          style: TextStyle(
            color: Colors.grey.shade600,
            letterSpacing: -1,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(20, 24, 20, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              pageTitles[currentPage - 1],
              style: TextStyle(
                color: Colors.teal.shade300,
                letterSpacing: -1,
                fontSize: 32,
                fontWeight: FontWeight.w800,
              ),
            ),
            CircleAvatar(
              backgroundImage: NetworkImage(imageURLs[currentPage - 1]),
              radius: 280,
            ),
            Text(
              imageCaptions[currentPage - 1],
              style: TextStyle(
                color: Colors.grey.shade600,
                letterSpacing: -1,
                fontSize: 24,
                fontWeight: FontWeight.w300,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                OutlineButton(
                  color: Colors.teal.shade300,
                  onPressed: prevPage,
                  child: Text("Prev",
                      style: TextStyle(
                        color: Colors.teal.shade300,
                      )),
                ),
                Text("${currentPage}/${pageNumber}"),
                OutlineButton(
                  color: Colors.teal.shade300,
                  onPressed: nextPage,
                  child: Text("Next",
                      style: TextStyle(
                        color: Colors.teal.shade300,
                      )),
                ),
                OutlineButton(onPressed: start)
              ],
            ),
          ],
        ),
      ),
    );
  }
}