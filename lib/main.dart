import 'package:flutter/material.dart';
import 'package:gpa/Screens/Home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'home',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.deepPurple ,
          accentColor: Colors.deepPurple ,
        )
      ),
      routes: {
        'home' : (context) => Home() ,
      },
    );
  }
}
