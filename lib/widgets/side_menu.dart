import 'package:flutter/material.dart';
import '../services/storage_service.dart';


class SideMenu extends StatelessWidget {
final void Function(String route) onNavigate;
const SideMenu({super.key, required this.onNavigate});


@override
Widget build(BuildContext context) {
return Drawer(
child: SafeArea(
child: Column(children: [
DrawerHeader(child: Row(children: [const CircleAvatar(radius: 30, child: Icon(Icons.person)), const SizedBox(width: 12), Expanded(child: FutureBuilder<String?>(future: Future.value(StorageService.currentUsername), builder: (context, snap) {final name = (snap.data == null || snap.data!.isEmpty) ? 'Guest' : snap.data!; return Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.center, children: [Text(name, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)), const SizedBox(height: 6), const Text('Pengguna', style: TextStyle(color: Colors.black54))]);}))])),
ListTile(leading: const Icon(Icons.dashboard), title: const Text('Dashboard'), onTap: () => onNavigate('/dashboard')),
ListTile(leading: const Icon(Icons.article), title: const Text('Artikel'), onTap: () => onNavigate('/articles')),
ListTile(leading: const Icon(Icons.settings), title: const Text('Pengaturan'), onTap: () => _openSettings(context)),
const Spacer(),
const Divider(),
ListTile(leading: const Icon(Icons.logout), title: const Text('Keluar'), onTap: () => onNavigate('/login')),
]),
),
);
}


void _openSettings(BuildContext context) {
showDialog(context: context, builder: (_) => AlertDialog(title: const Text('Pengaturan sederhana'), content: const Text('Contoh pengaturan: theme pastel (default), notifikasi (dummy).'), actions: [TextButton(onPressed: () => Navigator.pop(context), child: const Text('Tutup'))]));
}
}