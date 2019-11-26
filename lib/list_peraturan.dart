import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:jdih_app/Peraturan.dart';
import 'package:http/http.dart' as http;

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'List',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new ListPeraturan(title: 'List'),
    );
  }
}

class ListPeraturan extends StatefulWidget {
  ListPeraturan({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ListPeraturan createState() => new _ListPeraturan();
}

class _ListPeraturan extends State<ListPeraturan> {
  Future _getUsers() async {
    var data =
        await http.get("http://jdih.probolinggokab.go.id/integrasi2.php");

    var jsonData = json.decode(data.body);
    Peraturan peraturan = Peraturan.fromJson(jsonData);
    return peraturan.perundangan;

    //final jsonData = json.decode(jsonString);

    // List<User> users = [];
    // for(var u in jsonData){
    //   User user = User(u["idData"], u["tahun_pengundangan"], u["tanggal_pengundangan"], u["jenis"], u["noPeraturan"], u["judul"]);
    //   users.add(user);
    // }
    // print(users.length);
    // return users;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Color(0xFFF038C7F),
        title: new Text("List Peraturan"),
      ),
      body: Container(
        child: FutureBuilder(
          future: _getUsers(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            print(snapshot.data);
            if (snapshot.data == null) {
              return Container(child: Center(child: Text("Loading...")));
            } else {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundImage: AssetImage("images/foto.jpg"),
                      ),
                      title: Text(
                        snapshot.data[index].judul,
                        style: TextStyle(fontWeight: FontWeight.w700),
                      ),
                      subtitle: Container(
                          margin: EdgeInsets.only(top: 5),
                          child: Text(
                            snapshot.data[index].jenis,
                            style: TextStyle(
                                color: Color(0xFFFE7568),
                                fontWeight: FontWeight.w700),
                          )),
                      onTap: () {
                        Navigator.push(
                            context,
                            new MaterialPageRoute(
                                builder: (context) =>
                                    DetailPage(snapshot.data[index])));
                      },
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}

class DetailPage extends StatelessWidget {
  final Perundangan perundangan;

  DetailPage(this.perundangan);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
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
                      onPressed: () {},
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
                  perundangan.singkatanJenis,
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
                  perundangan.judul,
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
                heroTag: "btn2",
                elevation: 0,
                mini: true,
                backgroundColor: Color(0xFFFE7568),
                child: Icon(Icons.bookmark, color: Colors.white, size: 30.0),
                onPressed: () {},
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
                heroTag: "btn1",
                elevation: 0,
                backgroundColor: Color(0xFF038C7F),
                mini: true,
                child: Icon(
                  Icons.message,
                  color: Colors.white,
                ),
                onPressed: () {},
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
    )));
  }
}
