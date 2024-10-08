import 'package:flutter/material.dart';
import 'package:instagram_app/screens/instagram_list.dart';

class InstaGramBody extends StatelessWidget {
  const InstaGramBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        // Expanded(flex: 1, child: new InstaStories()),
        Flexible(child: InstaGramList())
      ],
    );
  }
}