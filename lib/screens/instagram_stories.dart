import 'package:flutter/material.dart';

class InstaGramStories extends StatelessWidget {
  const InstaGramStories({super.key});

  // Header text with "Stories" title and "Watch All" button
  Widget get topText => const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            "Stories",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Row(
            children: <Widget>[
              Icon(Icons.play_arrow),
              Text("Watch All", style: TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
        ],
      );

  // Stories section with horizontal list of avatars
  Widget get stories => Expanded(
        child: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            itemBuilder: (context, index) => Stack(
              alignment: Alignment.bottomRight,
              children: <Widget>[
                Container(
                  width: 60.0,
                  height: 60.0,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: NetworkImage(
                        "https://images.pexels.com/photos/28357744/pexels-photo-28357744/free-photo-of-bodas.jpeg",
                      ),
                    ),
                  ),
                  margin: const EdgeInsets.symmetric(horizontal: 8.0),
                ),
                if (index == 0)
                  const Positioned(
                    right: 10.0,
                    child: CircleAvatar(
                      backgroundColor: Colors.blueAccent,
                      radius: 10.0,
                      child: Icon(
                        Icons.add,
                        size: 14.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Action when the screen is tapped
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Screen Tapped!'),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            topText,
            stories,
          ],
        ),
      ),
    );
  }
}

