import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[100],
      appBar: AppBar(title: Text('Health')),
      body: Container(
          padding: EdgeInsets.symmetric(vertical: 40.0, horizontal:160.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget> [
              SizedBox(height: 140.0),
              RaisedButton(
                child: Text(
                  'Reports',
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.purple,
              ),
            ]
          ),

      ),
    );
  }
}

class User {
  String name = '';
  String weight = '';
  String date = '';

  save() {
    print('saving information...');
  }
}