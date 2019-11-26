class Peraturan {
  final List<Perundangan> perundangan;

  Peraturan({
    this.perundangan,
  });

  // @override
  // String toString() {
  //   return 'Peraturan{perundangan: $perundangan}';
  // }

  factory Peraturan.fromJson(List<dynamic> parsedJson) {
    List<Perundangan> perundangan = new List<Perundangan>();
    perundangan = parsedJson.map((i) => Perundangan.fromJson(i)).toList();

    return new Peraturan(perundangan: perundangan);
  }
}

class Perundangan {
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

  Perundangan(
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

  // @override
  // String toString() {
  //   return 'Perundangan{idData: $idData, tahun_pengundangan: $tahun_pengundangan,  tanggal_pengundangan: $tanggal_pengundangan, jenis: $jenis, noPeraturan: $noPeraturan, judul: $judul }';
  // }

  factory Perundangan.fromJson(Map<String, dynamic> json) {
    return new Perundangan(
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
