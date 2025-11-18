class Article {
  final String id;
  final String title;
  final String summary;
  final String content;

  // const constructor memungkinkan pembuatan instance compile-time dan
  // membuat instance lebih mudah dipakai di const lists.
  const Article({
    required this.id,
    required this.title,
    required this.summary,
    required this.content,
  });

  // Konversi ke Map (berguna jika ingin simpan/transfer)
  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'summary': summary,
        'content': content,
      };

  // Buat instance dari Map/JSON
  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      id: json['id'] as String? ?? '',
      title: json['title'] as String? ?? '',
      summary: json['summary'] as String? ?? '',
      content: json['content'] as String? ?? '',
    );
  }

  @override
  String toString() => 'Article(id: $id, title: $title)';
}

// Contoh data artikel (immutable)
const sampleArticles = <Article>[
  Article(
    id: 'a1',
    title: 'Urban Farming 101',
    summary: 'Mulai berkebun di lahan sempit. Tips praktis dan hemat biaya.',
    content:
        'Urban Farming 101\n\nBerkebun di kota tidak harus mahal. Gunakan pot, kompos dari sisa dapur, dan pilih tanaman yang cepat panen. Tips tambahan: rotasi tanaman, pemupukan organik, dan pemilihan varietas cepat panen.',
  ),
  Article(
    id: 'a2',
    title: 'Pestisida Organik Buatan Sendiri',
    summary: 'Resep simpel pestisida organik untuk kebun kecil.',
    content:
        'Campurkan sabun cuci piring lembut (1 sdm) dengan 1 liter air dan beberapa tetes minyak neem atau cabai halus sebagai repelen. Semprotkan pada bagian bawah daun untuk mengurangi hama. Uji pada satu daun sebelum penyemprotan luas.',
  ),
  Article(
    id: 'a3',
    title: 'Teknik Irigasi Hemat Air',
    summary: 'Menjaga kelembapan tanah tanpa boros air.',
    content:
        'Gunakan drip irrigation sederhana atau mulsa organik untuk menahan kelembapan tanah. Penyiraman pagi atau sore lebih efisien; cek kelembapan dengan jari 2–3 cm di tanah sebelum menyiram.',
  ),
];
