import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
    const ProfilePage({super.key});

  @override
  ProfilePageState createState() => ProfilePageState();
}

class ProfilePageState extends State<ProfilePage> {
  String selectedTab = 'Posts'; // Default tab

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Username'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Profile Header
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage('assets/profile_pic.jpg'), // Replace with your image
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            _buildStatColumn("Posts", "42"),
                            _buildStatColumn("Followers", "2.1K"),
                            _buildStatColumn("Following", "180"),
                          ],
                        ),
                        const SizedBox(height: 8),
                        ElevatedButton(
                          onPressed: () {},
                          child: const Text("Edit Profile"),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // Bio Section
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Bio goes here...',
                    style: TextStyle(fontWeight: FontWeight.w400),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Link: yourwebsite.com',
                    style: TextStyle(color: Colors.blue),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            // Tabs Section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildTabButton('Posts', Icons.grid_on),
                _buildTabButton('Reels', Icons.video_collection_outlined),
                _buildTabButton('Tagged', Icons.person_outline),
              ],
            ),
            const Divider(),
            // Dynamic Content Section
            _buildContentSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildStatColumn(String label, String count) {
    return Column(
      children: [
        Text(
          count,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Text(label),
      ],
    );
  }

  Widget _buildTabButton(String tabName, IconData icon) {
    return TextButton.icon(
      onPressed: () {
        setState(() {
          selectedTab = tabName;
        });
      },
      icon: Icon(icon, color: selectedTab == tabName ? Colors.blue : Colors.grey),
      label: Text(
        tabName,
        style: TextStyle(
          color: selectedTab == tabName ? Colors.blue : Colors.grey,
        ),
      ),
    );
  }

  Widget _buildContentSection() {
    if (selectedTab == 'Posts') {
      return _buildGridView(30); // Replace with your posts data
    } else if (selectedTab == 'Reels') {
      return _buildGridView(10); // Replace with your reels data
    } else if (selectedTab == 'Tagged') {
      return _buildGridView(5); // Replace with your tagged posts data
    } else {
      return const SizedBox.shrink();
    }
  }

  Widget _buildGridView(int itemCount) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 4.0,
        mainAxisSpacing: 4.0,
      ),
      itemCount: itemCount,
      itemBuilder: (context, index) {
        return Container(
          color: Colors.grey[300], // Placeholder for images/videos
        );
      },
    );
  }
}
