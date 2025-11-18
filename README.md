<img width="386" height="852" alt="Screenshot 2025-11-18 203859" src="https://github.com/user-attachments/assets/3b09f640-0c80-4d8b-97ec-ca9bc26ab701" /># Nama : Ariza Nola Rufiana
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

#<img width="350" height="600" alt="Screenshot 2025-11-18 203802" src="https://github.com/user-attachments/assets/1cadeaf2-34eb-4e09-9743-60225ead221f" />
<img width="350" height="600" alt="Screenshot 2025-11-18 203827" src="https://github.com/user-attachments/assets/948569ae-406e-405e-8798-bc56e6887d9b" />
<img width="350" height="600" alt="Screenshot 2025-11-18 203859" src="https://github.com/user-attachments/assets/735d7758-389e-4581-9197-38f605e3bf22" />
<img width="350" height="600" alt="Screenshot 2025-11-18 203934" src="https://github.com/user-attachments/assets/b41ca7b8-4a2d-48a9-b405-239d5bc0d6cc" />
<img width="350" height="600" alt="Screenshot 2025-11-18 203948" src="https://github.com/user-attachments/assets/7f34b5ce-9ffd-4e3a-bbdb-d50ffbda0d54" />
<img width="350" height="600" alt="Screenshot 2025-11-18 204222" src="https://github.com/user-attachments/assets/7d1a7e5e-da16-4e36-a716-59ff513cd702" />
