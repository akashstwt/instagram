import 'package:flutter/material.dart';
import 'package:instagram/pages/home_page.dart';
import 'package:instagram/pages/search_page.dart';
import 'package:instagram/pages/add_page.dart';
import 'package:instagram/pages/favorites_page.dart';
import 'package:instagram/pages/profile_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Instagram Clone',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: {
        '/': (context) => const MyHomePage(title: 'Home'),
        '/home': (context) => const MyHomePage(title: 'Home'),
        '/search': (context) => const SearchPage(),
        '/add': (context) => const AddPage(),
        '/favorites': (context) => const FavoritesPage(),
        '/profile': (context) => const ProfilePage(),
      },
      initialRoute: '/',
    );
  }
}
