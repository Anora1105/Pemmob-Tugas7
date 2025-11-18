# Nama : Ariza Nola Rufiana
# NIM ; H1D023005
## Pemmob-Tugas7 Pertemuan 9

### Ringkasan singkat

Aplikasi Flutter untuk tugas/praktikum mata kuliah Pemrograman Mobile (Tugas 7). README ini menjelaskan struktur kode, cara menjalankan, perubahan penting yang dilakukan (termasuk perbaikan penggunaan `BuildContext` setelah `await`), konfigurasi Git terkait line endings, serta panduan kontribusi dan debugging.

### Isi / Tujuan project

* Implementasi UI & routing dasar (login, dashboard, halaman profil, dll.).
* Contoh manajemen state sederhana dan pemanggilan fungsi `async`.
* Struktur proyek mengikuti konvensi standar Flutter (multi-platform: android, ios, linux, macos, windows).

### Berkas utama dan penjelasan singkat

* `lib/main.dart` — titik masuk aplikasi. Biasanya memanggil `runApp(MyApp())` dan mendaftarkan route.
* `lib/app_routes.dart` — daftar rute / nama rute yang digunakan di aplikasi.
* Halaman UI: `lib/page/login_page.dart`, `lib/ui/dashboard_page.dart`, dsb. — tempat komponen layar ditulis.
* `pubspec.yaml` — daftar dependency, assets, dan pengaturan package.

### Perbaikan penting yang dilakukan

1. **Use of `BuildContext` after `await`**

   * Masalah: menggunakan `context` setelah `await` dapat menyebabkan crash karena widget mungkin sudah di-dispose.
   * Perbaikan yang diterapkan di kode:

     * Menambahkan pengecekan `if (!mounted) return;` setelah pemanggilan `await` di dalam `State` class.
     * Atau, mengambil dulu objek yang diperlukan dari `context` sebelum `await` (mis. `final navigator = Navigator.of(context);`).
   * Contoh pola aman (di dalam `State`):

     ```dart
     await someAsyncWork();
     if (!mounted) return;
     Navigator.of(context).push(...);
     ```
   * Jika perubahan ini ada di beberapa file (login, dashboard), commit message yang digunakan: `chore: fix BuildContext usage after async await`.

2. **Normalisasi line endings (EOL)**

   * Ditambahkan `.gitattributes` untuk memaksa file sumber menggunakan `LF` di repository dan menghindari peringatan `LF will be replaced by CRLF` saat `git add` pada Windows.
   * Perintah yang digunakan: `git add --renormalize .` kemudian commit `chore: normalize line endings`.

## Cara menjalankan (development)

1. Pastikan Flutter SDK terinstal dan path sudah di-setup. Minimal rekomendasi: Flutter 3.x atau lebih baru (sesuaikan dengan `pubspec.yaml`).
2. Install dependency:

```bash
flutter pub get
```

3. Jalankan di emulator / perangkat:

```bash
flutter run
```

4. Jika ingin menjalankan pada platform spesifik:

```bash
flutter run -d chrome       # web
flutter run -d windows      # windows
flutter run -d macos
flutter run -d linux
```

## Build release

Contoh build Android:

```bash
flutter build apk --release
```

## Git: konfigurasi yang direkomendasikan

* Tambahkan `.gitignore` (file build, IDE config, keystore) — hindari commit file sensitif.
* Tambahkan `.gitattributes` sesuai rekomendasi untuk Flutter (memaksa `*.dart`, `*.yaml`, `pubspec.lock` ke `eol=lf`).
* Jika bekerja di Windows, set `git config --global core.autocrlf true` agar Git otomatis menyesuaikan EOL saat checkout/commit.

## Troubleshooting umum

* **Peringatan LF/CRLF saat `git add`**: jalankan langkah renormalize yang dijelaskan di atas.
* **`permission denied (publickey)` saat push via SSH**: pastikan SSH key ter-generate dan sudah ditambahkan ke GitHub.
* **`rejected non-fast-forward` saat push**: lakukan `git pull --rebase origin main` lalu resolve conflict.
* **Error terkait package**: jalankan `flutter clean` lalu `flutter pub get`.

## Contributing

1. Fork repo → clone ke lokal → buat branch fitur: `git checkout -b feat/nama-fitur`.
2. Commit dengan pesan jelas (`feat:`, `fix:`, `chore:`, `docs:`).
3. Push branch ke remote → buat Pull Request.

<img src="https://raw.githubusercontent.com/Anora1105/Pemmob-Tugas7/assets/recodtugas7.gif" width="200">