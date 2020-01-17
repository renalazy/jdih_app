import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:jdih_app/login.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(RegisterApp());
  });
}

class RegisterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Register',
      home: RegisterPage(),
    );
  }
}

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String nama, email, username, password, nik;
  final _key = new GlobalKey<FormState>();

  bool _secureText = true;

  showHide() {
    setState(() {
      _secureText = !_secureText;
    });
  }

  check() {
    final form = _key.currentState;
    if (form.validate()) {
      form.save();
      save();
    }
  }

  save() async {
    final response =
        await http.post("http://jdih.probolinggokab.go.id/register.php", body: {
      "nama": nama,
      "email": email,
      "username": username,
      "password": password,
      "nik": nik,
    });
    final data = jsonDecode(response.body);
    int value = data['value'];
    String pesan = data['message'];
    if (value == 1) {
      setState(() {
        //Navigator.pop(context);
        Fluttertoast.showToast(
            msg: "Registrasi Berhasil Silahkan Login",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIos: 1,
            textColor: Colors.black,
            fontSize: 14.0);
      });
    } else {
      Fluttertoast.showToast(
          msg: "Username Telah Digunakan",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIos: 1,
          textColor: Colors.black,
          fontSize: 14.0);
      print(pesan);
    }
  }

  @override
  Widget build(BuildContext context) {
    final topContent = new LayoutBuilder(
      builder: (BuildContext context, BoxConstraints viewportConstraints) {
        return SingleChildScrollView(
          child: Form(
            key: _key,
            child: ConstrainedBox(
              constraints:
                  BoxConstraints(minHeight: viewportConstraints.maxHeight),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      Container(
                        child: Image(
                          image: AssetImage('images/register-background.png'),
                          height: 265.0,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(top: 175.0, left: 40.0),
                            child: Text(
                              'JDIH',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 31.0,
                                  color: Colors.white,
                                  fontFamily: 'TitilliumWeb'),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 40.0),
                            child: Text(
                              'Registrasi',
                              style: TextStyle(
                                  fontSize: 19.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w300,
                                  fontFamily: 'TitilliumWeb'),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(top: 30.0, left: 40.0),
                          child: Text(
                            'Buat Akun \nAnda',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 31.0,
                                color: Color(0xFF038C7F),
                                fontFamily: 'TitilliumWeb'),
                          ),
                        ),
                        SizedBox(height: 30.0),
                        Container(
                          height: 50.0,
                          margin: EdgeInsets.symmetric(horizontal: 40.0),
                          child: TextFormField(
                            onSaved: (e) => nama = e,
                            decoration: InputDecoration(
                              labelText: 'Nama Lengkap',
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25.0),
                                  borderSide: BorderSide()),
                            ),
                            // validator: (val) {
                            //   if (val.length == 0) {
                            //     return 'Nama cannot be empty';
                            //   } else {
                            //     return null;
                            //   }
                            // },
                            keyboardType: TextInputType.text,
                          ),
                        ),
                        SizedBox(height: 5.0),
                        Container(
                          height: 50.0,
                          margin: EdgeInsets.symmetric(horizontal: 40.0),
                          child: TextFormField(
                            onSaved: (e) => email = e,
                            decoration: InputDecoration(
                              labelText: 'Email',
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25.0),
                                  borderSide: BorderSide()),
                            ),
                            // validator: (val) {
                            //   if (val.length == 0) {
                            //     return 'email cannot be empty';
                            //   } else {
                            //     return null;
                            //   }
                            // },
                            keyboardType: TextInputType.emailAddress,
                          ),
                        ),
                        SizedBox(height: 5.0),
                        Container(
                          height: 50.0,
                          margin: EdgeInsets.symmetric(horizontal: 40.0),
                          child: TextFormField(
                            onSaved: (e) => username = e,
                            decoration: InputDecoration(
                              labelText: 'Username',
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25.0),
                                  borderSide: BorderSide()),
                            ),
                            // validator: (val) {
                            //   if (val.length == 0) {
                            //     return 'Username cannot be empty';
                            //   } else {
                            //     return null;
                            //   }
                            // },
                            validator: (e) {
                              if (e.isEmpty) {
                                return "Please insert username";
                              }
                            },
                            keyboardType: TextInputType.text,
                          ),
                        ),
                        SizedBox(height: 5.0),
                        Container(
                          height: 50.0,
                          margin: EdgeInsets.symmetric(horizontal: 40.0),
                          child: TextFormField(
                            obscureText: _secureText,
                            onSaved: (e) => password = e,
                            decoration: InputDecoration(
                              labelText: 'Password',
                              suffixIcon: IconButton(
                                onPressed: showHide,
                                icon: Icon(_secureText
                                    ? Icons.visibility_off
                                    : Icons.visibility),
                              ),
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25.0),
                                  borderSide: BorderSide()),
                            ),
                            // validator: (val) {
                            //   if (val.length == 0) {
                            //     return 'Password cannot be empty';
                            //   } else {
                            //     return null;
                            //   }
                            // },
                            keyboardType: TextInputType.text,
                          ),
                        ),
                        SizedBox(height: 5.0),
                        Container(
                          height: 50.0,
                          margin: EdgeInsets.symmetric(horizontal: 40.0),
                          child: TextFormField(
                            onSaved: (e) => nik = e,
                            decoration: InputDecoration(
                              labelText: 'NIK',
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25.0),
                                  borderSide: BorderSide()),
                            ),
                            // validator: (val) {
                            //   if (val.length == 0) {
                            //     return 'NIK cannot be empty';
                            //   } else {
                            //     return null;
                            //   }
                            // },
                            keyboardType: TextInputType.number,
                          ),
                        ),
                        SizedBox(height: 30.0),
                        Center(
                          child: GestureDetector(
                            onTap: () {
                              check();
                            },
                            child: Container(
                              height: 50.0,
                              margin: EdgeInsets.symmetric(horizontal: 40.0),
                              decoration: BoxDecoration(
                                border:
                                    Border.all(width: 1, color: Colors.white),
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(50.0),
                                    bottomRight: Radius.circular(50.0)),
                                color: Color(0xFF038C7F),
                              ),
                              child: Center(
                                child: Text(
                                  'Submit',
                                  style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontFamily: 'TitilliumWeb'),
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
                                'sudah punya akun? silahkan ',
                                style: TextStyle(
                                    fontSize: 15.0, fontFamily: 'TitilliumWeb'),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                // Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (context) => LoginPage()));
                                Navigator.pop(context);
                              },
                              child: Container(
                                child: Text(
                                  'login',
                                  style: TextStyle(
                                      fontSize: 15.0,
                                      fontFamily: 'TitilliumWeb',
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          height: 35.0,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );

    return Scaffold(
      backgroundColor: Color(0xFFF9FBF6),
      body: topContent,
    );
  }
}
