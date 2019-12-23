import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:jdih_app/Peraturan.dart';
import 'package:http/http.dart' as http;
import 'package:jdih_app/list_peraturan.dart';

void main() {
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(PerbupTahun());
  });
}

class PerbupTahun extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Perbup2013(),
    );
  }
}

class Perbup2013 extends StatelessWidget {
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
        title: new Text("List Peraturan Perbup"),
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
                  if (snapshot.data[index].singkatanJenis == "PERBUP" &&
                      snapshot.data[index].tahun_pengundangan == 2013) {
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

class Perbup2014 extends StatelessWidget {
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
        title: new Text("List Peraturan Perbup"),
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
                  if (snapshot.data[index].singkatanJenis == "PERBUP" &&
                      snapshot.data[index].tahun_pengundangan == 2014) {
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

class Perbup2015 extends StatelessWidget {
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
        title: new Text("List Peraturan Perbup"),
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
                  if (snapshot.data[index].singkatanJenis == "PERBUP" &&
                      snapshot.data[index].tahun_pengundangan == 2015) {
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

class Perbup2016 extends StatelessWidget {
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
        title: new Text("List Peraturan Perbup"),
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
                  if (snapshot.data[index].singkatanJenis == "PERBUP" &&
                      snapshot.data[index].tahun_pengundangan == 2016) {
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

class Perbup2017 extends StatelessWidget {
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
        title: new Text("List Peraturan Perbup"),
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
                  if (snapshot.data[index].singkatanJenis == "PERBUP" &&
                      snapshot.data[index].tahun_pengundangan == 2017) {
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


class Perbup2018 extends StatelessWidget {
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
        title: new Text("List Peraturan Perbup"),
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
                  if (snapshot.data[index].singkatanJenis == "PERBUP" &&
                      snapshot.data[index].tahun_pengundangan == 2018) {
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


class Perbup2019 extends StatelessWidget {
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
        title: new Text("List Peraturan Perbup"),
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
                  if (snapshot.data[index].singkatanJenis == "PERBUP" &&
                      snapshot.data[index].tahun_pengundangan == 2019) {
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