import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'pick_images.dart';
import 'package:permission_handler/permission_handler.dart';

void main() {
  runApp(MaterialApp(
    home: Myapp(),
  ));
}

class Myapp extends StatefulWidget {
  const Myapp({Key key}) : super(key: key);

  @override
  _MyappState createState() => _MyappState();
}

class _MyappState extends State<Myapp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
          child: Center(
            child: RaisedButton(
              child: Text("Continue"),
          onPressed: () {
            CameraPermision();
          },
        ),
      )),
    ));
  }

  CameraPermision() async {
    var camerastatus = await Permission.camera.status;
    print(camerastatus);
    if (!camerastatus.isGranted) {
      Permission.camera.request();
      Fluttertoast.showToast(
          msg:
              "You cant add image if you want to add image allow camera permision");
    } else if (camerastatus.isGranted) {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => pickedimage(),
          ));
    } else {
      return null;
    }
  }
}
