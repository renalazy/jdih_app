import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(DownloadsApp());
  });
}

class DownloadsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp();
  }
}

class DownloadsPage extends StatefulWidget {
  @override
  _DownloadsPageState createState() => _DownloadsPageState();
}

class _DownloadsPageState extends State<DownloadsPage> {
  @override
  Widget build(BuildContext context) {
    final bodyContent = SingleChildScrollView(
        child: Column(
      children: <Widget>[
        Container(
          child: Stack(
            children: <Widget>[
              Container(
                child: Image(
                  image: AssetImage('images/perda.jpg'),
                  height: 265.0,
                  fit: BoxFit.cover,
                ),
              ),
              SafeArea(
                child: Container(
                  margin: EdgeInsets.only(top: 20.0, left: 20.0),
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                  ),
                ),
              ),
              SafeArea(
                child: Container(
                  margin: EdgeInsets.only(top: 20.0, right: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Icon(Icons.lock, color: Colors.white),
                      SizedBox(width: 30.0),
                      Icon(Icons.share, color: Colors.white)
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 200.0, right: 30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    FloatingActionButton(
                      backgroundColor: Color(0xFFC85B6C),
                      elevation: 0,
                      child: Icon(Icons.tv, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 20.0),
        Container(
          margin: EdgeInsets.only(left: 30.0),
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'PERBUP',
                  style: TextStyle(
                    fontFamily: 'TitilliumWeb',
                    fontSize: 12.0,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFFE7568),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'PERBUP NO 1 TAHUN 2019 TENTANG PENYESUAIAN\nTARIF PARKIR',
                  style: TextStyle(
                    fontFamily: 'TitilliumWeb',
                    fontSize: 12.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(height: 10.0),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Disukai: 19.000 Size: 21 Kib',
                  style: TextStyle(
                    fontFamily: 'TitilliumWeb',
                    fontSize: 12.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
              ),
              Row(
                children: <Widget>[
                  Icon(
                    Icons.cloud_circle,
                    color: Color(0xFF038C7F),
                    size: 20.0,
                  ),
                  Icon(
                    Icons.cloud_circle,
                    color: Color(0xFF038C7F),
                    size: 20.0,
                  ),
                  Icon(
                    Icons.cloud_circle,
                    color: Color(0xFF038C7F),
                    size: 20.0,
                  ),
                  Icon(
                    Icons.cloud_circle,
                    color: Color(0xFF038C7F),
                    size: 20.0,
                  ),
                  Icon(
                    Icons.cloud_circle,
                    color: Colors.grey,
                    size: 20.0,
                  ),
                  SizedBox(width: 5.0),
                  Text(
                    '190 review',
                    style: TextStyle(
                        fontSize: 12.0,
                        fontFamily: 'TitilliumWeb',
                        color: Colors.grey),
                  )
                ],
              )
            ],
          ),
        ),
        SizedBox(height: 20.0),
        Transform.rotate(
          angle: -3.14 / 30,
          child: Divider(
            color: Colors.black,
            height: 2.0,
            thickness: 1.0,
          ),
        ),
        SizedBox(height: 50.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 55.0,
              width: 175.0,
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.white),
                borderRadius: BorderRadius.circular(50.0),
                color: Color(0xFFFCCA6C),
              ),
              child: Center(
                child: Text(
                  'Lihat Peraturan',
                  style: TextStyle(
                    fontSize: 12.0,
                    fontFamily: 'TitilliumWeb',
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(width: 10.0),
            Container(
              height: 55.0,
              width: 175.0,
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.white),
                borderRadius: BorderRadius.circular(50.0),
                color: Color(0xFF315B8A),
              ),
              child: Center(
                child: Text(
                  'Unduh Peraturan',
                  style: TextStyle(
                    fontSize: 12.0,
                    fontFamily: 'TitilliumWeb',
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 20.0),
        Container(
          color: Colors.grey.shade200,
          padding: EdgeInsets.symmetric(vertical: 2.5),
          child: Card(
            child: ListTile(
              leading: FloatingActionButton(
                elevation: 0,
                mini: true,
                backgroundColor: Color(0xFFFE7568),
                child: Icon(Icons.bookmark, color: Colors.white, size: 30.0),
              ),
              title: Text(
                'Kunjungi Website JDIH',
                style: TextStyle(
                  fontFamily: 'TitilliumWeb',
                  fontSize: 12.0,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF038C7F),
                ),
              ),
              subtitle: Text(
                'jdih.probolinggo.go.id',
                style: TextStyle(
                    fontSize: 12.0,
                    fontFamily: 'Titilliumweb',
                    color: Colors.grey),
              ),
            ),
          ),
        ),
        Container(
          color: Colors.grey.shade200,
          padding: EdgeInsets.symmetric(vertical: 2.5),
          child: Card(
            child: ListTile(
              leading: FloatingActionButton(
                elevation: 0,
                backgroundColor: Color(0xFF038C7F),
                mini: true,
                child: Icon(
                  Icons.message,
                  color: Colors.white,
                ),
              ),
              title: Text(
                'Beri Review',
                style: TextStyle(
                  fontFamily: 'TitilliumWeb',
                  fontSize: 12.0,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF038C7F),
                ),
              ),
              subtitle: Text(
                'Review anda mendukung pelayanan kami',
                style: TextStyle(
                    fontSize: 12.0,
                    fontFamily: 'Titilliumweb',
                    color: Colors.grey),
              ),
            ),
          ),
        ),
      ],
    ));

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
              color: Colors.black,
              onPressed: () {},
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

    return Scaffold(
      body: bodyContent,
      bottomNavigationBar: makeBottom,
    );
  }
}
