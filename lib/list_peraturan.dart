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
      title: Text(perundangan.noPeraturan.toString()),
    ));
  }
}
