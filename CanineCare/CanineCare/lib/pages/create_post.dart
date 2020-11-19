import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:instagram/pages/profile.dart';

class CreatePostPage extends StatefulWidget {
  @override
  _CreatePostPageState createState() => _CreatePostPageState();
}

class _CreatePostPageState extends State<CreatePostPage> {
  final _formKey = GlobalKey<FormState>();
  final _user = User();

  @override
  Widget build(BuildContext context) {
      return Scaffold(
          appBar: AppBar(title: Text('New Data Input')),
          body: Container(
              padding:
              const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
              child: Builder(
                  builder: (context) => Form(
                      key: _formKey,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            TextFormField(
                              decoration:
                              InputDecoration(labelText: 'Dog Age'),
                              validator: (value) {
                                if (value.isEmpty) {
                                  return 'Please enter your dog\'s name';
                                }
                              },
                              onSaved: (val) =>
                                  setState(() => _user.name = val),
                            ),
                            TextFormField(
                                decoration:
                                InputDecoration(labelText: 'Date'),
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Please enter the date in format MM/DD/YYYY.';
                                  }
                                },
                                onSaved: (val) =>
                                    setState(() => _user.date = val)),
                            TextFormField(
                                decoration:
                                InputDecoration(labelText: 'Weight'),
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Please enter your dog\'s weight';
                                  }
                                },
                                onSaved: (val) =>
                                    setState(() => _user.date = val)),
                            Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 16.0, horizontal: 16.0),
                                child: RaisedButton(
                                    onPressed: () {
                                      final form = _formKey.currentState;
                                      if (form.validate()) {
                                        form.save();
                                        _user.save();
                                        _showDialog(context);
                                      }
                                    },
                                    child: Text('Save'))),
                          ])))));
    }
    _showDialog(BuildContext context) {
      Scaffold.of(context)
          .showSnackBar(SnackBar(content: Text('Taking in information')));
    }
  }

