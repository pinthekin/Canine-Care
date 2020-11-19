import 'package:flutter/material.dart';
import 'package:instagram/main.dart';
import 'package:instagram/pages/authenticate/authenticate.dart';
import 'package:instagram/pages/home.dart';
import 'package:instagram/models/userid.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<Userid>(context);
    print(user);
    // return either Home or Authenticate pages
    if (user == null) {
      return Authenticate();
    } else {
      return MyHomePage();
    }
  }
}