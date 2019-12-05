import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:jdih_app/Peraturan.dart';
import 'package:http/http.dart' as http;
import 'list_peraturan.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'List',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new ListPeraturanPerda(title: 'List'),
    );
  }
}

class ListPeraturanPerda extends StatefulWidget {
  ListPeraturanPerda({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ListPeraturanPerda createState() => new _ListPeraturanPerda();
}

class _ListPeraturanPerda extends State<ListPeraturanPerda> {
  Future _getUsers() async {
    var data =
        await http.get("https://jdih.probolinggokab.go.id/integrasi2.php");

    var jsonData = json.decode(data.body);
    Peraturan peraturan = Peraturan.fromJson(jsonData);
    return peraturan.perundangan;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Color(0xFFF038C7F),
        title: new Text("List Peraturan Perda"),
      ),
      body: Container(
        child: FutureBuilder(
          future: _getUsers(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            print(snapshot.data);
            if (snapshot.data == null) {
              return new Center(child: new CircularProgressIndicator());
            } else {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  if (snapshot.data[index].singkatanJenis == "PERDA") {
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
                  } else {
                    return new Container();
                  }
                },
              );
            }
          },
        ),
      ),
    );
  }
}
