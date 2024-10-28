import 'package:flutter/material.dart';
import 'package:instagram/instagram_footer.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // int _counter = 0;

  // void _incrementCounter() {
  //   setState(() {
  //     _counter++;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.black,
                    width: 1,
                  ),
                ),
              ),
              height: 100,
              width: double.infinity,
              child: Center(
                child: SizedBox(
                  height: 80,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Column(
                          children: [
                            const CircleAvatar(
                              radius: 30,
                              backgroundColor: Color.fromARGB(255, 7, 238, 76),
                              child: CircleAvatar(
                                radius: 28,
                                backgroundImage: NetworkImage(
                                  'https://via.placeholder.com/150/FF5733/FFFFFF?text=Story',
                                ),
                              ),
                            ),
                            const SizedBox(height: 1),
                            Text(
                              'User ${index + 1}', // Display username or any text
                              style: const TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
            // const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      ListTile(
                        leading: const CircleAvatar(
                          radius: 20,
                          backgroundImage: NetworkImage(
                            'https://via.placeholder.com/150/FF5733/FFFFFF?text=Story',
                          ),
                        ),
                        title: Text('User ${index + 1}'),
                        subtitle: const Text('This is a post'),
                        trailing: IconButton(
                          icon: const Icon(Icons.more_vert),
                          onPressed: () {},
                        ),
                      ),
                      Image.network(
                        'https://via.placeholder.com/150/FF5733/FFFFFF?text=Story',
                        height: 200,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                      Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.favorite_border),
                            onPressed: () {},
                          ),
                          IconButton(
                            icon: const Icon(Icons.comment),
                            onPressed: () {},
                          ),
                          IconButton(
                            icon: const Icon(Icons.share),
                            onPressed: () {},
                          ),
                        ],
                      ),
                      const Divider(),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
        bottomNavigationBar: const InstagramFooter(),
      ),
    );
  }
}
