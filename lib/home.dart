import 'package:flutter/material.dart';
import 'package:jdih_app/search.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(Homepage());
  });
}

class Homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
  final pages = [Terkini(), Tematik(), Search()];

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
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Home'),
      // ),
      // body: Center(
      //   child: _widgetOptions.elementAt(_selectedIndex),
      // ),
      // drawer: Drawer(
      //   child: ListView(
      //     padding: EdgeInsets.zero,
      //     children: <Widget>[
      //       DrawerHeader(
      //         child: Image.asset('images/jdih_logo.png'),
      //         decoration: BoxDecoration(
      //           color: Colors.blue,
      //         ),
      //       ),
      //       ListTile(
      //         title: Text(
      //           'Terkini',
      //         ),
      //         leading: Icon(Icons.home),
      //         onTap: () {
      //           Navigator.pop(context);
      //           _onItemTapped(0);
      //         },
      //       ),
      //       ListTile(
      //         title: Text(
      //           'Tematik',
      //         ),
      //         leading: Icon(Icons.library_books),
      //         onTap: () {
      //           _onItemTapped(1);
      //         },
      //       ),
      //       ListTile(
      //         title: Text(
      //           'Pencarian',
      //         ),
      //         leading: Icon(Icons.search),
      //         onTap: () {
      //           _onItemTapped(2);
      //         },
      //       ),
      //       ListTile(
      //         title: Text(
      //           'Bookmark',
      //         ),
      //         leading: Icon(Icons.bookmark),
      //         onTap: () {
      //           _onItemTapped(3);
      //         },
      //       ),
      //       ListTile(
      //         title: Text('Bantuan'),
      //         leading: Icon(Icons.question_answer),
      //         onTap: () {
      //           _onItemTapped(4);
      //         },
      //       ),
      //     ],
      //   ),
      // ),
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
      body: pages.elementAt(_selectedIndex),
    );
  }
}

class Terkini extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFf7f7f7),
      appBar: AppBar(
          title: Text(
        "Peraturan Terkini",
        style: TextStyle(color: Colors.white),
      )),
      body: Container(
        margin: EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            buildCard(Icons.access_alarm, "Peraturan 1"),
            buildCard(Icons.access_alarm, "Peraturan 2"),
            buildCard(Icons.access_alarm, "Peraturan 3"),
            buildCard(Icons.access_alarm, "Peraturan 4"),
            buildCard(Icons.access_alarm, "Peraturan 5"),
            buildCard(Icons.access_alarm, "Peraturan 6")
          ],
        ),
      ),
    );
  }

  Card buildCard(IconData iconData, String text) {
    return Card(
      child: Row(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(40),
            child: Icon(
              iconData,
              color: Colors.green,
            ),
          ),
          Text(text, style: TextStyle(fontSize: 50),)
        ],
      ),
    );
  }
}

class Tematik extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        "Tematik",
        style: TextStyle(color: Colors.white),
      )),
      body: Center(
        child: Text('Tematik'),
      ),
    );
  }
}

class Search extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
