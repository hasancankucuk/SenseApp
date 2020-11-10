import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(new MaterialApp(
    title: 'Bitirme Ödevi',
    home: LandingScreen(),
  ));
}

class LandingScreen extends StatefulWidget {
  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  File imageFile;
  _openGaleri(BuildContext context) async {
    var picture = await ImagePicker.pickImage(source: ImageSource.gallery);
    this.setState(() {
      imageFile = picture;
    });
    Navigator.of(context).pop();
  }

  _openKamera(BuildContext context) async {
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
            title: Text("Seçim Yapın"),
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  GestureDetector(
                    child: Text("Galeri"),
                    onTap: () {
                      _openGaleri(context);
                    },
                  ),
                  Padding(padding: EdgeInsets.all(8.0)),
                  GestureDetector(
                    child: Text("Kamera"),
                    onTap: () {
                      _openKamera(context);
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  Widget _decideImageView() {
    if (imageFile == null) {
      return Text("Resim Seçilmedi. Lütfen Resim Seçin.");
    } else {
      return Image.file(
        imageFile,
        width: 500,
        height: 500,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orangeAccent,
      appBar: 
        AppBar(
          backgroundColor: Colors.orange,
          title: Center(child: Text("Duygu Analizi")),
        ),
      
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _decideImageView(),
              RaisedButton(
                onPressed: () {
                  _showChoiceDialog(context);
                },
                child: Text("Resim seçin!"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
