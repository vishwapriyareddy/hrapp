import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hr_app/model/storymodel.dart';
import 'package:hr_app/screens/home_screen.dart';
import 'package:hr_app/widgets/play_video.dart';
import 'package:hr_app/widgets/widgets.dart';

class Story extends StatefulWidget {
  static const String id = "story";
  const Story({Key? key}) : super(key: key);

  @override
  State<Story> createState() => _StoryState();
}

class _StoryState extends State<Story> {
  final List<StoryModel> StoryList = StoryModel.getStoryModel();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          BackgroundImage(
            assetimage: "assets/images/air_balloon_children.jpg",
            colors1: Colors.black12,
            colors2: Colors.black54,
          ),
          Scaffold(
            backgroundColor: Colors.transparent,
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.pushNamed(context, HomeScreen.id);
                          },
                          icon: FaIcon(
                            FontAwesomeIcons.home,
                            color: Colors.white54,
                            size: 20,
                          ),
                        ),
                        Text(
                          "Story",
                          style: TextStyle(
                              fontSize: 23,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 255, 255, 255)),
                        ),
                        Text(""),
                      ],
                    ),
                  ),
                  ListView.builder(
                      itemCount: StoryList.length,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        return Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Divider(
                                thickness: 1,
                                color: Colors.white54,
                              ),
                            ),
                            storyCard(StoryList[index], context),
                          ],
                        );
                      })
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget storyCard(
    StoryModel story,
    BuildContext context,
  ) {
    return InkWell(
        child: Center(
          child: Container(
            margin: EdgeInsets.all(0.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.5,
                      height: MediaQuery.of(context).size.height * 0.3,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        shape: BoxShape.rectangle,
                        image: DecorationImage(
                            image: AssetImage(story.urlImage),
                            fit: BoxFit.contain),
                      ),
                    ),
                  ),
                ),
                Text(
                  story.title, style: TextStyle(color: Colors.white70),
                  textAlign: TextAlign.start,
                  // Align(
                  //   alignment: Alignment.center,
                  //   child: Container(
                  //       width: MediaQuery.of(context).size.width * 6.0,
                  //       height: MediaQuery.of(context).size.height * 0.7,
                  //       child: Text(
                  //         story.title,
                  //         textAlign: TextAlign.center,
                  //         style:
                  //             Theme.of(context).textTheme.headline6!.copyWith(
                  //                   color: Colors.black,
                  //                   fontSize: 12,
                  //                 ),
                  //       )),
                  // ),
                ),
              ],
            ),
          ),
        ),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => PlayVideoOnline()));
        });
  }
}
