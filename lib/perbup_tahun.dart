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
                    return Container(
                      margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              new MaterialPageRoute(
                                  builder: (context) =>
                                      DetailPage(snapshot.data[index])));
                        },
                        child: Card(
                          elevation: 2,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(
                                width: 100,
                                height: 100,
                                child: Container(
                                  margin: EdgeInsets.fromLTRB(3, 3, 3, 3),
                                  child: Card(
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(4),
                                              topRight: Radius.circular(4),
                                              bottomLeft: Radius.circular(4),
                                              bottomRight: Radius.circular(4)),
                                          image: DecorationImage(
                                            image:
                                                (AssetImage("images/foto.jpg")),
                                            fit: BoxFit.cover,
                                          )),
                                    ),
                                  ),
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.67,
                                    margin: EdgeInsets.fromLTRB(7, 7, 7, 6),
                                    child: Text(
                                      snapshot.data[index].judul,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w900,
                                          fontFamily: 'TitilliumWeb'),
                                    ),
                                  ),
                                  Container(
                                    child: Row(
                                      children: <Widget>[
                                        Container(
                                          margin:
                                              EdgeInsets.fromLTRB(7, 5, 3, 0),
                                          child: Icon(
                                            Icons.star_half,
                                            color: Color(0xFFFF25116),
                                            size: 20,
                                          ),
                                        ),
                                        Container(
                                          width: 190,
                                          margin:
                                              EdgeInsets.fromLTRB(1, 5.5, 0, 0),
                                          child: Text(
                                            "Disukai: 19.000 . Size: 21 Kib",
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                fontFamily: 'TitilliumWeb',
                                                fontSize: 14,
                                                color: Color(0xFFF707070)),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
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
                    return Container(
                      margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              new MaterialPageRoute(
                                  builder: (context) =>
                                      DetailPage(snapshot.data[index])));
                        },
                        child: Card(
                          elevation: 2,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(
                                width: 100,
                                height: 100,
                                child: Container(
                                  margin: EdgeInsets.fromLTRB(3, 3, 3, 3),
                                  child: Card(
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(4),
                                              topRight: Radius.circular(4),
                                              bottomLeft: Radius.circular(4),
                                              bottomRight: Radius.circular(4)),
                                          image: DecorationImage(
                                            image:
                                                (AssetImage("images/foto.jpg")),
                                            fit: BoxFit.cover,
                                          )),
                                    ),
                                  ),
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.67,
                                    margin: EdgeInsets.fromLTRB(7, 7, 7, 6),
                                    child: Text(
                                      snapshot.data[index].judul,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w900,
                                          fontFamily: 'TitilliumWeb'),
                                    ),
                                  ),
                                  Container(
                                    child: Row(
                                      children: <Widget>[
                                        Container(
                                          margin:
                                              EdgeInsets.fromLTRB(7, 5, 3, 0),
                                          child: Icon(
                                            Icons.star_half,
                                            color: Color(0xFFFF25116),
                                            size: 20,
                                          ),
                                        ),
                                        Container(
                                          width: 190,
                                          margin:
                                              EdgeInsets.fromLTRB(1, 5.5, 0, 0),
                                          child: Text(
                                            "Disukai: 19.000 . Size: 21 Kib",
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                fontFamily: 'TitilliumWeb',
                                                fontSize: 14,
                                                color: Color(0xFFF707070)),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
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
                    return Container(
                      margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              new MaterialPageRoute(
                                  builder: (context) =>
                                      DetailPage(snapshot.data[index])));
                        },
                        child: Card(
                          elevation: 2,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(
                                width: 100,
                                height: 100,
                                child: Container(
                                  margin: EdgeInsets.fromLTRB(3, 3, 3, 3),
                                  child: Card(
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(4),
                                              topRight: Radius.circular(4),
                                              bottomLeft: Radius.circular(4),
                                              bottomRight: Radius.circular(4)),
                                          image: DecorationImage(
                                            image:
                                                (AssetImage("images/foto.jpg")),
                                            fit: BoxFit.cover,
                                          )),
                                    ),
                                  ),
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.67,
                                    margin: EdgeInsets.fromLTRB(7, 7, 7, 6),
                                    child: Text(
                                      snapshot.data[index].judul,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w900,
                                          fontFamily: 'TitilliumWeb'),
                                    ),
                                  ),
                                  Container(
                                    child: Row(
                                      children: <Widget>[
                                        Container(
                                          margin:
                                              EdgeInsets.fromLTRB(7, 5, 3, 0),
                                          child: Icon(
                                            Icons.star_half,
                                            color: Color(0xFFFF25116),
                                            size: 20,
                                          ),
                                        ),
                                        Container(
                                          width: 190,
                                          margin:
                                              EdgeInsets.fromLTRB(1, 5.5, 0, 0),
                                          child: Text(
                                            "Disukai: 19.000 . Size: 21 Kib",
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                fontFamily: 'TitilliumWeb',
                                                fontSize: 14,
                                                color: Color(0xFFF707070)),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
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
                    return Container(
                      margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              new MaterialPageRoute(
                                  builder: (context) =>
                                      DetailPage(snapshot.data[index])));
                        },
                        child: Card(
                          elevation: 2,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(
                                width: 100,
                                height: 100,
                                child: Container(
                                  margin: EdgeInsets.fromLTRB(3, 3, 3, 3),
                                  child: Card(
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(4),
                                              topRight: Radius.circular(4),
                                              bottomLeft: Radius.circular(4),
                                              bottomRight: Radius.circular(4)),
                                          image: DecorationImage(
                                            image:
                                                (AssetImage("images/foto.jpg")),
                                            fit: BoxFit.cover,
                                          )),
                                    ),
                                  ),
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.67,
                                    margin: EdgeInsets.fromLTRB(7, 7, 7, 6),
                                    child: Text(
                                      snapshot.data[index].judul,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w900,
                                          fontFamily: 'TitilliumWeb'),
                                    ),
                                  ),
                                  Container(
                                    child: Row(
                                      children: <Widget>[
                                        Container(
                                          margin:
                                              EdgeInsets.fromLTRB(7, 5, 3, 0),
                                          child: Icon(
                                            Icons.star_half,
                                            color: Color(0xFFFF25116),
                                            size: 20,
                                          ),
                                        ),
                                        Container(
                                          width: 190,
                                          margin:
                                              EdgeInsets.fromLTRB(1, 5.5, 0, 0),
                                          child: Text(
                                            "Disukai: 19.000 . Size: 21 Kib",
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                fontFamily: 'TitilliumWeb',
                                                fontSize: 14,
                                                color: Color(0xFFF707070)),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
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
                    return Container(
                      margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              new MaterialPageRoute(
                                  builder: (context) =>
                                      DetailPage(snapshot.data[index])));
                        },
                        child: Card(
                          elevation: 2,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(
                                width: 100,
                                height: 100,
                                child: Container(
                                  margin: EdgeInsets.fromLTRB(3, 3, 3, 3),
                                  child: Card(
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(4),
                                              topRight: Radius.circular(4),
                                              bottomLeft: Radius.circular(4),
                                              bottomRight: Radius.circular(4)),
                                          image: DecorationImage(
                                            image:
                                                (AssetImage("images/foto.jpg")),
                                            fit: BoxFit.cover,
                                          )),
                                    ),
                                  ),
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.67,
                                    margin: EdgeInsets.fromLTRB(7, 7, 7, 6),
                                    child: Text(
                                      snapshot.data[index].judul,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w900,
                                          fontFamily: 'TitilliumWeb'),
                                    ),
                                  ),
                                  Container(
                                    child: Row(
                                      children: <Widget>[
                                        Container(
                                          margin:
                                              EdgeInsets.fromLTRB(7, 5, 3, 0),
                                          child: Icon(
                                            Icons.star_half,
                                            color: Color(0xFFFF25116),
                                            size: 20,
                                          ),
                                        ),
                                        Container(
                                          width: 190,
                                          margin:
                                              EdgeInsets.fromLTRB(1, 5.5, 0, 0),
                                          child: Text(
                                            "Disukai: 19.000 . Size: 21 Kib",
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                fontFamily: 'TitilliumWeb',
                                                fontSize: 14,
                                                color: Color(0xFFF707070)),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
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
                    return Container(
                      margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              new MaterialPageRoute(
                                  builder: (context) =>
                                      DetailPage(snapshot.data[index])));
                        },
                        child: Card(
                          elevation: 2,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(
                                width: 100,
                                height: 100,
                                child: Container(
                                  margin: EdgeInsets.fromLTRB(3, 3, 3, 3),
                                  child: Card(
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(4),
                                              topRight: Radius.circular(4),
                                              bottomLeft: Radius.circular(4),
                                              bottomRight: Radius.circular(4)),
                                          image: DecorationImage(
                                            image:
                                                (AssetImage("images/foto.jpg")),
                                            fit: BoxFit.cover,
                                          )),
                                    ),
                                  ),
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.67,
                                    margin: EdgeInsets.fromLTRB(7, 7, 7, 6),
                                    child: Text(
                                      snapshot.data[index].judul,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w900,
                                          fontFamily: 'TitilliumWeb'),
                                    ),
                                  ),
                                  Container(
                                    child: Row(
                                      children: <Widget>[
                                        Container(
                                          margin:
                                              EdgeInsets.fromLTRB(7, 5, 3, 0),
                                          child: Icon(
                                            Icons.star_half,
                                            color: Color(0xFFFF25116),
                                            size: 20,
                                          ),
                                        ),
                                        Container(
                                          width: 190,
                                          margin:
                                              EdgeInsets.fromLTRB(1, 5.5, 0, 0),
                                          child: Text(
                                            "Disukai: 19.000 . Size: 21 Kib",
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                fontFamily: 'TitilliumWeb',
                                                fontSize: 14,
                                                color: Color(0xFFF707070)),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
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
                    return Container(
                      margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              new MaterialPageRoute(
                                  builder: (context) =>
                                      DetailPage(snapshot.data[index])));
                        },
                        child: Card(
                          elevation: 2,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(
                                width: 100,
                                height: 100,
                                child: Container(
                                  margin: EdgeInsets.fromLTRB(3, 3, 3, 3),
                                  child: Card(
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(4),
                                              topRight: Radius.circular(4),
                                              bottomLeft: Radius.circular(4),
                                              bottomRight: Radius.circular(4)),
                                          image: DecorationImage(
                                            image:
                                                (AssetImage("images/foto.jpg")),
                                            fit: BoxFit.cover,
                                          )),
                                    ),
                                  ),
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.67,
                                    margin: EdgeInsets.fromLTRB(7, 7, 7, 6),
                                    child: Text(
                                      snapshot.data[index].judul,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w900,
                                          fontFamily: 'TitilliumWeb'),
                                    ),
                                  ),
                                  Container(
                                    child: Row(
                                      children: <Widget>[
                                        Container(
                                          margin:
                                              EdgeInsets.fromLTRB(7, 5, 3, 0),
                                          child: Icon(
                                            Icons.star_half,
                                            color: Color(0xFFFF25116),
                                            size: 20,
                                          ),
                                        ),
                                        Container(
                                          width: 190,
                                          margin:
                                              EdgeInsets.fromLTRB(1, 5.5, 0, 0),
                                          child: Text(
                                            "Disukai: 19.000 . Size: 21 Kib",
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                                fontFamily: 'TitilliumWeb',
                                                fontSize: 14,
                                                color: Color(0xFFF707070)),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
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
