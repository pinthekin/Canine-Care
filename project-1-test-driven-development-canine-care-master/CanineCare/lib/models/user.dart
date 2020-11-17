import 'post.dart';
import 'package:flutter/material.dart';

class User {

  // final String uid;
  String username;
  List<Post> posts;
  AssetImage profilePicture;
  List<User> followers;
  List<User> following;
  List<Post> savedPosts;
  bool hasStory;
  // old constructor
  User(this.username, this.profilePicture, this.followers, this.following, this.posts, this.savedPosts, this.hasStory);
  // new constructor
  // User({ this.uid });
}