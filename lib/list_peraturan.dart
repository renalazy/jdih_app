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
                      title: Text(snapshot.data[index].judul),
                      subtitle: Text(snapshot.data[index].jenis),
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
      appBar: AppBar(
        backgroundColor: Color(0xFFF038C7F),
        // title: Text(perundangan.noPeraturan.toString()),
        title: Text("Detail Peraturan"),
      ),
      body: Stack(
        children: <Widget>[
          Container(
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("images/foto.jpg"), fit: BoxFit.cover),
              )),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: EdgeInsets.fromLTRB(10, 220, 10, 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    perundangan.singkatanJenis,
                    style: TextStyle(
                        fontWeight: FontWeight.w700, color: Color(0xFFFFE8377)),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Text(
                      perundangan.judul,
                      style: TextStyle(fontWeight: FontWeight.w700),
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                          margin: EdgeInsets.only(top: 10),
                          child: Text("Disukai : 19.000")),
                      Container(
                        margin: EdgeInsets.fromLTRB(8, 10, 0, 0),
                        child: Text("Size 20 Kib"),
                      )
                    ],
                  ),
                  Container(
                      margin: EdgeInsets.only(top: 20),
                      height: 0.5,
                      color: Colors.grey.shade400),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.4,
                          height: 55,
                          child: Container(
                            child: Material(
                              borderRadius: BorderRadius.circular(100),
                              color: Colors.transparent,
                              child: InkWell(
                                borderRadius: BorderRadius.circular(100),
                                splashColor: Colors.blue,
                                onTap: () {},
                                child: Center(
                                  child: Text(
                                    "Lihat Peraturan",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                              ),
                            ),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                gradient: LinearGradient(
                                    colors: [
                                      Color(0xFFF315B8A),
                                      Color(0xFFF315B8A)
                                    ],
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter)),
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.4,
                          height: 55,
                          child: Container(
                            child: Material(
                              borderRadius: BorderRadius.circular(100),
                              color: Colors.transparent,
                              child: InkWell(
                                borderRadius: BorderRadius.circular(100),
                                splashColor: Colors.amber,
                                onTap: () {},
                                child: Center(
                                  child: Text(
                                    "Unduh Peraturan",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                              ),
                            ),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                gradient: LinearGradient(
                                    colors: [
                                      Color(0xFFFFCCA6C),
                                      Color(0xFFFFCCA6C)
                                    ],
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter)),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
