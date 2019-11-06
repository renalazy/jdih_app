import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(BoardingApp());
  });
}

class BoardingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Boarding Page',
      home: BoardingPage(),
    );
  }
}

class BoardingPage extends StatefulWidget {
  @override
  _BoardingPageState createState() => _BoardingPageState();
}

class _BoardingPageState extends State<BoardingPage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('images/boarding-background.jpg'),
                  fit: BoxFit.cover)),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircleAvatar(
                  backgroundImage: AssetImage(
                    'images/jdih-logo-mentah.png',
                  ),
                  backgroundColor: Colors.blueGrey.shade900,
                  radius: 60.0,
                ),
                SizedBox(height: 50.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Daftarkan',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 40.0,
                          color: Colors.grey.shade400),
                    ),
                    Text(
                      'Diri Anda',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 40.0,
                          color: Colors.grey.shade400),
                    ),
                    Text(
                      'Sekarang Juga',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 40.0,
                        color: Colors.grey.shade400,
                      ),
                    ),
                    RaisedButton(
                      onPressed: null,
                      child: Text(
                        'registrasi',
                        style: TextStyle(fontSize: 18.0, color: Colors.white),
                      ),
                      color: Colors.transparent,
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(50.0))),
                    ),
                  ],
                ),
                SizedBox(height: 75.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    RaisedButton(
                      onPressed: null,
                      child: Text(
                        'Google',
                        style: TextStyle(fontSize: 18.0, color: Colors.white),
                      ),
                      color: Colors.transparent,
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(50.0))),
                    ),
                    RaisedButton(
                      onPressed: null,
                      child: Text(
                        'Facebook',
                        style: TextStyle(fontSize: 18.0, color: Colors.white),
                      ),
                      color: Colors.transparent,
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(50.0))),
                    ),
                  ],
                ),
                SizedBox(height: 10.0),
                Text(
                  'jika anda telah terdaftar silahkan login',
                  style: TextStyle(fontSize: 12.0, color: Colors.grey.shade400),
                ),
                SizedBox(height: 10.0),
                RaisedButton(
                  onPressed: null,
                  child: Text(
                    'Login',
                    style: TextStyle(fontSize: 18.0, color: Color(0xFF03A696)),
                  ),
                  color: Colors.transparent,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(50.0))),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
