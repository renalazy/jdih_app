import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

void main() {
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(AccountApp());
  });
}

class AccountApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Account',
      home: AccountPage(),
    );
  }
}

class AccountPage extends StatefulWidget {
  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
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
              color: Color(0xFF03A696),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );

    final bodyContent = SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(vertical: 40.0, horizontal: 40.0),
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20.0),
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage('images/google-logo.png'),
                backgroundColor: Colors.transparent,
              ),
              title: Text(
                'Rosihan Andin Pambudi',
                style: TextStyle(
                    fontSize: 15.0,
                    fontFamily: 'TitilliumWeb',
                    fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                'me@rosihan.my.id',
                style: TextStyle(fontSize: 12.0, fontFamily: 'TitilliumWeb'),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 20.0),
            child: Card(
              child: ListTile(
                title: Text(
                  'Profile',
                  style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'TitilliumWeb',
                      color: Colors.grey.shade600),
                ),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
            ),
          ),
          Container(
            child: Card(
              child: ListTile(
                title: Text(
                  'Panduan Pengguna',
                  style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'TitilliumWeb',
                      color: Colors.grey.shade600),
                ),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
            ),
          ),
          Container(
            child: Card(
              child: ListTile(
                title: Text(
                  'Frequently Asked Question (FAQ)',
                  style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'TitilliumWeb',
                      color: Colors.grey.shade600),
                ),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
            ),
          ),
          Container(
            child: Card(
              child: ListTile(
                title: Text(
                  'Hubungi Kami',
                  style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'TitilliumWeb',
                      color: Colors.grey.shade600),
                ),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
            ),
          ),
          Container(
            child: Card(
              child: ListTile(
                title: Text(
                  'Kunjungi Website',
                  style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'TitilliumWeb',
                      color: Colors.grey.shade600),
                ),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
            ),
          )
        ],
      ),
    );

    return Scaffold(
      body: bodyContent,
      bottomNavigationBar: makeBottom,
    );
  }
}
