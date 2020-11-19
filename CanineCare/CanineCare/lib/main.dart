import 'package:flutter/material.dart';
import 'package:instagram/models/userid.dart';
import 'package:instagram/pages/wrapper.dart';
import 'package:instagram/services/auth.dart';
import 'pages/photoscroll.dart';
import 'pages/profile.dart';
import 'pages/create_post.dart';
import 'package:instagram/models/global.dart';
import 'models/appbar.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<Userid>.value(
      value:AuthService().user,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Canine Care',
        theme: ThemeData(
          primarySwatch: Colors.purple,
        ),
        home: Wrapper(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Widget> pages = [
    HomePage(),
    CreatePostPage(),
    ProfilePage()
  ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 0,
      child: Scaffold(
        body: TabBarView(
          children: pages,
        ),
        bottomNavigationBar: Container(
          // decoration: BoxDecoration(
          //   boxShadow: [
          //     BoxShadow(
          //       offset: Offset(10, 10)
          //     )
          //   ]
          // ),
          margin: EdgeInsets.only(bottom: 20),
          child: new TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.home),
              ),
              Tab(
                icon: Icon(Icons.add),
              ),
              Tab(
                icon: Icon(Icons.perm_identity),
              ),
            ],
            unselectedLabelColor: Colors.black,
            labelColor: Colors.blue,
            indicatorColor: Colors.transparent,
          ),
        ),
      ),
    );
  }
}
