import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class InstaGramAccount extends StatefulWidget {
  const InstaGramAccount({Key? key}) : super(key: key);

  @override
  _InstaGramAccountState createState() => _InstaGramAccountState();
}

class _InstaGramAccountState extends State<InstaGramAccount> {
  final String _username = 'June';
  final String _bio = 'Travel | Foodie | Photographer\nLover of sunsets and beaches 🌅📸';
  String? _profileImage; // Nullable to allow changing
  final List<String> _userPosts = List.generate(
    12,
    (index) => 'https://scontent.fbkk28-1.fna.fbcdn.net/v/t39.30808-6/280410654_1216533745753391_3605025797678399048_n.jpg?_nc_cat=104&ccb=1-7&_nc_sid=f727a1&_nc_ohc=ShOFFDNyHlQQ7kNvgFETKst&_nc_ht=scontent.fbkk28-1.fna&_nc_gid=ABsnp3EbveHcXIquUXWCv_9&oh=00_AYA1-FGMO-wpXKrG1w6i0xO-Y6nN9OF39HnRpnvpCPx6bg&oe=670B1219',
  );

  final int _postCount = 50;
  final int _followerCount = 1200;
  final int _followingCount = 180;

  bool _isFollowing = false;

  // Function to toggle the follow button
  void _toggleFollow() {
    setState(() {
      _isFollowing = !_isFollowing;
    });
  }

  // Function to change the profile picture
  Future<void> _changeProfilePicture() async {
    final picker = ImagePicker();
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    
    if (pickedFile != null) {
      setState(() {
        _profileImage = pickedFile.path; // Update the profile image with the selected file
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_username, style: const TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.more_horiz, color: Colors.black),
            onPressed: () {
              // Handle more options (settings, etc.)
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Profile Image
                  GestureDetector(
                    onTap: _changeProfilePicture, // Change profile picture on tap
                    child: CircleAvatar(
                      radius: 40.0,
                      backgroundImage: _profileImage != null
                          ? FileImage(File(_profileImage!)) // Use FileImage for local images
                          : const NetworkImage('https://scontent.fbkk28-1.fna.fbcdn.net/v/t39.30808-6/280412237_1216533869086712_4069573957044234837_n.jpg?_nc_cat=103&ccb=1-7&_nc_sid=f727a1&_nc_ohc=LkJhgzBRaLgQ7kNvgHQidyi&_nc_ht=scontent.fbkk28-1.fna&_nc_gid=AyjUJXQQuFN9N7UG8HpQtiZ&oh=00_AYBFt_yEwWZr28uEM-_vzQE_6HRZTH6f-3pxhW7DJ0Bfnw&oe=670AF9DD'), // Fallback to a network image
                    ),
                  ),
                  const SizedBox(width: 20.0),
                  // User Stats (Posts, Followers, Following)
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            _buildStatColumn('Posts', _postCount),
                            _buildStatColumn('Followers', _followerCount),
                            _buildStatColumn('Following', _followingCount),
                          ],
                        ),
                        const SizedBox(height: 10.0),
                        // Follow or Edit Profile Button
                        _isFollowing
                            ? ElevatedButton(
                                onPressed: _toggleFollow,
                                style: ElevatedButton.styleFrom(
                                  foregroundColor: Colors.black, backgroundColor: Colors.grey.shade300,
                                ),
                                child: const Text('Following'),
                              )
                            : ElevatedButton(
                                onPressed: _toggleFollow,
                                style: ElevatedButton.styleFrom(
                                  foregroundColor: Colors.white, backgroundColor: Colors.blue,
                                ),
                                child: const Text('Follow'),
                              ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // Bio
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _username,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 4.0),
                        Text(_bio),
                        const SizedBox(height: 8.0),
                        // Edit Profile Button for the user (or Follow if it’s a different profile)
                        _isFollowing
                            ? OutlinedButton(
                                onPressed: () {
                                  // Handle edit profile logic
                                },
                                child: const Text('Edit Profile'),
                              )
                            : ElevatedButton(
                                onPressed: _toggleFollow,
                                child: const Text('Follow'),
                              ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20.0),
            // User Posts Grid
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, // Number of columns
                crossAxisSpacing: 4.0,
                mainAxisSpacing: 4.0,
              ),
              itemCount: _userPosts.length,
              itemBuilder: (context, index) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(8.0), // Rounded corners
                  child: Image.network(
                    _userPosts[index],
                    fit: BoxFit.cover,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  // Helper function to build user stats (Posts, Followers, Following)
  Column _buildStatColumn(String label, int count) {
    return Column(
      children: [
        Text(
          count.toString(),
          style: const TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4.0),
        Text(
          label,
          style: const TextStyle(fontSize: 14.0),
        ),
      ],
    );
  }
}

extension on ImagePicker {
  getImage({required ImageSource source}) {}
}
