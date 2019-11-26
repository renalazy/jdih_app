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
        'JDIH',
        style: TextStyle(
            fontSize: 31.0,
            fontFamily: 'TitilliumWeb',
            fontWeight: FontWeight.bold,
            color: Colors.white),
      ),
      backgroundColor: Color(0xFF038C7F),
    );

    final makeBottom = Container(
      height: 55.0,
      child: BottomAppBar(
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.home),
              color: Colors.black,
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.bookmark),
              color: Colors.black,
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.library_books),
              color: Color(0xFF03A696),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => TematikPage()));
              },
            ),
            IconButton(
              icon: Icon(Icons.person),
              color: Colors.black,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );

    final bodyContent = SafeArea(
      child: Column(
        children: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => DownloadsPage()));
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
      bottomNavigationBar: makeBottom,
    );
  }
}
