import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'dart:convert';
import 'package:url_launcher/url_launcher.dart';
import 'list_peraturan.dart';

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
  List<Posts> _list = [];
  List<Posts> _search = [];
  var loading = false;
  Future fetchData() async {
    setState(() {
      loading = true;
    });
    _list.clear();
    final response =
        await http.get("http://jdih.probolinggokab.go.id/integrasi2.php");
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      setState(() {
        for (Map i in data) {
          _list.add(Posts.formJson(i));
          loading = false;
        }
      });
    }
  }

  TextEditingController controller = new TextEditingController();

  onSearch(String text) async {
    _search.clear();
    if (text.isEmpty) {
      setState(() {});
      return;
    }

    _list.forEach((f) {
      if (f.judul.toLowerCase().contains(text) ||
          f.idData.toString().contains(text)) _search.add(f);
    });

    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }

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
        margin: EdgeInsets.all(5),
        child: Column(
          children: <Widget>[
            Theme(
              data: Theme.of(context).copyWith(
                primaryColor: Color(0xFF038C7F),
                cursorColor: Color(0xFF038C7F),
              ),
              child: Container(
                margin: EdgeInsets.all(5),
                child: TextField(
                  controller: controller,
                  onChanged: onSearch,
                  decoration: InputDecoration(
                    hintText: 'Input Keyword',
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 15.0,
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0xFF038C7F), width: 2.0),
                        borderRadius: BorderRadius.circular(20.0)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                    prefixIcon: Icon(Icons.search),
                  ),
                ),
              ),
            ),
            loading
                ? Container(
                    margin: EdgeInsets.fromLTRB(0, 100, 0, 0),
                    child: CircularProgressIndicator(),
                  )
                : Expanded(
                    child: _search.length != 0 || controller.text.isNotEmpty
                        ? ListView.builder(
                            itemCount: _search.length,
                            itemBuilder: (context, i) {
                              final b = _search[i];
                              // return Container(
                              //   margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                              //   child: Card(
                              //     child: ListTile(
                              //       leading: CircleAvatar(
                              //         backgroundImage:
                              //             AssetImage("images/foto.jpg"),
                              //       ),
                              //       title: Text(
                              //         b.judul,
                              //         style: TextStyle(
                              //             fontWeight: FontWeight.w700),
                              //       ),
                              //       subtitle: Container(
                              //           margin: EdgeInsets.only(top: 5),
                              //           child: Text(
                              //             b.jenis,
                              //             style: TextStyle(
                              //                 color: Color(0xFFFE7568),
                              //                 fontWeight: FontWeight.w700),
                              //           )),
                              //       onTap: () {
                              //         Navigator.push(
                              //             context,
                              //             new MaterialPageRoute(
                              //                 builder: (context) =>
                              //                     DetailPage2(_search[i])));
                              //       },
                              //     ),
                              //   ),
                              // );
                              return Container(
                                margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        new MaterialPageRoute(
                                            builder: (context) =>
                                                DetailPage2(_search[i])));
                                  },
                                  child: Card(
                                    elevation: 2,
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        SizedBox(
                                          width: 100,
                                          height: 100,
                                          child: Container(
                                            margin:
                                                EdgeInsets.fromLTRB(3, 3, 3, 3),
                                            child: Card(
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            topLeft:
                                                                Radius.circular(
                                                                    4),
                                                            topRight:
                                                                Radius.circular(
                                                                    4),
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    4),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    4)),
                                                    image: DecorationImage(
                                                      image: (AssetImage(
                                                          "images/foto.jpg")),
                                                      fit: BoxFit.cover,
                                                    )),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.67,
                                              margin: EdgeInsets.fromLTRB(
                                                  7, 7, 7, 6),
                                              child: Text(
                                                b.judul,
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
                                                    margin: EdgeInsets.fromLTRB(
                                                        7, 5, 3, 0),
                                                    child: Icon(
                                                      Icons.star_half,
                                                      color: Color(0xFFFF25116),
                                                      size: 20,
                                                    ),
                                                  ),
                                                  Container(
                                                    width: 190,
                                                    margin: EdgeInsets.fromLTRB(
                                                        1, 5.5, 0, 0),
                                                    child: Text(
                                                      "Disukai: 19.000 . Size: 21 Kib",
                                                      maxLines: 1,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: TextStyle(
                                                          fontFamily:
                                                              'TitilliumWeb',
                                                          fontSize: 14,
                                                          color: Color(
                                                              0xFFF707070)),
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
                            },
                          )
                        : ListView.builder(
                            itemCount: _list.length,
                            itemBuilder: (context, i) {
                              final a = _list[i];
                              // return Container(
                              //   margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                              //   child: Card(
                              //     child: ListTile(
                              //       leading: CircleAvatar(
                              //         backgroundImage:
                              //             AssetImage("images/foto.jpg"),
                              //       ),
                              //       title: Text(
                              //         a.judul,
                              //         style: TextStyle(
                              //             fontWeight: FontWeight.w700),
                              //       ),
                              //       subtitle: Container(
                              //           margin: EdgeInsets.only(top: 5),
                              //           child: Text(
                              //             a.jenis,
                              //             style: TextStyle(
                              //                 color: Color(0xFFFE7568),
                              //                 fontWeight: FontWeight.w700),
                              //           )),
                              //       onTap: () {
                              //         Navigator.push(
                              //             context,
                              //             new MaterialPageRoute(
                              //                 builder: (context) =>
                              //                     DetailPage2(_list[i])));
                              //       },
                              //     ),
                              //   ),
                              // );
                              return Container(
                                margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        new MaterialPageRoute(
                                            builder: (context) =>
                                                DetailPage2(_list[i])));
                                  },
                                  child: Card(
                                    elevation: 2,
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        SizedBox(
                                          width: 100,
                                          height: 100,
                                          child: Container(
                                            margin:
                                                EdgeInsets.fromLTRB(3, 3, 3, 3),
                                            child: Card(
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.only(
                                                            topLeft:
                                                                Radius.circular(
                                                                    4),
                                                            topRight:
                                                                Radius.circular(
                                                                    4),
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    4),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    4)),
                                                    image: DecorationImage(
                                                      image: (AssetImage(
                                                          "images/foto.jpg")),
                                                      fit: BoxFit.cover,
                                                    )),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.67,
                                              margin: EdgeInsets.fromLTRB(
                                                  7, 7, 7, 6),
                                              child: Text(
                                                a.judul,
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
                                                    margin: EdgeInsets.fromLTRB(
                                                        7, 5, 3, 0),
                                                    child: Icon(
                                                      Icons.star_half,
                                                      color: Color(0xFFFF25116),
                                                      size: 20,
                                                    ),
                                                  ),
                                                  Container(
                                                    width: 190,
                                                    margin: EdgeInsets.fromLTRB(
                                                        1, 5.5, 0, 0),
                                                    child: Text(
                                                      "Disukai: 19.000 . Size: 21 Kib",
                                                      maxLines: 1,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: TextStyle(
                                                          fontFamily:
                                                              'TitilliumWeb',
                                                          fontSize: 14,
                                                          color: Color(
                                                              0xFFF707070)),
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
                            },
                          ),
                  ),
          ],
        ),
      ),
    );
  }
}

class Posts {
  final int idData;
  final int tahun_pengundangan;
  final String tanggal_pengundangan;
  final String jenis;
  final int noPeraturan;
  final String judul;
  final String singkatanJenis;
  final String bahasa;
  final String teuBadan;
  final String fileDownload;
  final String urlDownload;

  Posts(
      {this.idData,
      this.tahun_pengundangan,
      this.tanggal_pengundangan,
      this.jenis,
      this.noPeraturan,
      this.judul,
      this.singkatanJenis,
      this.bahasa,
      this.teuBadan,
      this.fileDownload,
      this.urlDownload});

  factory Posts.formJson(Map<String, dynamic> json) {
    return new Posts(
      idData: json['idData'],
      tahun_pengundangan: json['tahun_pengundangan'],
      tanggal_pengundangan: json['tanggal_pengundangan'],
      jenis: json['jenis'],
      noPeraturan: json['noPeraturan'],
      judul: json['judul'],
      singkatanJenis: json['singkatanJenis'],
      bahasa: json['bahasa'],
      teuBadan: json['teuBadan'],
      fileDownload: json['fileDownload'],
      urlDownload: json['urlDownload'],
    );
  }
}

class DetailPage2 extends StatefulWidget {
  final Posts perundangan;
  DetailPage2(this.perundangan);

  @override
  _DetailPage2State createState() => _DetailPage2State(perundangan);
}

class _DetailPage2State extends State<DetailPage2> {
  final Posts perundangan;
  _DetailPage2State(this.perundangan);

  String assetPDFPath = "";
  String urlPDFPath = "";

  @override
  void initState() {
    super.initState();

    getFileFromUrl(perundangan.urlDownload).then((f) {
      setState(() {
        urlPDFPath = f.path;
        print(urlPDFPath);
      });
    });
  }

  Future<File> getFileFromUrl(String url) async {
    try {
      var data = await http.get(url);
      var bytes = data.bodyBytes;
      var dir = await getApplicationDocumentsDirectory();
      File file = File("${dir.path}/mypdfonline.pdf");

      File urlFile = await file.writeAsBytes(bytes);
      return urlFile;
    } catch (e) {
      throw Exception("Error opening url file");
    }
  }

  _launchURL() async {
    String url = perundangan.urlDownload;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

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
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                    ),
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
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.4,
              height: 50,
              child: Container(
                child: Material(
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(100),
                    splashColor: Colors.amber,
                    onTap: () {
                      if (urlPDFPath != null) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    PdfViewPage(path: urlPDFPath)));
                      }
                    },
                    child: Center(
                      child: Text(
                        "Lhat Peraturan",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    gradient: LinearGradient(
                        colors: [Color(0xFFFFCCA6C), Color(0xFFFFCCA6C)],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter)),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.4,
              height: 50,
              child: Container(
                child: Material(
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(100),
                    splashColor: Colors.blue,
                    onTap: () {
                      _launchURL();
                    },
                    child: Center(
                      child: Text(
                        "Unduh Peraturan",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    gradient: LinearGradient(
                        colors: [Color(0xFFF315B8A), Color(0xFFF315B8A)],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter)),
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

// class DetailPage2 extends StatelessWidget {
//   final Posts perundangan;

//   DetailPage2(this.perundangan);

//   _launchURL() async {
//     String url = perundangan.urlDownload;
//     if (await canLaunch(url)) {
//       await launch(url);
//     } else {
//       throw 'Could not launch $url';
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: SingleChildScrollView(
//             child: Column(
//       children: <Widget>[
//         Container(
//           child: Stack(
//             children: <Widget>[
//               Container(
//                 child: Image(
//                   image: AssetImage('images/perda.jpg'),
//                   height: 265.0,
//                   fit: BoxFit.cover,
//                 ),
//               ),
//               SafeArea(
//                 child: Container(
//                   margin: EdgeInsets.only(top: 20.0, left: 20.0),
//                   child: GestureDetector(
//                     onTap: () {
//                       Navigator.pop(context);
//                     },
//                     child: Icon(
//                       Icons.arrow_back_ios,
//                       color: Colors.white,
//                     ),
//                   ),
//                 ),
//               ),
//               SafeArea(
//                 child: Container(
//                   margin: EdgeInsets.only(top: 20.0, right: 20.0),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     children: <Widget>[
//                       Icon(Icons.lock, color: Colors.white),
//                       SizedBox(width: 30.0),
//                       Icon(Icons.share, color: Colors.white)
//                     ],
//                   ),
//                 ),
//               ),
//               Container(
//                 margin: EdgeInsets.only(top: 200.0, right: 30.0),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   children: <Widget>[
//                     FloatingActionButton(
//                       backgroundColor: Color(0xFFC85B6C),
//                       elevation: 0,
//                       child: Icon(Icons.tv, color: Colors.white),
//                       onPressed: () {},
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//         SizedBox(height: 20.0),
//         Container(
//           margin: EdgeInsets.only(left: 30.0),
//           child: Column(
//             children: <Widget>[
//               Align(
//                 alignment: Alignment.centerLeft,
//                 child: Text(
//                   perundangan.singkatanJenis,
//                   style: TextStyle(
//                     fontFamily: 'TitilliumWeb',
//                     fontSize: 12.0,
//                     fontWeight: FontWeight.bold,
//                     color: Color(0xFFFE7568),
//                   ),
//                 ),
//               ),
//               Align(
//                 alignment: Alignment.centerLeft,
//                 child: Text(
//                   perundangan.judul,
//                   style: TextStyle(
//                     fontFamily: 'TitilliumWeb',
//                     fontSize: 12.0,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.black,
//                   ),
//                 ),
//               ),
//               SizedBox(height: 10.0),
//               Align(
//                 alignment: Alignment.centerLeft,
//                 child: Text(
//                   'Disukai: 19.000 Size: 21 Kib',
//                   style: TextStyle(
//                     fontFamily: 'TitilliumWeb',
//                     fontSize: 12.0,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.grey,
//                   ),
//                 ),
//               ),
//               Row(
//                 children: <Widget>[
//                   Icon(
//                     Icons.cloud_circle,
//                     color: Color(0xFF038C7F),
//                     size: 20.0,
//                   ),
//                   Icon(
//                     Icons.cloud_circle,
//                     color: Color(0xFF038C7F),
//                     size: 20.0,
//                   ),
//                   Icon(
//                     Icons.cloud_circle,
//                     color: Color(0xFF038C7F),
//                     size: 20.0,
//                   ),
//                   Icon(
//                     Icons.cloud_circle,
//                     color: Color(0xFF038C7F),
//                     size: 20.0,
//                   ),
//                   Icon(
//                     Icons.cloud_circle,
//                     color: Colors.grey,
//                     size: 20.0,
//                   ),
//                   SizedBox(width: 5.0),
//                   Text(
//                     '190 review',
//                     style: TextStyle(
//                         fontSize: 12.0,
//                         fontFamily: 'TitilliumWeb',
//                         color: Colors.grey),
//                   )
//                 ],
//               )
//             ],
//           ),
//         ),
//         SizedBox(height: 20.0),
//         Transform.rotate(
//           angle: -3.14 / 30,
//           child: Divider(
//             color: Colors.black,
//             height: 2.0,
//             thickness: 1.0,
//           ),
//         ),
//         SizedBox(height: 50.0),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: <Widget>[
//             SizedBox(
//               width: MediaQuery.of(context).size.width * 0.4,
//               height: 50,
//               child: Container(
//                 child: Material(
//                   borderRadius: BorderRadius.circular(100),
//                   color: Colors.transparent,
//                   child: InkWell(
//                     borderRadius: BorderRadius.circular(100),
//                     splashColor: Colors.amber,
//                     onTap: () {
//                       _launchURL();
//                     },
//                     child: Center(
//                       child: Text(
//                         "Lhat Peraturan",
//                         style: TextStyle(
//                             color: Colors.white, fontWeight: FontWeight.w700),
//                       ),
//                     ),
//                   ),
//                 ),
//                 decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(100),
//                     gradient: LinearGradient(
//                         colors: [Color(0xFFFFCCA6C), Color(0xFFFFCCA6C)],
//                         begin: Alignment.topCenter,
//                         end: Alignment.bottomCenter)),
//               ),
//             ),
//             SizedBox(
//               width: MediaQuery.of(context).size.width * 0.4,
//               height: 50,
//               child: Container(
//                 child: Material(
//                   borderRadius: BorderRadius.circular(100),
//                   color: Colors.transparent,
//                   child: InkWell(
//                     borderRadius: BorderRadius.circular(100),
//                     splashColor: Colors.blue,
//                     onTap: () {
//                       _launchURL();
//                     },
//                     child: Center(
//                       child: Text(
//                         "Unduh Peraturan",
//                         style: TextStyle(
//                             color: Colors.white, fontWeight: FontWeight.w700),
//                       ),
//                     ),
//                   ),
//                 ),
//                 decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(100),
//                     gradient: LinearGradient(
//                         colors: [Color(0xFFF315B8A), Color(0xFFF315B8A)],
//                         begin: Alignment.topCenter,
//                         end: Alignment.bottomCenter)),
//               ),
//             ),
//           ],
//         ),
//         SizedBox(height: 20.0),
//         Container(
//           color: Colors.grey.shade200,
//           padding: EdgeInsets.symmetric(vertical: 2.5),
//           child: Card(
//             child: ListTile(
//               leading: FloatingActionButton(
//                 heroTag: "btn2",
//                 elevation: 0,
//                 mini: true,
//                 backgroundColor: Color(0xFFFE7568),
//                 child: Icon(Icons.bookmark, color: Colors.white, size: 30.0),
//                 onPressed: () {},
//               ),
//               title: Text(
//                 'Kunjungi Website JDIH',
//                 style: TextStyle(
//                   fontFamily: 'TitilliumWeb',
//                   fontSize: 12.0,
//                   fontWeight: FontWeight.bold,
//                   color: Color(0xFF038C7F),
//                 ),
//               ),
//               subtitle: Text(
//                 'jdih.probolinggo.go.id',
//                 style: TextStyle(
//                     fontSize: 12.0,
//                     fontFamily: 'Titilliumweb',
//                     color: Colors.grey),
//               ),
//             ),
//           ),
//         ),
//         Container(
//           color: Colors.grey.shade200,
//           padding: EdgeInsets.symmetric(vertical: 2.5),
//           child: Card(
//             child: ListTile(
//               leading: FloatingActionButton(
//                 heroTag: "btn1",
//                 elevation: 0,
//                 backgroundColor: Color(0xFF038C7F),
//                 mini: true,
//                 child: Icon(
//                   Icons.message,
//                   color: Colors.white,
//                 ),
//                 onPressed: () {},
//               ),
//               title: Text(
//                 'Beri Review',
//                 style: TextStyle(
//                   fontFamily: 'TitilliumWeb',
//                   fontSize: 12.0,
//                   fontWeight: FontWeight.bold,
//                   color: Color(0xFF038C7F),
//                 ),
//               ),
//               subtitle: Text(
//                 'Review anda mendukung pelayanan kami',
//                 style: TextStyle(
//                     fontSize: 12.0,
//                     fontFamily: 'Titilliumweb',
//                     color: Colors.grey),
//               ),
//             ),
//           ),
//         ),
//       ],
//     )));
//   }
// }
