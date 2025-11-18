# Nama : Ariza Nola Rufiana
# NIM ; H1D023005
## Pemmob-Tugas7 Pertemuan 9

### Ringkasan singkat

Berikut **penjelasan skrip saja** — tiap paragraf menjelaskan fungsi dan peran setiap berkas kode (tanpa instruksi menjalankan atau hal lain). Ringkas dan siap dimasukkan ke README.

`lib/main.dart`
File entry-point aplikasi. Berfungsi menyiapkan environment (mis. `WidgetsFlutterBinding.ensureInitialized()`), inisialisasi service/global dependency, lalu memanggil `runApp(MyApp())`. Di sini juga biasanya didefinisikan konfigurasi global seperti tema, localizations, dan integrasi routing utama (`MaterialApp` / `GetMaterialApp`).

`lib/routes.dart`
Berisi konstanta nama rute (string) yang digunakan di seluruh aplikasi. Menyimpan semua path rute dalam satu tempat agar navigasi konsisten dan mudah diganti tanpa menyisir banyak file.

`lib/app/controllers/login_controller.dart`
Controller yang mengatur alur login: menerima input dari UI, memanggil `AuthService.login(...)`, mengubah status loading/error, dan memutuskan tindakan setelah respons (mis. navigasi ke dashboard atau menampilkan pesan error). Controller memisahkan logika bisnis dari tampilan agar widget tetap bersih.

`lib/app/services/auth_service.dart`
Service yang menampung logika autentikasi. Di file ini ada fungsi `login()` yang melakukan validasi kredensial (saat ini lokal atau mock) dan mengelola penyimpanan token/session (mis. SharedPreferences atau secure storage) jika diperlukan. Service ini adalah titik tunggal jika nanti ingin mengganti implementasi menjadi panggilan API.

`lib/app/models/user.dart`
Model data untuk representasi pengguna (User). Biasanya berisi field seperti `id`, `name`, `email`, serta metode serialisasi `fromJson()` dan `toJson()` yang memudahkan konversi data dari/ke API.

`lib/ui/login_page.dart`
Tampilan form login: menampilkan TextField untuk username dan password, tombol login, serta penanganan validasi input dasar. Ketika tombol ditekan, page ini memanggil method pada `LoginController`. UI seharusnya tidak berisi logika autentikasi, hanya rendering dan pemanggilan controller.

`lib/ui/dashboard_page.dart`
Halaman utama setelah login sukses. Menampilkan ringkasan informasi pengguna atau fitur aplikasi yang dapat diakses. Fungsinya secara visual mengindikasikan transisi sukses dari proses autentikasi dan menjadi titik masuk untuk fitur-fitur lanjutan.

`pubspec.yaml` (bagian skrip terkait)
Meskipun bukan file kode Dart, bagian dependency di `pubspec.yaml` menentukan paket yang dipakai oleh skrip-skrip lain (mis. GetX, Dio). Versi dan plugin di file ini memengaruhi perilaku service, controller, dan widget.

`lib/ui/widgets/*` (komponen reusable)
File-file widget kecil (mis. tombol khusus, input field, card) yang dipanggil di banyak halaman. Skrip ini memfokuskan pengulangan UI agar konsisten dan meminimalkan duplikasi kode pada halaman besar.

Setiap skrip di atas didesain untuk memisahkan tanggung jawab: service untuk akses data, controller untuk logika/koordinasi, dan view untuk presentasi. Pemisahan ini membuat kode lebih mudah diuji, dirawat, dan diperluas.


<img src="https://raw.githubusercontent.com/Anora1105/Pemmob-Tugas7/main/assets/recordtugas7.gif" width="200">
