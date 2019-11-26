import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jdih_app/login.dart';

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
  @override
  Widget build(BuildContext context) {
    final topContent = new LayoutBuilder(
      builder: (BuildContext context, BoxConstraints viewportConstraints) {
        return SingleChildScrollView(
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
                          decoration: InputDecoration(
                            labelText: 'Nama Lengkap',
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25.0),
                                borderSide: BorderSide()),
                          ),
                          validator: (val) {
                            if (val.length == 0) {
                              return 'Nama cannot be empty';
                            } else {
                              return null;
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
                          decoration: InputDecoration(
                            labelText: 'Email',
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
                      SizedBox(height: 5.0),
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
                              return 'Username cannot be empty';
                            } else {
                              return null;
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
                          decoration: InputDecoration(
                            labelText: 'Password',
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25.0),
                                borderSide: BorderSide()),
                          ),
                          validator: (val) {
                            if (val.length == 0) {
                              return 'Password cannot be empty';
                            } else {
                              return null;
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
                          decoration: InputDecoration(
                            labelText: 'NIK',
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25.0),
                                borderSide: BorderSide()),
                          ),
                          validator: (val) {
                            if (val.length == 0) {
                              return 'NIK cannot be empty';
                            } else {
                              return null;
                            }
                          },
                          keyboardType: TextInputType.number,
                        ),
                      ),
                      SizedBox(height: 30.0),
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
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginPage()));
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
        );
      },
    );

    return Scaffold(
      backgroundColor: Color(0xFFF9FBF6),
      body: topContent,
    );
  }
}
