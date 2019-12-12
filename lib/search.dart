import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(SearchPage());
  });
}

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  // final _formKey = GlobalKey<FormState>();

  // List<String> _bentuk = ['A', 'B', 'C'];

  // int _selectedIndex = 2;
  // static const TextStyle optionStyle =
  //     TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  // static const List<Widget> _widgetOptions = <Widget>[
  //   Text(
  //     'Index 0: Home',
  //     style: optionStyle,
  //   ),
  //   Text(
  //     'Index 1: PUU',
  //     style: optionStyle,
  //   ),
  //   Text(
  //     'Index 2: Search',
  //     style: optionStyle,
  //   ),
  // ];

  // void _onItemTapped(int index) {
  //   setState(() {
  //     switch (index) {
  //       case 0:
  //         Navigator.pop(context);
  //         break;
  //       case 2:
  //         break;
  //     }
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Pencarian',
        ),
        backgroundColor: Color(0xFF038C7F),
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                hintText: 'input keyword',
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontSize: 15.0,
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0)),
                prefixIcon: Icon(Icons.search),
              ),
            ),
            SizedBox(height: 30.0),
            Container(
              height: 56.0,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(23.0),
                gradient: LinearGradient(
                  colors: [Color(0xFF038C7F), Color(0xFF038C7F)],
                  begin: Alignment.centerRight,
                  end: Alignment.centerLeft,
                ),
              ),
              child: Center(
                child: Text(
                  'SEARCH',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
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
      //           Navigator.pop(context);
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
      // bottomNavigationBar: BottomNavigationBar(
      //   items: const <BottomNavigationBarItem>[
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.home),
      //       title: Text('Terkini'),
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.library_books),
      //       title: Text('Tematik'),
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.search),
      //       title: Text('Pencarian'),
      //     ),
      //   ],
      //   currentIndex: _selectedIndex,
      //   selectedItemColor: Colors.blue.shade800,
      //   onTap: _onItemTapped,
      // ),
    );
  }
}
