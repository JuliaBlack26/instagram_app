import 'package:flutter/material.dart';
import 'package:instagram_app/screens/instagram_body.dart';
import 'package:instagram_app/screens/instagram_search.dart';
import 'package:instagram_app/screens/instagram_addpost.dart';
import 'package:instagram_app/screens/instagram_reels.dart';
import 'package:instagram_app/screens/instagram_account.dart';

class InstaGramHome extends StatefulWidget {
  const InstaGramHome({super.key});

  @override
  _InstaGramHomeState createState() => _InstaGramHomeState();
}

class _InstaGramHomeState extends State<InstaGramHome> {
  int _currentIndex = 0; // Current index of the bottom navigation

  // List of screens for the bottom navigation
  final List<Widget> _screens = [
    const InstaGramBody(),          // Home screen
    const InstaGramSearch(),        // Search screen
    const InstaGramAddPost(),       // Add Post screen
    const InstaGramReels(),         // Reels screen
    const InstaGramAccount(),       // Account screen
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final topBar = AppBar(
      backgroundColor: const Color(0xfff8faf8),
      centerTitle: true,
      elevation: 1.0,
      leading: const Icon(Icons.camera_alt),
      title: SizedBox(
        height: 35.0,
        child: Image.asset("assets/images/insta_logo.png"),
      ),
      actions: const <Widget>[
        Padding(
          padding: EdgeInsets.only(right: 12.0),
          child: Icon(Icons.send),
        )
      ],
    );

    return Scaffold(
      appBar: topBar,
      body: _screens[_currentIndex], // Show the current screen
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: const Icon(Icons.home),
              onPressed: () => _onItemTapped(0), // Home screen
            ),
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                Navigator.push(context,
                MaterialPageRoute(builder: (context) => const InstaGramSearch()),);
              },
               // Search screen
            ),
            IconButton(
              icon: const Icon(Icons.add_box),
              onPressed: () {
                // Navigate to the Add Post screen
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const InstaGramAddPost(),
                  ),
                ).then((_) {
                  // After returning, go back to the home screen
                  _onItemTapped(0);
                });
              },
            ),
            IconButton(
              icon: const Icon(Icons.video_label), // Icon for Reels
              onPressed: () => _onItemTapped(3), // Navigate to Reels screen
            ),
            IconButton(
              icon: const Icon(Icons.account_box),
              onPressed: () => _onItemTapped(4), // Account screen
            ),
          ],
        ),
      ),
    );
  }
}




