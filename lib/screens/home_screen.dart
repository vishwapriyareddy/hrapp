// import 'package:flutter/material.dart';
// import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:hr_app/constants.dart';
// import 'package:hr_app/model/category.dart';
// import 'package:hr_app/screens/details_screen.dart';
// class HomeScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: Padding(
//           padding: EdgeInsets.only(left: 20, top: 50, right: 20),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: <Widget>[
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: <Widget>[
//                   SvgPicture.asset("assets/icons/menu.svg"),
//                   Image.asset("assets/images/user.png"),
//                 ],
//               ),
//               SizedBox(height: 30),
//               Text("Hey Alex,", style: kHeadingextStyle),
//               Text("Find a course you want to learn", style: kSubheadingextStyle),
//               Container(
//                 margin: EdgeInsets.symmetric(vertical: 30),
//                 padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
//                 height: 60,
//                 width: double.infinity,
//                 decoration: BoxDecoration(
//                   color: Color(0xFFF5F5F7),
//                   borderRadius: BorderRadius.circular(40),
//                 ),
//                 child: Row(
//                   children: <Widget>[
//                     SvgPicture.asset("assets/icons/search.svg"),
//                     SizedBox(width: 16),
//                     Text(
//                       "Search for anything",
//                       style: TextStyle(
//                         fontSize: 18,
//                         color: Color(0xFFA0A5BD),
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: <Widget>[
//                   Text("Category", style: kTitleTextStyle),
//                   Text(
//                     "See All",
//                     style: kSubtitleTextSyule.copyWith(color: kBlueColor),
//                   ),
//                 ],
//               ),
//               SizedBox(height: 30),
//               Expanded(
//                 child: StaggeredGridView.countBuilder(shrinkWrap: true,
//                   padding: EdgeInsets.all(0),
//                   crossAxisCount: 2,
//                   itemCount: categories.length,
//                   crossAxisSpacing: 20,
//                   mainAxisSpacing: 20,
//                   itemBuilder: (context, index) {
//                     return GestureDetector(
//                       onTap: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => DetailsScreen(),
//                           ),
//                         );
//                       },
//                       child: Container(
//                         padding: EdgeInsets.all(20),
//                         height: index.isEven ? 200 : 240,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(16),
//                           image: DecorationImage(
//                             image: AssetImage(categories[index].image),
//                             fit: BoxFit.fill,
//                           ),
//                         ),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: <Widget>[
//                             Text(
//                               categories[index].name,
//                               style: kTitleTextStyle,
//                             ),
//                             Text(
//                               '${categories[index].numOfCourses} Courses',
//                               style: TextStyle(
//                                 color: kTextColor.withOpacity(.5),
//                               ),
//                             )
//                           ],
//                         ),
//                       ),
//                     );
//                   },
//                   staggeredTileBuilder: (index) => StaggeredTile.fit(1),
//                 ),
//               ),
//               SizedBox(height: 20,)
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hr_app/screens/Downloaded.dart';
import 'package:hr_app/screens/childrensbible.dart';
import 'package:hr_app/screens/songs.dart';
import 'package:hr_app/screens/story.dart';
import 'package:hr_app/screens/vbs_syllabus.dart';
import 'package:hr_app/widgets/background_image.dart';

class HomeScreen extends StatefulWidget {
  static const String id = "home-screen";
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            //    width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                image: DecorationImage(
              image: const AssetImage('assets/images/f.jpg'),
              fit: BoxFit.cover,
            )),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 100.0),
                        alignment: Alignment.topCenter,
                        height: 200.0,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.elliptical(60, 60),
                              bottomRight: Radius.elliptical(60, 60),
                            )),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(""),
                                IconButton(
                                  onPressed: () {},
                                  icon: FaIcon(
                                    FontAwesomeIcons.user,
                                    color: Colors.blue[900],
                                    size: 20,
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Text(
                                'Today\'s Bible verse',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        top: 80.0,
                        right: 0.0,
                        left: 0.0,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: const AssetImage(
                                    'assets/images/biblequote.jpeg'),
                                fit: BoxFit.cover,
                              ),
                              color: Colors.white,
                              borderRadius: BorderRadius.all(
                                Radius.circular(20),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 7,
                                  blurRadius: 7,
                                  offset: Offset(
                                      0, 3), // changes position of shadow
                                ),
                              ],
                            ),
                            width: MediaQuery.of(context).size.width * 0.6,
                            height: 170,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          //launch(
                          //  'mailto:help@email.com?subject=I have a query&body=About%20the');
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, VbsSyllabus.id);
                            },
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.13,
                              width: MediaQuery.of(context).size.width * 0.35,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.elliptical(40, 40),
                                    bottomRight: Radius.elliptical(40, 40),
                                    topLeft: Radius.elliptical(60, 60),
                                    topRight: Radius.elliptical(60, 60),
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey.withOpacity(0.3),
                                        blurRadius: 20,
                                        offset: Offset(1, 10))
                                  ]),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'VBS',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () => Navigator.pushNamed(context, Downloads.id),
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.13,
                          width: MediaQuery.of(context).size.width * 0.35,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.elliptical(40, 40),
                                bottomRight: Radius.elliptical(40, 40),
                                topLeft: Radius.elliptical(60, 60),
                                topRight: Radius.elliptical(60, 60),
                              ),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.withOpacity(0.3),
                                    blurRadius: 20,
                                    offset: Offset(1, 10))
                              ]),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Day 01',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          //launch(
                          //  'mailto:help@email.com?subject=I have a query&body=About%20the');
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.13,
                              width: MediaQuery.of(context).size.width * 0.35,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.elliptical(40, 40),
                                    bottomRight: Radius.elliptical(40, 40),
                                    topLeft: Radius.elliptical(60, 60),
                                    topRight: Radius.elliptical(60, 60),
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey.withOpacity(0.3),
                                        blurRadius: 20,
                                        offset: Offset(1, 10))
                                  ]),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Memory Verse',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, Story.id);
                        },
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.13,
                          width: MediaQuery.of(context).size.width * 0.35,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.elliptical(40, 40),
                                bottomRight: Radius.elliptical(40, 40),
                                topLeft: Radius.elliptical(60, 60),
                                topRight: Radius.elliptical(60, 60),
                              ),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.withOpacity(0.3),
                                    blurRadius: 20,
                                    offset: Offset(1, 10))
                              ]),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Story',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, ChildrensBible.id);
                            },
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.13,
                              width: MediaQuery.of(context).size.width * 0.35,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.elliptical(40, 40),
                                    bottomRight: Radius.elliptical(40, 40),
                                    topLeft: Radius.elliptical(60, 60),
                                    topRight: Radius.elliptical(60, 60),
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey.withOpacity(0.3),
                                        blurRadius: 20,
                                        offset: Offset(1, 10))
                                  ]),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Books',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, Songs.id);
                        },
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.13,
                          width: MediaQuery.of(context).size.width * 0.35,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.elliptical(40, 40),
                                bottomRight: Radius.elliptical(40, 40),
                                topLeft: Radius.elliptical(60, 60),
                                topRight: Radius.elliptical(60, 60),
                              ),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey.withOpacity(0.3),
                                    blurRadius: 20,
                                    offset: Offset(1, 10))
                              ]),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Action Song',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 50,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
