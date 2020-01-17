import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jdih_app/account.dart';
import 'package:jdih_app/home.dart';
import 'package:jdih_app/login.dart';
import 'package:jdih_app/register.dart';

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
                SizedBox(height: 20.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      // 'Daftarkan\nDiri Anda\nSekarang Juga',
                      'Selamat Datang\nDi JDIH\nKab Probolinggo',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 40.0,
                          color: Colors.grey.shade400,
                          fontFamily: 'TitilliumWeb'),
                    ),
                    SizedBox(height: 10.0),
                    // GestureDetector(
                    //   onTap: () {
                    //     Navigator.push(
                    //         context,
                    //         MaterialPageRoute(
                    //             builder: (context) => RegisterPage()));
                    //   },
                    //   child: Container(
                    //     height: 35.0,
                    //     width: 140.0,
                    //     decoration: BoxDecoration(
                    //       border: Border.all(width: 1, color: Colors.white),
                    //       borderRadius: BorderRadius.circular(50.0),
                    //     ),
                    //     child: Center(
                    //       child: Text(
                    //         'Registrasi',
                    //         style: TextStyle(
                    //             fontSize: 19.0,
                    //             color: Colors.white,
                    //             fontFamily: 'TitilliumWeb'),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
                SizedBox(height: 75.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      height: 55.0,
                      width: 175.0,
                      decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.white),
                        borderRadius: BorderRadius.circular(50.0),
                        color: Colors.white,
                      ),
                      child: ListTile(
                        leading: Image(
                          image: AssetImage('images/facebook-logo.png'),
                          width: 40.0,
                          height: 40.0,
                        ),
                        title: Text(
                          'Facebook',
                          style: TextStyle(
                              fontSize: 19.0,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF707070),
                              fontFamily: 'TitilliumWeb'),
                        ),
                      ),
                    ),
                    SizedBox(width: 10.0),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AccountPage()));
                      },
                      child: Container(
                        height: 55.0,
                        width: 175.0,
                        decoration: BoxDecoration(
                          border: Border.all(width: 1, color: Colors.white),
                          borderRadius: BorderRadius.circular(50.0),
                          color: Colors.white,
                        ),
                        child: Center(
                          child: ListTile(
                            leading: Image(
                              image: AssetImage('images/google-logo.png'),
                              width: 30.0,
                              height: 30.0,
                            ),
                            title: Text(
                              'Google',
                              style: TextStyle(
                                  fontSize: 19.0,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF707070),
                                  fontFamily: 'TitilliumWeb'),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 20.0),
                Container(
                    height: 0.5, width: 350.0, color: Colors.grey.shade400),
                SizedBox(height: 10.0),
                Text(
                  'jika anda telah terdaftar silahkan login',
                  style: TextStyle(
                      fontSize: 12.0,
                      color: Colors.grey.shade400,
                      fontFamily: 'TitilliumWeb'),
                ),
                SizedBox(height: 20.0),
                GestureDetector(
                  onTap: () {
                    // Navigator.push(context,
                    //     MaterialPageRoute(builder: (context) => LoginPage()));
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) {
                      return LoginPage();
                    }));
                  },
                  child: Container(
                    height: 35.0,
                    width: 140.0,
                    decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Color(0xFF03A696)),
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    child: Center(
                      child: Text(
                        'Login',
                        style: TextStyle(
                            fontSize: 19.0,
                            color: Color(0xFF03A696),
                            fontFamily: 'TitilliumWeb'),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
