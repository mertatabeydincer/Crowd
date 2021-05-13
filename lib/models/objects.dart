class User {
  int userID;
  String name;
  String userName;
  String profilePicturePath;
  String gender;
  String email;
  String password;
  String phoneNumber;
  String biography;
  List<User> followers;
  List<User> followings;
  List<Post> posts;
  int followerCount;
  int followingCount;
  int postCount;
  int viewCount;
  int userRating;
  bool private;

  User({
    this.userID,
    this.name,
    this.userName,
    this.profilePicturePath,
    this.gender,
    this.email,
    this.password,
    this.phoneNumber,
    this.biography,
    this.followers,
    this.followings,
    this.posts,
    this.followerCount,
    this.followingCount,
    this.postCount,
    this.viewCount,
    this.private,
  });
}

class Post {
  String postID;
  String text;
  var date;
  List<String> comments;
  int postRating;
  int likeCount;
  int dislikeCount;
  int commentCount;

  Post({
    this.postID,
    this.text,
    this.comments,
    this.date,
    this.likeCount,
    this.dislikeCount,
    this.commentCount,
  });
}

class SearchResult {
  String user;
  String tag;

  SearchResult(String user, String tag) {
    this.user = user;
    this.tag = tag;
  }
}

class Tag {
  String tagName;
  int tagRating;
}

class Location {
  String locationName;
  int locationRating;
}

class Feed {}

class Notification {
  String notificationMessage;

  Notification(String notificationMessage) {
    this.notificationMessage = notificationMessage;
  }
}
