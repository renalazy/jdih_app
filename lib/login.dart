import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jdih_app/forget_password.dart';
import 'package:jdih_app/home.dart';

void main() {
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(LoginApp());
  });
}

class LoginApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login',
    
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
  
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final appbarContent = AppBar(
      title: Text(
        'JDIH',
        style: TextStyle(
            fontSize: 31.0,
            fontFamily: 'TitilliumWeb',
            fontWeight: FontWeight.bold,
            color: Colors.white),
      ),
      backgroundColor: Color(0xFF038C7F),
    );

    final bodyContent = SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(vertical: 60.0, horizontal: 40.0),
            child: Text(
              'Log in to your \nAccount',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 31.0,
                fontFamily: 'TitilliumWeb',
                color: Color(0xFF038C7F),
              ),
            ),
          ),
          Container(
            height: 50.0,
            margin: EdgeInsets.symmetric(horizontal: 40.0),
            child: TextFormField(
              decoration: InputDecoration(
                labelText: 'Username',
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
          SizedBox(height: 10.0),
          Container(
            height: 50.0,
            margin: EdgeInsets.symmetric(horizontal: 40.0),
            child: TextFormField(
              decoration: InputDecoration(
                labelText: 'Password',
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
              keyboardType: TextInputType.visiblePassword,
            ),
          ),
          SizedBox(height: 50.0),
          GestureDetector(
            onTap: () {
               Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) {
              return Homepage();
            }));
            },
            child: Center(
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
                    'Login',
                    style: TextStyle(
                        fontSize: 20.0,
                        fontFamily: 'TitilliumWeb',
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 20.0),
          Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(left: 40.0),
                child: Text(
                  'Lupa password ? silahkan ',
                  style: TextStyle(fontSize: 12.0, fontFamily: 'TitilliumWeb'),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ForgetPasswordPage()));
                },
                child: Container(
                  margin: EdgeInsets.only(left: 5.0),
                  child: Text(
                    'Konfirmasi Email',
                    style: TextStyle(
                        fontSize: 12.0,
                        fontFamily: 'TitilliumWeb',
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
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
