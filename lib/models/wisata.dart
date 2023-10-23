class WisataInfo {
  final int id, category_id;
  final String nama_tempat, alamat, deskripsi, gambar;

  WisataInfo({
    required this.id,
    required this.category_id,
    required this.nama_tempat,
    required this.alamat,
    required this.deskripsi,
    required this.gambar,
  });
}

class WisataComment {
  final String comment;
  final int user_id;

  WisataComment({required this.comment, required this.user_id});
}
