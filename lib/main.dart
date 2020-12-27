import 'package:flutter/material.dart';
import 'baslangic.dart';
import 'dart:async';
import 'package:flutter_spinkit/flutter_spinkit.dart';

//main fonksiyonunda materialapp çalıştırılmış projenin ana tema rengi mavi olarak belirlenmiş, yine aynı şekilde projenin yazı teması helvetica olarak ayarlanmıştır. proje açılınca ilk karşımıza çıkacak ekran giriş sayfasında oluşturulduğu için giriş sayfası home propertysine atanmıştır.
void main() {
  runApp(new MaterialApp(
    title: 'Bitirme Ödevi',
    theme: ThemeData(
      primarySwatch: Colors.blue,
      fontFamily: 'Helvetica',
    ),
    home: Giris(),
  ));
}

class Giris extends StatefulWidget {
  @override
  _GirisState createState() => _GirisState();
}

class _GirisState extends State<Giris> with SingleTickerProviderStateMixin {
  SpinKitRipple spinkit; //splash ekranındaki animasyonun tanıtılması.

  @override
  void initState() {
    super.initState();

    spinkit = SpinKitRipple(
      color: Colors.black87,
      size: 50.0,
      controller: AnimationController(
          vsync: this, duration: const Duration(milliseconds: 1000)), //animasyonun rengi ekranda kalış süresi boyutu gibi özellikler burada ayarlandı.
    );

    Future.delayed(const Duration(seconds: 3), () async {
      Navigator.pushReplacement(context,
          new MaterialPageRoute(builder: (context) => new Baslangic()));// splash ekranının var olma süresi 3 saniye olarak ayarlanıp sonrasında başlangıç sayfasına yönlendirme yapıldı.
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffB3E5FC),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            spinkit,
            SizedBox(
              height: 20,
            ),
            Text(
              "SENSEAPP",
              style: TextStyle(fontSize: 30),//ekrandaki senseapp yazısının olduğu widgetlar burada oluşturuldu.
            ),
          ],
        ),
      ),
    );
  }
}
