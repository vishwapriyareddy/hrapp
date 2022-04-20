import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hr_app/model/audio_file.dart';
import 'package:hr_app/model/video_file.dart';
import 'package:hr_app/screens/ChildrensPlayList.dart';
import 'package:hr_app/screens/Downloaded.dart';
import 'package:hr_app/screens/Sign_in.dart';
import 'package:hr_app/screens/childrensbible.dart';
import 'package:hr_app/screens/home_screen.dart';
import 'package:hr_app/screens/login_page.dart';
import 'package:hr_app/screens/old_testament.dart';
import 'package:hr_app/screens/on_Boarding_Screen.dart';
import 'package:hr_app/screens/songs.dart';
import 'package:hr_app/screens/story.dart';
import 'package:hr_app/screens/vbs_syllabus.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var dir = await getApplicationDocumentsDirectory();
  await Hive.initFlutter(dir.path);
  // await  Hive.initFlutter();

  Hive.registerAdapter(AudioModelAdapter());
  Hive.registerAdapter(VideoModelAdapter());
  await Hive.openBox<AudioModel>('audiostore');

  await Hive.openBox<VideoModel>('videostore');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Login Page',
        theme: ThemeData(
          textTheme:
              GoogleFonts.josefinSansTextTheme(Theme.of(context).textTheme),
          primarySwatch: Colors.blue,
        ),
        initialRoute: OnBoardingScreen.id,
        routes: {
          SignInPage.id: (context) => SignInPage(),
          LoginPage.id: (context) => LoginPage(),
          OnBoardingScreen.id: (context) => OnBoardingScreen(),
          Story.id: (context) => Story(),
          HomeScreen.id: (context) => HomeScreen(),
          Songs.id: (context) => Songs(),
          ChildrensBible.id: (context) => ChildrensBible(),
          OldTestament.id: (context) => OldTestament(),
          VbsSyllabus.id: (context) => VbsSyllabus(),
          ChildrenPlayList.id: (context) => ChildrenPlayList(),
          Downloads.id: (context) => Downloads()
        });
  }
}
