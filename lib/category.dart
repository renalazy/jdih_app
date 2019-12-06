import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:timeline_list/timeline.dart';
import 'package:timeline_list/timeline_model.dart';

void main() {
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(CategoryApp());
  });
}

class CategoryApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CategoryPage(),
    );
  }
}

class CategoryPage extends StatefulWidget {
  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    List<TimelineModel> items = [
      TimelineModel(
          Container(
            margin: EdgeInsets.only(top: 25.0, bottom: 25.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                '2001',
                style: TextStyle(
                    fontSize: 15.0,
                    fontFamily: 'TitilliumWeb',
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
          position: TimelineItemPosition.random,
          iconBackground: Colors.grey,
          icon: Icon(Icons.blur_circular)),
      TimelineModel(
          Container(
            margin: EdgeInsets.only(top: 25.0, bottom: 25.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                '2002',
                style: TextStyle(
                    fontSize: 15.0,
                    fontFamily: 'TitilliumWeb',
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
          position: TimelineItemPosition.random,
          iconBackground: Colors.grey,
          icon: Icon(Icons.blur_circular)),
      TimelineModel(
          Container(
            margin: EdgeInsets.only(top: 25.0, bottom: 25.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                '2003',
                style: TextStyle(
                    fontSize: 15.0,
                    fontFamily: 'TitilliumWeb',
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
          position: TimelineItemPosition.random,
          iconBackground: Colors.grey,
          icon: Icon(Icons.blur_circular)),
      TimelineModel(
          Container(
            margin: EdgeInsets.only(top: 25.0, bottom: 25.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                '2004',
                style: TextStyle(
                    fontSize: 15.0,
                    fontFamily: 'TitilliumWeb',
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
          position: TimelineItemPosition.random,
          iconBackground: Colors.grey,
          icon: Icon(Icons.blur_circular)),
      TimelineModel(
          Container(
            margin: EdgeInsets.only(top: 25.0, bottom: 25.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                '2005',
                style: TextStyle(
                    fontSize: 15.0,
                    fontFamily: 'TitilliumWeb',
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
          position: TimelineItemPosition.random,
          iconBackground: Colors.grey,
          icon: Icon(Icons.blur_circular)),
    ];

    var bodyContent = Column(
      children: <Widget>[
        SafeArea(
          child: Stack(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 30.0, left: 40.0),
                child: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                  size: 20.0,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 30.0, right: 40.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Icon(
                      Icons.share,
                      color: Colors.black,
                      size: 20.0,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(
          child: Text(
            'Kumpulan Peraturan\nBedasarkan Kategori',
            style: TextStyle(
                color: Colors.black,
                fontSize: 15.0,
                fontFamily: 'TitilliumWeb'),
          ),
        ),
        Container(
          child: Text(
            'TAHUN',
            style: TextStyle(
                color: Color(0xFFC85B6C),
                fontFamily: 'TitilliumWeb',
                fontSize: 15.0,
                fontWeight: FontWeight.bold),
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
        SizedBox(
          height: 30.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Container(
              height: 70.0,
              width: 70.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(width: 1.0, color: Colors.white),
                  image: DecorationImage(
                      image: ExactAssetImage('images/tematik-kategori.png'),
                      fit: BoxFit.cover),
                  color: Colors.grey),
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    child: Text(
                      'Kategori',
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12.0,
                          fontFamily: 'TitilliumWeb'),
                    ),
                  ),
                  Container(
                    child: Text(
                      'Peraturan Bupati',
                      style: TextStyle(
                          fontFamily: 'TitilliumWeb',
                          color: Colors.black,
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 10.0,
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Container(
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.star_half,
                          color: Color(0xFFF25116),
                          size: 20.0,
                        ),
                        Text(
                          '190',
                          style: TextStyle(
                              fontSize: 12.0,
                              fontFamily: 'TitilliumWeb',
                              color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Text(
                      '(190 Peraturan)',
                      style: TextStyle(
                        color: Colors.grey,
                        fontFamily: 'TitilliumWeb',
                        fontSize: 12.0,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 20.0),
        Container(
          color: Colors.grey.shade200,
          height: 300,
          width: double.infinity,
          child: Container(
            margin: EdgeInsets.only(left: 20.0),
            child: Timeline(
              children: items,
              position: TimelinePosition.Left,
            ),
          ),
        ),
        SizedBox(height: 20.0),
        Container(
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(right: 40.0),
                width: 150.0,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                    color: Color(0xFF315B8A)),
                child: FlatButton(
                  child: Text(
                    'Beri Tanggapan',
                    style: TextStyle(
                        fontSize: 15.0,
                        fontFamily: 'TitilliumWeb',
                        color: Colors.white),
                  ),
                  onPressed: () {},
                ),
              ),
            ],
          ),
        )
      ],
    );

    return Scaffold(
      body: bodyContent,
    );
  }
}
