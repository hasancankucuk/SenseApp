//import 'dart:html';
import 'package:flutter/material.dart';
import 'dart:io' as io;
import 'package:image_picker/image_picker.dart';
import 'dart:ui';
// import 'deneme.dart';
import 'package:http/http.dart' as http;

class LandingScreen extends StatefulWidget {
  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  io.File imageFile; // kullanılacak fotoğraf dosyasının tanıtıldığı değişken

  // bu fonksiyon galeriye gitmeyi ve seçilen resmin analiz ekranına verilmesini sağlıyor.
  _openGaleri(BuildContext context) async {
    // ignore: deprecated_member_use
    var picture = await ImagePicker.pickImage(source: ImageSource.gallery);
    this.setState(() {
      imageFile = picture;
    });
    Navigator.of(context).pop();
  }

//bu fonksiyon kameraya gitmeyi ve çekilip onayladığımız fotoğrafın analiz ekranına verilmesini sağlıyor.
  _openKamera(BuildContext context) async {
    // ignore: deprecated_member_use
    var picture = await ImagePicker.pickImage(source: ImageSource.camera);
    this.setState(() {
      imageFile = picture;
    });
    Navigator.of(context).pop();
  }

// fotoğraf seç butonuna tıklandıktan sonra seçilecek olan fotoğrafın galeriden ya da kamera aracılığıyla seçilmesinin kontrolü bu fonksiyonda yapılmaktadır.
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
                        _openGaleri(
                            context); // yukarıda tanımlanan galeriyi açıp seçim yapmamızı sağlayan fonksiyon burada kullanılmıştır.
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
                        _openKamera(
                            context); // aynı şekilde yukarıda tanımlanıp kamerayı açmamızı sağlayan fonksiyon burada çağırılmıştır.
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

//fotoğraf seçilip seçilmediği bu fonsiyonda kontrol ediliyor. duruma göre seçilmediğinin uyarısı verilip seçilmiş olduğu takdirde container içerisine resmi yerleştiriyor.
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

// fotoğraf seç butonu bir fotoğraf seçilip ekrana yerleştirildikten sonra bu fonksiyondaki kontrol sayesinde yeni fotoğraf butonu olarak değiştiriliyor.
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

// bu fonksiyonda seçilen fotoğrafın kullanılması için yönlendirme yapan bir buton oluşturulmuştur.
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
        child: Text(
          "FOTOĞRAFI KULLAN",
          style: TextStyle(fontSize: 20, color: Color(0xff212121)),
        ),
        onPressed: () async {
          var request = http.MultipartRequest('POST',
              Uri.parse('http://192.168.1.26:55777/api/FileUpload/uploadFile'));
          request.files.add(
              await http.MultipartFile.fromPath('', imageFile.path.toString()));
          http.StreamedResponse response = await request.send();
          if (response.statusCode == 200) {
            //print(await response.stream.bytesToString());
            var alertDialog = AlertDialog(
              title: Text("Analiz Sonucu:"),
              content: Text(await response.stream.bytesToString()),
            );
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return alertDialog;
                });
          } else if (response.statusCode == 404) {
            print("Yüz algılanamadı");
          } else {
            print(response.reasonPhrase);
          }
          // Navigator.push(context,
          //     new MaterialPageRoute(builder: (context) => new Deneme()));
        },
      );
    } else {
      return Text("");
    }
  }

// ekran aşağıda çizilmektedir.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFFFFFF),
      appBar: AppBar(
        backgroundColor: Color(0xff0288D1),
        title: Center(
            child: Text("SENSEAPP",
                style: TextStyle(
                    fontSize: 35))), //appbarın stilleri ayarlanmıştır.
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _decideImageView(), //yukarıda tanıtılan fonksiyon burada çağırılmıştır.
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
                  _showChoiceDialog(
                      context); //yukarıda tanıtılan fonksiyon burada çağırılmıştır.
                },
                child:
                    _changeImage(), //yukarıda tanıtılan fonksiyon burada çağırılmıştır.
              ),
              _useImage(), //yukarıda tanıtılan fonksiyon burada çağırılmıştır.
            ],
          ),
        ),
      ),
    );
  }
}
