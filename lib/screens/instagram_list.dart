import 'package:flutter/material.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';
import 'package:instagram_app/screens/instagram_stories.dart';

class InstaGramList extends StatefulWidget {
  const InstaGramList({super.key});

  @override
  _InstaGramListState createState() => _InstaGramListState();
}

class _InstaGramListState extends State<InstaGramList> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    var deviceSize = MediaQuery.of(context).size;
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) => index == 0
          ? SizedBox(
              height: deviceSize.height * 0.15,
              child: const InstaGramStories(),
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(16.0, 16.0, 8.0, 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Container(
                            height: 40.0,
                            width: 40.0,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: NetworkImage(
                                      "https://scontent.fbkk28-1.fna.fbcdn.net/v/t39.30808-6/280797287_3084720091790858_3337698876602462212_n.jpg?_nc_cat=107&ccb=1-7&_nc_sid=833d8c&_nc_ohc=d5HXKQwiJ6cQ7kNvgGJZSeG&_nc_ht=scontent.fbkk28-1.fna&_nc_gid=ALEO0bvz_00smchWQ03fgMV&oh=00_AYCuT_Uiu8zTu2nH-R9-ApBPspdOdzXz6NRAjQui9Yc8Kg&oe=670B01EF")),
                            ),
                          ),
                          const SizedBox(
                            width: 10.0,
                          ),
                          const Text(
                            "June",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      const IconButton(
                        icon: Icon(Icons.more_vert),
                        onPressed: null,
                      )
                    ],
                  ),
                ),
                Flexible(
                  fit: FlexFit.loose,
                  child: Image.network(
                    "https://scontent.fbkk28-1.fna.fbcdn.net/v/t39.30808-6/280384913_1216533839086715_1263546299921001700_n.jpg?_nc_cat=107&ccb=1-7&_nc_sid=f727a1&_nc_ohc=2YIEjEyvaWIQ7kNvgEiavp4&_nc_ht=scontent.fbkk28-1.fna&_nc_gid=AFSh0By1VfynIVb_sXo6HCD&oh=00_AYAgV4MXzVOd1EgzcAGqwDHJXz5zdht6TaGq_WONGI61-g&oe=670B2922",
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          IconButton(
                            icon: Icon(isPressed
                                ? Icons.favorite
                                : FontAwesomeIcons.heart),
                            color: isPressed ? Colors.red : Colors.black,
                            onPressed: () {
                              setState(() {
                                isPressed = !isPressed;
                              });
                            },
                          ),
                          const SizedBox(
                            width: 16.0,
                          ),
                          const Icon(
                            FontAwesomeIcons.comment,
                          ),
                          const SizedBox(
                            width: 16.0,
                          ),
                          const Icon(FontAwesomeIcons.paperPlane),
                        ],
                      ),
                      const Icon(FontAwesomeIcons.bookmark)
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    "Liked by pawankumar, pk and 528,331 others",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16.0, 16.0, 0.0, 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        height: 40.0,
                        width: 40.0,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              fit: BoxFit.fill,
                              image: NetworkImage(
                                  "https://pbs.twimg.com/profile_images/916384996092448768/PF1TSFOE_400x400.jpg")),
                        ),
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      const Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Add a comment...",
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child:
                      Text("1 Day Ago", style: TextStyle(color: Colors.grey)),
                )
              ],
            ),
    );
  }
}