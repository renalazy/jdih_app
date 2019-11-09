import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(ForgetPasswordApp());
  });
}

class ForgetPasswordApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Forget Password',
      home: ForgetPasswordPage(),
    );
  }
}

class ForgetPasswordPage extends StatefulWidget {
  @override
  _ForgetPasswordPageState createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage> {
  @override
  Widget build(BuildContext context) {
    final appbarContent = AppBar(
      title: Text(
        'JDIH',
        style: TextStyle(
            fontSize: 31.0, fontWeight: FontWeight.bold, color: Colors.white),
      ),
      backgroundColor: Color(0xFF038C7F),
    );

    final bodyContent = SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 60.0, left: 40.0),
            child: Text(
              'Lupa Password',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 31.0,
                color: Color(0xFF038C7F),
              ),
            ),
          ),
          SizedBox(
            height: 15.0,
          ),
          Container(
            margin: EdgeInsets.only(left: 40.0),
            child: Text(
              'Silahkan masukkan email anda pada kolom dibawah ini\n'
              'untuk melakukan konfirmasi password yang dikirim\nke email anda!',
              style: TextStyle(fontSize: 12.0),
            ),
          ),
          SizedBox(height: 100.0),
          Container(
            height: 50.0,
            margin: EdgeInsets.symmetric(horizontal: 40.0),
            child: TextFormField(
              decoration: InputDecoration(
                labelText: 'Masukkan email anda',
                fillColor: Colors.white,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide: BorderSide()),
              ),
              validator: (val) {
                if (val.length == 0) {
                  return 'email cannot be empty';
                } else {
                  return null;
                }
              },
              keyboardType: TextInputType.emailAddress,
            ),
          ),
          SizedBox(height: 25.0),
          Center(
            child: Container(
              height: 50.0,
              margin: EdgeInsets.symmetric(horizontal: 40.0),
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.white),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50.0),
                    bottomRight: Radius.circular(50.0)),
                color: Color(0xFF038C7F),
              ),
              child: Center(
                child: Text(
                  'Kirim',
                  style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );

    return Scaffold(
      backgroundColor: Color(0xFFF9FBF6),
      appBar: appbarContent,
      body: bodyContent,
    );
  }
}
