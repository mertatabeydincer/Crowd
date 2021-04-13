import 'package:crowd/utils/styles.dart';
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
  String buttonName = "Next";

  final List<String> pageTitles = [
    "",
    "Signup easily",
    "Create your profile",
    ""
  ];
  final List<String> imagePaths = [
    "lib/assets/crowdapp.png",
    "lib/assets/crowd.jpg",
    "lib/assets/profile.jpg",
    "lib/assets/male-female-avatars.jpg",
  ];

  final List<String> imageCaptions = [
    "Missed to get lost in the crowd?",
    "To see familiar faces or meet new people?",
    "Get a username to be recognized",
    "Stay anonymous to blend in the crowd"
  ];

  void start() {
    setState(() {
      //Navigator.pushReplacementName(context, "/welcome");
      Navigator.pushNamedAndRemoveUntil(context, '/welcome', (_) => false);
    });
  }

  void nextPage() {
    setState(() {
      if (currentPage != pageNumber) {
        currentPage++;
        if (currentPage == pageNumber) buttonName = "Get Started";
      } else if (currentPage == pageNumber) start();
    });
  }

  void prevPage() {
    setState(() {
      if (currentPage != 1) {
        currentPage--;
        buttonName = "Next";
      }
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
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.fromLTRB(20, 24, 20, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              pageTitles[currentPage - 1],
              style: kHeadingTextStyle,
            ),
            Image(
              image: AssetImage(
                imagePaths[currentPage - 1],
              ),
            ),
            Text(
              imageCaptions[currentPage - 1],
              style: kLabelTextStyle,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    OutlineButton(
                      color: Colors.teal.shade300,
                      onPressed: prevPage,
                      child: Text(
                        "Prev",
                        style: kButtonTextStyleCandy,
                      ),
                    ),
                    Text("${currentPage}/${pageNumber}"),
                    OutlineButton(
                      color: Colors.teal.shade300,
                      onPressed: nextPage,
                      child: Text(
                        buttonName,
                        style: kButtonTextStyleSuccess,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
