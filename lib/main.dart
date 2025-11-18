import 'package:flutter/material.dart';
import 'routes.dart';
import 'services/storage_service.dart';


void main() async {
WidgetsFlutterBinding.ensureInitialized();
await StorageService.init();
final savedUser = StorageService.currentUsername;
runApp(MyApp(initialUsername: savedUser));
}


class MyApp extends StatelessWidget {
final String? initialUsername;
const MyApp({super.key, this.initialUsername});


@override
Widget build(BuildContext context) {
final pastelTheme = ThemeData(
useMaterial3: true,
colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFF8BBD0)),
scaffoldBackgroundColor: const Color(0xFFFFF9F0),
appBarTheme: const AppBarTheme(backgroundColor: Color(0xFFF8BBD0), foregroundColor: Colors.black87, elevation: 0),
);


return MaterialApp(
title: 'H1D023005_Tugas7',
theme: pastelTheme,
debugShowCheckedModeBanner: false,
initialRoute: initialUsername == null ? AppRoutes.login : AppRoutes.dashboard,
routes: AppRoutes.routes,
);
}
}