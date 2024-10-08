import 'package:flutter/material.dart';
import 'package:instagram_app/screens/instagram_home.dart';


void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Instagram',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.blue,
          primaryColor: Colors.black,
          primaryIconTheme: const IconThemeData(color: Colors.black),
          primaryTextTheme: const TextTheme(
          bodyLarge: TextStyle(color: Colors.black, fontFamily: "Aveny")),
          textTheme: const TextTheme(bodyLarge: TextStyle(color: Colors.black))),
      home: InstaGramHome(),
    );
  }
}