// lib/pages/dashboard_page.dart

import 'package:flutter/material.dart';
import '../widgets/side_menu.dart';
import '../models/article.dart';
import '../services/storage_service.dart';
import 'article_detail_page.dart';
import '../routes.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  String _username = 'User';

  @override
  void initState() {
    super.initState();
    // StorageService.currentUsername sudah tersedia setelah init() di main.dart
    _username = StorageService.currentUsername ?? 'User';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dashboard')),
      drawer: SideMenu(onNavigate: (route) {
        Navigator.pop(context);
        if (route == AppRoutes.login || route == '/login') {
          // Hapus current user lalu kembali ke login
          StorageService.clearCurrentUser().then((_) => Navigator.pushReplacementNamed(context, AppRoutes.login));
        } else {
          Navigator.pushNamed(context, route);
        }
      }),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            Text('Halo, $_username', style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  const Text('Ringkasan Aktivitas', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _statBox('Artikel', sampleArticles.length.toString()),
                      _statBox('Notifikasi', '2'),
                      _statBox('Tasks', '5'),
                    ],
                  ),
                ]),
              ),
            ),
            const SizedBox(height: 12),
            const Text('Artikel Terbaru', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
            const SizedBox(height: 8),
            // Daftar artikel (tap -> detail)
            ...sampleArticles.map((a) => GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => ArticleDetailPage(article: a)),
                  ),
                  child: Card(
                    child: ListTile(
                      leading: CircleAvatar(child: Text(a.title[0])),
                      title: Text(a.title),
                      subtitle: Text(a.summary),
                      trailing: const Icon(Icons.arrow_forward_ios, size: 14),
                    ),
                  ),
                )),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget _statBox(String label, String value) {
    return Column(
      children: [
        Text(value, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        const SizedBox(height: 4),
        Text(label),
      ],
    );
  }
}
