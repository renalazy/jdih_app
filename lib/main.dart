import 'package:flutter/material.dart';
import 'package:jdih_app/boarding.dart';
import 'dart:async';
import 'package:jdih_app/home.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(SplashApp());
  });
}

class SplashApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        '/boarding': (BuildContext context) => BoardingPage(),
      },
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  startTime() async {
    var _duration = new Duration(seconds: 5);

    return Timer(_duration, navigationPage);
  }

  void navigationPage() {
    Navigator.of(context).pushReplacementNamed("/boarding");
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'images/jdih-logo-mentah.png',
              height: 300,
              width: 300,
              fit: BoxFit.fill,
            ),
            Text(
              'JDIH Kabupaten',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 31.0,
              ),
            ),
            Text(
              'Probolinggo',
              style: TextStyle(
                fontSize: 31.0,
                color: Colors.grey,
              ),
            )
          ],
        ),
      ),
    );
  }
}
