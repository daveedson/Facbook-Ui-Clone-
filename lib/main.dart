import 'package:flutter/material.dart';
import 'package:flutter_facebook_responsive_ui/widgets/navScreen.dart';

import 'HomeScreen.dart';
import 'config/palette.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Facebook UI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
       scaffoldBackgroundColor: Palette.scaffold
      ),
      home: NavScreen (),
    );
  }
}



