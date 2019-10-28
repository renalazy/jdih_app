import 'package:flutter/material.dart';
import 'package:jdih_app/search.dart';

void main() => runApp(Homepage());

class Homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Home'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Terkini',
      style: optionStyle,
    ),
    Text(
      'Index 1: Tematik',
      style: optionStyle,
    ),
    Text(
      'Index 2: Pencarian',
      style: optionStyle,
    ),
    Text(
      'Index 3: Bookmark',
      style: optionStyle,
    ),
    Text(
      'Index 4: Bantuan',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      switch (index) {
        case 2:
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SearchPage(),
              ));
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Image.asset('images/jdih_logo.png'),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: Text(
                'Terkini',
              ),
              leading: Icon(Icons.home),
              onTap: () {
                Navigator.pop(context);
                _onItemTapped(0);
              },
            ),
            ListTile(
              title: Text(
                'Tematik',
              ),
              leading: Icon(Icons.library_books),
              onTap: () {
                _onItemTapped(1);
              },
            ),
            ListTile(
              title: Text(
                'Pencarian',
              ),
              leading: Icon(Icons.search),
              onTap: () {
                _onItemTapped(2);
              },
            ),
            ListTile(
              title: Text(
                'Bookmark',
              ),
              leading: Icon(Icons.bookmark),
              onTap: () {
                _onItemTapped(3);
              },
            ),
            ListTile(
              title: Text('Bantuan'),
              leading: Icon(Icons.question_answer),
              onTap: () {
                _onItemTapped(4);
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Terkini'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_books),
            title: Text('Tematik'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            title: Text('Pencarian'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue.shade800,
        onTap: _onItemTapped,
      ),
    );
  }
}
