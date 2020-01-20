import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jdih_app/home.dart';
import 'package:http/http.dart' as http;
import 'package:jdih_app/register.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';

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

enum LoginStatus { notSignIn, signIn }

class _LoginPageState extends State<LoginPage> {
  LoginStatus _loginStatus = LoginStatus.notSignIn;
  String username, password;
  final _key = new GlobalKey<FormState>();
  bool _secureText = true;
  bool _isLoading = false;

  showHide() {
    setState(() {
      _secureText = !_secureText;
    });
  }

  check() {
    final form = _key.currentState;
    if (form.validate()) {
      form.save();
      // print("$username,$password");
      login();
    }
  }

  login() async {
    final response =
        await http.post("http://jdih.probolinggokab.go.id/login.php", body: {
      "username": username,
      "password": password,
    });
    final data = jsonDecode(response.body);
    int value = data['value'];
    String pesan = data['message'];
    String emailAPI = data['email'];
    String usernameAPI = data['username'];
    if (value == 1) {
      setState(() {
        _isLoading = false;
        _loginStatus = LoginStatus.signIn;
        savePref(value, emailAPI, usernameAPI);
      });
      Fluttertoast.showToast(
          msg: "Selamat Datang Di JDIH Kab Problinggo",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIos: 1,
          textColor: Colors.black,
          fontSize: 14.0);
      print(pesan);
    } else {
      setState(() {
        _isLoading = false;
        _loginStatus = LoginStatus.notSignIn;
      });
      Fluttertoast.showToast(
          msg: "username atau password salah",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIos: 1,
          textColor: Colors.black,
          fontSize: 14.0);
      //  print(pesan);
    }
  }

  savePref(int value, String email, String username) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      preferences.setInt("value", value);
      preferences.setString("email", email);
      preferences.setString("username", username);
      preferences.commit();
    });
  }

  var value;
  getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      value = preferences.getInt("value");

      _loginStatus = value == 1 ? LoginStatus.signIn : LoginStatus.notSignIn;
    });
  }

  signOut() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      preferences.setInt("value", null);
      preferences.commit();
      _loginStatus = LoginStatus.notSignIn;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPref();
  }

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

    //safearea
    final bodyContent = Form(
      key: _key,
      child: _isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView(
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.symmetric(
                          vertical: 60.0, horizontal: 40.0),
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
                        //     return 'email cannot be empty';
                        //   } else {
                        //     return null;
                        //   }
                        // },
                        // validator: (e) {
                        //   if (e.isEmpty) {
                        //     return "Please insert username";
                        //   }
                        // },
                        keyboardType: TextInputType.emailAddress,
                      ),
                    ),
                    SizedBox(height: 10.0),
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
                        //     return 'email cannot be empty';
                        //   } else {
                        //     return null;
                        //   }
                        // },
                        keyboardType: TextInputType.visiblePassword,
                      ),
                    ),
                    SizedBox(height: 50.0),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _isLoading = true;
                        });
                        // Navigator.pushReplacement(context,
                        //     MaterialPageRoute(builder: (context) {
                        //   return MyHomePage();
                        // }));
                        check();
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
                            "Don't have an account ?",
                            // "Lupa password ? silahkan ",
                            style: TextStyle(
                                fontSize: 12.0, fontFamily: 'TitilliumWeb'),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    // builder: (context) => ForgetPasswordPage()));
                                    builder: (context) => RegisterPage()));
                          },
                          child: Container(
                            margin: EdgeInsets.only(left: 5.0),
                            child: Text(
                              "Sign up here",
                              // "Konfirmasi Email",
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
              ],
            ),
    );

    switch (_loginStatus) {
      case LoginStatus.notSignIn:
        return Scaffold(
          backgroundColor: Color(0xFFF9FBF6),
          appBar: appbarContent,
          body: bodyContent,
        );
        break;
      case LoginStatus.signIn:
        return MyHomePage();
        break;
    }
  }
}
