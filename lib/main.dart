import 'package:flutter/material.dart';
import 'baslangic.dart';
import 'dart:async';
import 'package:flutter_spinkit/flutter_spinkit.dart';

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
  SpinKitRipple spinkit;

  @override
  void initState() {
    super.initState();

    spinkit = SpinKitRipple(
      color: Colors.black87,
      size: 50.0,
      controller: AnimationController(
          vsync: this, duration: const Duration(milliseconds: 1000)),
    );

    Future.delayed(const Duration(seconds: 3), () async {
      Navigator.pushReplacement(context,
          new MaterialPageRoute(builder: (context) => new Baslangic()));
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
            //   Image.asset('assets/images/splash.png', width: 100, height: 100,),
            SizedBox(
              height: 20,
            ),
            Text(
              "SENSEAPP",
              style: TextStyle(fontSize: 30),
            ),
          ],
        ),
      ),
    );
  }
}
