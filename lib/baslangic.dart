import 'package:bitirme_odevi/giris.dart';
import 'package:flutter/material.dart';

class Baslangic extends StatefulWidget {
  @override
  _BaslangicState createState() => _BaslangicState();
}

class _BaslangicState extends State<Baslangic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffB3E5FC),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("HOŞGELDİN!", style: TextStyle(fontSize: 30, fontFamily: 'PatrickHand') ,),
              Padding(padding: EdgeInsets.all(8.0)),
              RaisedButton(
                padding: EdgeInsets.fromLTRB(20, 15, 25, 15),
                color: Color(0xff2196F3),
                elevation: 7.0,
                splashColor: Color(0xff448AFF),
                shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(5.0),
                  side: BorderSide(color: Color(0xff2196F3)),
                ),child: Text(
                  "ŞİMDİ BAŞLA",
                  style: TextStyle( color:Colors.white, fontSize: 20, fontFamily: 'PatrickHand'),
                ),
                onPressed: () => Navigator.pushReplacement(
                    context,
                    new MaterialPageRoute(
                        builder: (context) => new LandingScreen())),
              ),
             
            ],
          ),
        ),
      ),
    );
  }
}
