import 'package:flutter/material.dart';
import 'pages/login_page.dart';
import 'pages/register_page.dart';
import 'pages/dashboard_page.dart';
import 'pages/articles_page.dart';
import 'pages/article_detail_page.dart';
import 'models/article.dart';

class AppRoutes {
  static const login = '/login';
  static const register = '/register';
  static const dashboard = '/dashboard';
  static const articles = '/articles';
  static const articleDetail = '/articles/detail';

  static Map<String, WidgetBuilder> get routes => {
        login: (c) => const LoginPage(),
        register: (c) => const RegisterPage(),
        dashboard: (c) => const DashboardPage(),
        articles: (c) => const ArticlesPage(),
      };

  // Call this in MaterialApp as `onGenerateRoute: AppRoutes.onGenerateRoute`
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    if (settings.name == articleDetail) {
      final args = settings.arguments;
      if (args is Article) {
        return MaterialPageRoute(
          builder: (_) => ArticleDetailPage(article: args),
          settings: settings,
        );
      }
      // fallback: route exists but args wrong
      return MaterialPageRoute(builder: (_) => const Scaffold(body: Center(child: Text('Artikel tidak ditemukan'))));
    }
    return null; // use routes map for other routes
  }
}
