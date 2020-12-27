// import 'dart:convert';

// import 'package:http/http.dart' as http;
// import 'package:flutter/material.dart';
// import 'dart:io';
// import 'package:image_picker/image_picker.dart';
// import 'dart:ui';

// class Deneme extends StatefulWidget {
//   @override
//   _Deneme createState() => _Deneme();
// }

// Future<Emotions> postEmotions(Image image) async {
//   final http.Response response = await http.post(
//     'https://192.168.1.26:44324/api/FileUpload/uploadFile',
//     body: jsonEncode(<String, String>{
//       'image': '/Users/hasancan/Downloads/fear.jpg.webp',
//     }),
//   );

//   if (response.statusCode == 201) {
//     return Emotions.fromJson(jsonDecode(response.body));
//   } else {
//     throw Exception('Failed to send image.');
//   }
// }

// class Emotions {
//   final int id;
//   final Image image;

//   Emotions({this.id, this.image});

//   factory Emotions.fromJson(Map<String, dynamic> json) {
//     return Emotions(
//       id: json['id'],
//       image: json['image'],
//     );
//   }
// }

// class _Deneme extends State<Deneme> {
//   Future<Emotions> _futureEmotions;
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: <Widget>[
//           RaisedButton(
//             onPressed: () {
//               setState(() {
//                 _futureEmotions = postEmotions();
//               });
//             },
//             textColor: Colors.white,
//             padding: const EdgeInsets.all(0.0),
//             child: Container(
//               decoration: const BoxDecoration(
//                 gradient: LinearGradient(
//                   colors: <Color>[
//                     Color(0xFF0D47A1),
//                     Color(0xFF1976D2),
//                     Color(0xFF42A5F5),
//                   ],
//                 ),
//               ),
//               padding: const EdgeInsets.all(10.0),
//               child:
//                   const Text('Gradient Button', style: TextStyle(fontSize: 20)),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }



