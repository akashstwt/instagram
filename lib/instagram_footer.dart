import 'package:flutter/material.dart';

class InstagramFooter extends StatelessWidget {
  const InstagramFooter({super.key});

  void _navigate(BuildContext context, String route) {
    Navigator.pushNamed(context, route);
  }

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      height: 70,
      color: Colors.grey.shade400,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: const Icon(Icons.home, size: 32),
              onPressed: () => _navigate(context, '/home'),
            ),
            IconButton(
              icon: const Icon(Icons.search, size: 32),
              onPressed: () => _navigate(context, '/search'),
            ),
            IconButton(
              icon: const Icon(Icons.add_box, size: 32),
              onPressed: () => _navigate(context, '/add'),
            ),
            IconButton(
              icon: const Icon(Icons.favorite_border, size: 32),
              onPressed: () => _navigate(context, '/favorites'),
            ),
            IconButton(
              icon: const Icon(Icons.account_circle, size: 32),
              onPressed: () => _navigate(context, '/profile'),
            ),
          ],
        ),
      ),
    );
  }
}