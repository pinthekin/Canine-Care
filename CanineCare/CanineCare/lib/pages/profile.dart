import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Neumorphic(margin: EdgeInsets.symmetric(horizontal: 4),
        style: NeumorphicStyle(
          boxShape: NeumorphicBoxShape.roundRect(BorderRadius.circular(8)),
        ),
        child: Neumorphic(
          style: NeumorphicStyle(
            depth: -1,
            oppositeShadowLightSource: true,
          ),
          padding: EdgeInsets.all(2),
          child: SizedBox(
            width: 40,
            height: 60,
          )
        )
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