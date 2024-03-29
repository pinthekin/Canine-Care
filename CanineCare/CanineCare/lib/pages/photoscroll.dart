import 'package:flutter/material.dart';
import 'package:instagram/models/post.dart';
import 'package:instagram/models/user.dart';
import 'package:instagram/models/comment.dart';
import 'package:instagram/models/global.dart';
import 'package:instagram/main.dart';
import 'package:instagram/models/appbar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static int page = 1;
  static Post the_post = post1;
  @override
  Widget build(BuildContext context) {
    Map<int, Widget> pageview = {
      1 : getMain()
    };
    return pageview[page];
  }

  Widget getMain() {
    return Scaffold(
      appBar: AppBar(
        title: Text("CanineCare", style: textStyleBold),
        backgroundColor: Colors.white,
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            Column(
              children: <Widget> [
                Divider(),
                Column(
                  children: getPosts(context),
                )
              ],
            )
          ],
        )
      ),
    );
  }

  List<Widget> getPosts(BuildContext context) {
    List<Widget> posts = [];
    int index = 0;
    for (Post post in userPosts) {
      posts.add(getPost(context, post, index));
      index ++;
    }
    return posts;
  }

  Widget getPost(BuildContext context, Post post, int index) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
            ),
          ),
          Container(
            constraints: BoxConstraints.expand(height: 1),
            color: Colors.grey,
          ),
          Container(
            constraints: BoxConstraints(
              maxHeight: 282
            ),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: post.image
              )
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                ],
              ),
            ],
          ),
        ],
      )
    );
  }
}
