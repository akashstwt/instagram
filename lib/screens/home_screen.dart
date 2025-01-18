import 'package:flutter/material.dart';
import 'package:instagram/services/auth_service.dart';
import 'package:instagram/screens/login_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void signOut(BuildContext context) async {
    await AuthService().signOut();
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => const LoginScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Instagram Clone'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => signOut(context),
          ),
        ],
      ),
      body: const Center(
        child: Text('Home Screen - More features coming soon!'),
      ),
    );
  }
}