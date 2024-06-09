class Materi {
  String judul;
  String deskripsi;
  String urlVideo;
  String durasi;

  Materi({
    required this.judul,
    required this.deskripsi,
    required this.urlVideo,
    required this.durasi,
  });

  factory Materi.fromJson(Map<String, dynamic> json) {
    return Materi(
      judul: json['title'],
      deskripsi: json['description'],
      urlVideo: json['url'],
      durasi: json['duration'],
    );
  }

  @override
  String toString() {
    return '\nMateri{judul: $judul, deskripsi: $deskripsi, urlVideo: $urlVideo, durasi: $durasi}\n';
  }
}
