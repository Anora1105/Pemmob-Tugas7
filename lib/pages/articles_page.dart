import 'package:flutter/material.dart';
import '../models/article.dart';
import 'article_detail_page.dart';
import '../widgets/side_menu.dart';


class ArticlesPage extends StatelessWidget {
const ArticlesPage({super.key});


@override
Widget build(BuildContext context) {
return Scaffold(
appBar: AppBar(title: const Text('Artikel')),
drawer: SideMenu(onNavigate: (route) {
Navigator.pop(context);
if (route == '/login') {
Navigator.pushReplacementNamed(context, '/login');
} else {
Navigator.pushNamed(context, route);
}
}),
body: ListView.builder(
padding: const EdgeInsets.all(12),
itemCount: sampleArticles.length,
itemBuilder: (context, i) {
final a = sampleArticles[i];
return Card(child: ListTile(title: Text(a.title), subtitle: Text(a.summary), onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => ArticleDetailPage(article: a)))));
},
),
);
}
}