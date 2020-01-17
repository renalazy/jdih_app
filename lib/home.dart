import 'package:flutter/material.dart';
import 'package:jdih_app/category_perbup.dart';
import 'package:jdih_app/list_peraturan.dart';
import 'package:jdih_app/list_peraturan_perda.dart';
import 'package:jdih_app/login.dart';
import 'package:jdih_app/profile.dart';
import 'package:jdih_app/search.dart';
import 'package:flutter/services.dart';
import 'package:jdih_app/tematik.dart';

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
      home: MyHomePage(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  final pages = [Terkini(), TematikPage(), SearchPage(), ProfilePage()];

  int _selectedIndex = 0;
  // static const TextStyle optionStyle =
  //     TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  // static const List<Widget> _widgetOptions = <Widget>[
  //   Text(
  //     'Index 0: Terkini',
  //     style: optionStyle,
  //   ),
  //   Text(
  //     'Index 1: Tematik',
  //     style: optionStyle,
  //   ),
  //   Text(
  //     'Index 2: Pencarian',
  //     style: optionStyle,
  //   ),
  //   // Text(
  //   //   'Index 3: Bookmark',
  //   //   style: optionStyle,
  //   // ),
  //   // Text(
  //   //   'Index 4: Bantuan',
  //   //   style: optionStyle,
  //   // ),
  // ];

  void _onItemTapped(int index) {
    setState(() {
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
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text('Profile'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color(0xFFF038C7F),
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
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
          backgroundColor: Color(0xFFF038C7F),
          title: Text(
            "Peraturan Terkini",
            style: TextStyle(color: Colors.white),
          )),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.fromLTRB(20, 20, 20, 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Hi, Pengguna!",
                  style: TextStyle(
                      color: Colors.grey, fontWeight: FontWeight.w700),
                ),
              ),
              Row(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Jdih Kab",
                        style: TextStyle(
                            color: Color(0xFFF038C7F),
                            fontWeight: FontWeight.w700,
                            fontSize: 35),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(8, 10, 0, 0),
                    child: Text(
                      "Probolinggo",
                      style: TextStyle(color: Color(0xFFF038C7F), fontSize: 35),
                    ),
                  ),
                ],
              ),
              Container(
                height: 50,
                margin: EdgeInsets.fromLTRB(0, 15, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Flexible(
                      child: TextField(
                        decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            prefixIcon: Icon(Icons.search),
                            hintText: "Search Peraturan...",
                            hintStyle: TextStyle(height: 0.9),
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.transparent),
                                borderRadius: BorderRadius.circular(25.0)),
                            enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.transparent),
                                borderRadius: BorderRadius.circular(25.0))),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 10),
                      child: Icon(
                        Icons.sort,
                        color: Color(0xFFF315B8A),
                        size: 40,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    FloatingActionButton(
                      heroTag: "btn1",
                      mini: true,
                      backgroundColor: Color(0XFFFFE7568),
                      elevation: 0,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ListPeraturan()));
                      },
                      child: Icon(
                        Icons.cloud_done,
                        color: Colors.white,
                      ),
                    ),
                    FloatingActionButton(
                      heroTag: "btn2",
                      mini: true,
                      backgroundColor: Color(0xFFFC85B6C),
                      elevation: 0,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ListPeraturanPerda()));
                      },
                      child: Icon(
                        Icons.security,
                        color: Colors.white,
                      ),
                    ),
                    FloatingActionButton(
                      mini: true,
                      heroTag: "btn3",
                      backgroundColor: Color(0xFFFFCCA6C),
                      elevation: 0,
                      onPressed: () {
                        Scaffold.of(context).showSnackBar(SnackBar(
                          content: Text("Belum Ada Peraturan"),
                        ));
                      },
                      child: Icon(
                        Icons.adb,
                        color: Colors.white,
                      ),
                    ),
                    FloatingActionButton(
                      heroTag: "btn4",
                      backgroundColor: Color(0xFFF548FCC),
                      mini: true,
                      elevation: 0,
                      onPressed: () {
                        Scaffold.of(context).showSnackBar(SnackBar(
                          content: Text("Belum Ada Peraturan"),
                        ));
                      },
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Container(
                      child: Text(
                        "Perbup",
                        style:
                            TextStyle(fontSize: 13, color: Color(0xFFF707070)),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 4),
                      child: Text(
                        "Perda",
                        style:
                            TextStyle(fontSize: 13, color: Color(0xFFF707070)),
                      ),
                    ),
                    Container(
                      child: Text(
                        "Integrasi",
                        style:
                            TextStyle(fontSize: 13, color: Color(0xFFF707070)),
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.only(right: 3),
                        child: Text(
                          "Pusat",
                          style: TextStyle(
                              fontSize: 13, color: Color(0xFFF707070)),
                        ))
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Peraturan Populer",
                      style: TextStyle(color: Color(0xFFF03A696), fontSize: 22),
                    ),
                    Text(
                      "Show All",
                      style: TextStyle(color: Color(0xFFF707070)),
                    ),
                  ],
                ),
              ),
              Center(
                child: Container(
                  height: 200,
                  margin: EdgeInsets.only(top: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        image: (AssetImage("images/foto.jpg")),
                        fit: BoxFit.cover,
                      )),
                ),
              ),
              Container(
                  margin: EdgeInsets.only(top: 10),
                  child: Text(
                    "PERBUP NO 24 TAHUN 2019 TENTANG ANALISIS DAMPAK LALU LINTAS",
                    style: TextStyle(
                        fontSize: 17,
                        color: Colors.black,
                        fontWeight: FontWeight.w700),
                  )),
              Row(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Icon(
                      Icons.star_half,
                      color: Color(0xFFFF25116),
                      size: 30,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(4, 10, 0, 0),
                    child: Text(
                      "Disukai : 19000",
                      style: TextStyle(fontSize: 16, color: Color(0xFFF707070)),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// class Search extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//             backgroundColor: Color(0xFFF038C7F),
//             title: Text(
//               "Search",
//               style: TextStyle(color: Colors.white),
//             )),
//         body: Center(
//           child: Text('Tematik'),
//         ));
//   }
// }
