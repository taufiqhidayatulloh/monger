import 'package:flutter/material.dart';
import 'package:monger/pages/detail_screen.dart';
import 'package:monger/providers/favorite_provider.dart';
import 'package:monger/providers/name_provider.dart';
import 'package:provider/provider.dart';
import 'package:monger/pages/home_page.dart';
import 'package:monger/pages/login_page.dart';
import 'package:monger/theme.dart/app_theme.dart';

void main() {
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => NameProvider()),
      ChangeNotifierProvider(create: (_) => FavoriteProvider())
    ], child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginPage(),
        '/blue': (context) => const BluePage(),
        '/homepage': (context) => const HomePage(),
        '/detail': (context) => const DetailPage(),
      },
      title: 'Flutter Demo',
      theme: AppTheme().getThemeApp(),
    );
  }
}

class BluePage extends StatelessWidget {
  const BluePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(child: Scaffold(body: Center(child: Text('Blue'))));
  }
}
