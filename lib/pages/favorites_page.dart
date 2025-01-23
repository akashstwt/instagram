import 'package:flutter/material.dart';
import 'package:instagram/instagram_footer.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search'),
        automaticallyImplyLeading: false,
      ),
      body: const Center(
        child: Text('Search Page'),
      ),
      bottomNavigationBar: const InstagramFooter(),
    );
  }
}
