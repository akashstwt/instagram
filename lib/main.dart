import 'package:flutter/material.dart';
import 'package:instagram/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:instagram/pages/home_page.dart';
import 'package:instagram/screens/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Future<bool> checkLoginStatus() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isLoggedIn') ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: checkLoginStatus(),
      builder: (context, snapshot) {
        // Show a loading screen while waiting for the result
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const MaterialApp(
            home: Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          );
        }

        // If logged in, go to HomePage; otherwise, go to LoginScreen
        final bool isLoggedIn = snapshot.data ?? false;
        return MaterialApp(
          title: 'Instagram Clone',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: isLoggedIn
              ? const MyHomePage(title: 'Home')
              : const LoginScreen(),
        );
      },
    );
  }
}
