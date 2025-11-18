import 'package:flutter/material.dart';
import '../models/article.dart';


class ArticleDetailPage extends StatelessWidget {
final Article article;
const ArticleDetailPage({super.key, required this.article});


@override
Widget build(BuildContext context) {
return Scaffold(
appBar: AppBar(title: Text(article.title)),
body: Padding(
padding: const EdgeInsets.all(16.0),
child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
Text(article.title, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
const SizedBox(height: 8),
Text(article.summary, style: const TextStyle(fontStyle: FontStyle.italic)),
const Divider(height: 20),
Expanded(child: SingleChildScrollView(child: Text(article.content))),
]),
),
);
}
}