import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class pickedimage extends StatefulWidget {
  const pickedimage({Key key}) : super(key: key);

  @override
  _pickedimageState createState() => _pickedimageState();
}

class _pickedimageState extends State<pickedimage> {
  @override
  File imagefile;
  final _picker = ImagePicker();
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("IMAGE"),),
      body: ListView(
        children: [
          Column(
            children: [
              imagefile == null ? Placeholder() : Image.file(imagefile),
              RaisedButton(
                child: Text("Add Image"),
                onPressed: () {
                  selection();
                },
              ),
            ],
          ),
        ],
      ),
    );;
  }
  selection() {
    showDialog(
        context: context,
        builder: (BuildContext context) => SimpleDialog(
          title: Text("Select source of image"),
          children: [
            RaisedButton(
              onPressed: () async{
                await _opencamera();
              },
              child: Text("From camera"),
            ),
            RaisedButton(
              onPressed: () async{
                await _opengallary();
              },
              child: Text("From Gallary"),
            ),
          ],
        ));
  }

  _opencamera() async{
    PickedFile _filed = await _picker.getImage(source: ImageSource.camera);
    setState(() {
      imagefile = File(_filed.path);
    });
  }
  _opengallary() async{
    PickedFile _filed = await _picker.getImage(source: ImageSource.gallery);
    setState(() {
      imagefile = File(_filed.path);
    });
  }
}
