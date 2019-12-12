import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jdih_app/downloads.dart';

void main() {
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(TematikApp());
  });
}

class TematikApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TematikPage(),
    );
  }
}

class TematikPage extends StatefulWidget {
  @override
  _TematikPageState createState() => _TematikPageState();
}

class _TematikPageState extends State<TematikPage> {
  @override
  Widget build(BuildContext context) {
    final appbarContent = AppBar(
      title: Text(
        'Tematik',
      ),
      backgroundColor: Color(0xFF038C7F),
    );

    final bodyContent = SafeArea(
      child: Column(
        children: <Widget>[
          GestureDetector(
            onTap: () {
              // Navigator.push(context,
              //     MaterialPageRoute(builder: (context) => DownloadsPage()));
            },
            child: Container(
              child: Stack(
                children: <Widget>[
                  Container(
                    child: Image(
                      image: AssetImage('images/perda.jpg'),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 155.0, left: 40.0),
                    child: Text(
                      'PERDA',
                      style: TextStyle(
                          fontSize: 31.0,
                          fontFamily: 'TitilliumWeb',
                          color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Container(
            child: Stack(
              children: <Widget>[
                Container(
                  child: Image(
                    image: AssetImage('images/perbup.png'),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 155.0, left: 40.0),
                  child: Text(
                    'PERBUB',
                    style: TextStyle(
                        fontSize: 31.0,
                        fontFamily: 'TitilliumWeb',
                        color: Colors.white),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );

    return Scaffold(
      appBar: appbarContent,
      body: bodyContent,
    );
  }
}
