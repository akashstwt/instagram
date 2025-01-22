import 'package:flutter/material.dart';

class ExplorePage extends StatelessWidget {
    ExplorePage({super.key});
  
  final List<String> exploreImages = [
    'assets/image.png',
    'assets/image.png',
    'assets/image.png',
    'assets/image.png',
    'assets/image.png',
    'assets/image.png',
    'assets/image.png',
    'assets/image.png',
    'assets/image.png',
    'assets/image.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Explore'),
        centerTitle: true,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(8.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, // 3 columns
          crossAxisSpacing: 4.0,
          mainAxisSpacing: 4.0,
        ),
        itemCount: exploreImages.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PostDetailPage(imagePath: exploreImages[index]),
                ),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(exploreImages[index]),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
          );
        },
      ),
    );
  }
}

// Post Detail Page
class PostDetailPage extends StatelessWidget {
  final String imagePath;

  const PostDetailPage({super.key, required this.imagePath});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Post Details'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(imagePath, fit: BoxFit.cover),
            const SizedBox(height: 16),
            const Text('Post Description', style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
