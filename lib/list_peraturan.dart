import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'dart:convert';
import 'package:jdih_app/Peraturan.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_plugin_pdf_viewer/flutter_plugin_pdf_viewer.dart';

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
        await http.get("https://jdih.probolinggokab.go.id/integrasi2.php");

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
                  if (snapshot.data[index].singkatanJenis == "PERBUP") {
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

class DetailPage extends StatefulWidget {
  final Perundangan perundangan;

  DetailPage(this.perundangan);

  @override
  _DetailPageState createState() => _DetailPageState(perundangan);
}

class _DetailPageState extends State<DetailPage> {
  final Perundangan perundangan;
  _DetailPageState(this.perundangan);

  String assetPDFPath = "";
  String urlPDFPath = "";

  @override
  void initState() {
    super.initState();
    // getFileFromAsset("assets/mypdf.pdf").then((f) {
    //   setState(() {
    //     assetPDFPath = f.path;
    //     print(assetPDFPath);
    //   });
    // });

    getFileFromUrl(perundangan.urlDownload).then((f) {
      setState(() {
        urlPDFPath = f.path;
        print(urlPDFPath);
      });
    });
  }

  // Future<File> getFileFromAsset(String asset) async {
  //   try {
  //     var data = await rootBundle.load(asset);
  //     var bytes = data.buffer.asUint8List();
  //     var dir = await getApplicationDocumentsDirectory();
  //     File file = File("${dir.path}/mypdf.pdf");

  //     File assetFile = await file.writeAsBytes(bytes);
  //     return assetFile;
  //   } catch (e) {
  //     throw Exception("Error opening asset file");
  //   }
  // }

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

class PdfViewPage extends StatefulWidget {
  final String path;

  const PdfViewPage({Key key, this.path}) : super(key: key);
  @override
  _PdfViewPageState createState() => _PdfViewPageState();
}

class _PdfViewPageState extends State<PdfViewPage> {
  int _totalPages = 0;
  int _currentPage = 0;
  bool pdfReady = false;
  PDFViewController _pdfViewController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFF038C7F),
        title: Text("Peraturan PDF"),
      ),
      body: Stack(
        children: <Widget>[
          PDFView(
            filePath: widget.path,
            autoSpacing: true,
            enableSwipe: true,
            pageSnap: true,
            swipeHorizontal: true,
            nightMode: false,
            onError: (e) {
              print(e);
            },
            onRender: (_pages) {
              setState(() {
                _totalPages = _pages;
                pdfReady = true;
              });
            },
            onViewCreated: (PDFViewController vc) {
              _pdfViewController = vc;
            },
            onPageChanged: (int page, int total) {
              setState(() {});
            },
            onPageError: (page, e) {},
          ),
          !pdfReady
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Offstage()
        ],
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          _currentPage > 0
              ? FloatingActionButton.extended(
                  backgroundColor: Colors.red,
                  label: Text("Go to ${_currentPage - 1}"),
                  onPressed: () {
                    _currentPage -= 1;
                    _pdfViewController.setPage(_currentPage);
                  },
                )
              : Offstage(),
          _currentPage + 1 < _totalPages
              ? FloatingActionButton.extended(
                  backgroundColor: Colors.green,
                  label: Text("Go to ${_currentPage + 1}"),
                  onPressed: () {
                    _currentPage += 1;
                    _pdfViewController.setPage(_currentPage);
                  },
                )
              : Offstage(),
        ],
      ),
    );
  }
}

// class DetailPage extends StatelessWidget {
//   final Perundangan perundangan;

//   DetailPage(this.perundangan);

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
