class DataList {
  final List<Peraturan> peraturan;

  DataList({
    this.peraturan
});

  factory DataList.fromJson(List<dynamic> parsedJson) {

    List<Peraturan> peraturan = new List<Peraturan>();
    peraturan = parsedJson.map((i)=>Peraturan.fromJson(i)).toList();

    return new DataList(
      peraturan: peraturan
    );
  }
}

class Peraturan{
  final String id;
  final String title;
  final String url;

  Peraturan({
    this.id,
    this.url,
    this.title
}) ;

  factory Peraturan.fromJson(Map<String, dynamic> json){
    return new Peraturan(
      id: json['id'].toString(),
      title: json['title'],
      url: json['json'],
    );
  }

}