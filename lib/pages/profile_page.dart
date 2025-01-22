import 'package:flutter/material.dart';
import 'package:instagram/instagram_footer.dart';
import 'package:instagram/services/auth_service.dart';
import 'package:instagram/screens/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';
import 'package:instagram/providers/user_provider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  ProfilePageState createState() => ProfilePageState();
}

class ProfilePageState extends State<ProfilePage> {
  String selectedTab = 'Posts';
  final AuthService _authService = AuthService();

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  void _loadUserData() async {
    await Provider.of<UserProvider>(context, listen: false).refreshUser();
  }

  void _handleLogout() async {
    await _authService.signOut();
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', false);
    
    if (!mounted) return;
    
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (context) => const LoginScreen()),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<UserProvider>(
      builder: (context, userProvider, child) {
        final user = userProvider.getUser;
        
        return Scaffold(
          appBar: AppBar(
            title: Text(user?.username ?? 'Profile'),
            centerTitle: true,
            actions: [
              IconButton(
                icon: const Icon(Icons.logout),
                onPressed: _handleLogout,
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 40,
                        backgroundImage: user?.photoUrl != null && user!.photoUrl.isNotEmpty
                            ? NetworkImage(user.photoUrl) as ImageProvider
                            : const AssetImage('assets/image.png'),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                _buildStatColumn("Posts", "0"),
                                _buildStatColumn("Followers", user?.followers.length.toString() ?? "0"),
                                _buildStatColumn("Following", user?.following.length.toString() ?? "0"),
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
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        user?.bio ?? 'No bio yet',
                        style: const TextStyle(fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildTabButton('Posts', Icons.grid_on),
                    _buildTabButton('Reels', Icons.video_collection_outlined),
                    _buildTabButton('Tagged', Icons.person_outline),
                  ],
                ),
                const Divider(),
                _buildContentSection(),
              ],
            ),
          ),
          bottomNavigationBar: const InstagramFooter(),
        );
      },
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
      return _buildGridView(30);
    } else if (selectedTab == 'Reels') {
      return _buildGridView(10);
    } else if (selectedTab == 'Tagged') {
      return _buildGridView(5);
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
          color: Colors.grey[300],
        );
      },
    );
  }
}