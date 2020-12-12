import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'dart:ui';

class LandingScreen extends StatefulWidget {
  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  File imageFile;
  _openGaleri(BuildContext context) async {
    // ignore: deprecated_member_use
    var picture = await ImagePicker.pickImage(source: ImageSource.gallery);
    this.setState(() {
      imageFile = picture;
    });
    Navigator.of(context).pop();
  }

  _openKamera(BuildContext context) async {
    // ignore: deprecated_member_use
    var picture = await ImagePicker.pickImage(source: ImageSource.camera);
    this.setState(() {
      imageFile = picture;
    });
    Navigator.of(context).pop();
  }

  Future<void> _showChoiceDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Center(
                child: Text("Seçim Yapın",
                    style: TextStyle(
                      fontSize: 25,
                      color: Color(0xff212121),
                    ))),
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  Center(
                    child: GestureDetector(
                      child: Text(
                        "Galeri",
                        style: TextStyle(
                          fontSize: 20,
                          color: Color(0xff212121),
                        ),
                      ),
                      onTap: () {
                        _openGaleri(context);
                      },
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(8.0)),
                  Center(
                    child: GestureDetector(
                      child: Text("Kamera",
                          style: TextStyle(
                            fontSize: 20,
                            color: Color(0xff212121),
                          )),
                      onTap: () {
                        _openKamera(context);
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  Widget _decideImageView() {
    if (imageFile == null) {
      return Text("Fotoğraf Seçilmedi. Lütfen Fotoğraf Seçin.",
          style: TextStyle(fontSize: 20, color: Color(0xff212121)));
    } else {
      return Container(
        decoration: BoxDecoration(
            color: Color(0xffBDBDBD),
            border: Border.all(color: Color(0xffB3E5FC))),
        child: Image.file(
          imageFile,
          width: 300,
          height: 300,
          fit: BoxFit.contain,
        ),
      );
    }
  }

  Widget _changeImage() {
    if (imageFile != null) {
      return Text(
        "YENİ FOTOĞRAF",
        style: TextStyle(fontSize: 20),
      );
    } else {
      return Text(
        "FOTOĞRAF SEÇ",
        style: TextStyle(fontSize: 20),
      );
    }
  }

  Widget _useImage() {
    if (imageFile != null) {
      return RaisedButton(
        padding: EdgeInsets.fromLTRB(25, 15, 25, 15),
        color: Color(0xffB3E5FC),
        elevation: 7.0,
        splashColor: Color(0xff448AFF),
        shape: RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(5.0),
          side: BorderSide(color: Color(0xff2196F3)),
        ),
        onPressed: () {},
        child: Text(
          "FOTOĞRAFI KULLAN",
          style: TextStyle(fontSize: 20, color: Color(0xff212121)),
        ),
      );
    } else {
      return Text("");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFFFFF),
      appBar: AppBar(
        backgroundColor: Color(0xff0288D1),
        title: Center(child: Text("SENSEAPP", style: TextStyle(fontSize: 35))),
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _decideImageView(),
              RaisedButton(
                padding: EdgeInsets.fromLTRB(20, 15, 25, 15),
                color: Color(0xffB3E5FC),
                elevation: 7.0,
                splashColor: Color(0xff448AFF),
                shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(5.0),
                  side: BorderSide(color: Color(0xff2196F3)),
                ),
                onPressed: () {
                  _showChoiceDialog(context);
                },
                child: _changeImage(),
              ),
              _useImage(),
            ],
          ),
        ),
      ),
    );
  }
}