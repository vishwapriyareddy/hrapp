import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hr_app/boxes.dart';
import 'package:hr_app/model/audio_file.dart';
import 'package:hr_app/widgets/Downloads/audio_downloads.dart';
import 'package:hr_app/widgets/Downloads/video_downloads.dart';
import 'package:open_file/open_file.dart';

class Downloads extends StatefulWidget {
  static const String id = "downloads";
  const Downloads({Key? key}) : super(key: key);

  @override
  State<Downloads> createState() => _DownloadsState();
}

class _DownloadsState extends State<Downloads> {
  String currentChapter = "";
  IconData btnIcon = Icons.play_arrow;

  AudioPlayer audioPlayer = new AudioPlayer(mode: PlayerMode.MEDIA_PLAYER);
  bool isPlaying = false;
  String currentSong = "";
// @override
//   void dispose() {
//     Hive.box('audiostore').close();
//     super.dispose();
//   }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void playMusic(String url) async {
    if (isPlaying && currentSong != url) {
      audioPlayer.pause();
      int result = await audioPlayer.play(url);
      if (result == 1) {
        setState(() {
          currentSong = url;
        });
      }
    } else if (!isPlaying) {
      int result = await audioPlayer.play(url);
      if (result == 1) {
        setState(() {
          isPlaying = true;
        });
      }
    }
    audioPlayer.onAudioPositionChanged.listen((event) {
      setState(() {
        position = event;
      });
    });
    audioPlayer.onDurationChanged.listen((event) {
      setState(() {
        duration = event;
      });
    });
  }

  Duration duration = new Duration();

  Duration position = new Duration();
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Downloads'),
          bottom: TabBar(
            tabs: [
              Tab(
                text: "Audios",
                icon: Icon(Icons.music_note_outlined),
              ),
              Tab(
                text: "Videos",
                icon: Icon(Icons.music_note_outlined),
              ),
            ],
          ),
        ),
        body: const TabBarView(children: [AudioDownloads(), VideoDownloads()]),
      ),
    );
  }
}

// Widget downloadTile({box}) {
//   return ListView.builder(
//       shrinkWrap: true,
//       itemCount: box.length,
//       itemBuilder: (context, index) {
//         var personData = box.getAt(index)!;
//         //var personData = box.containsKey(box.id);
//         return downloadCard(personData: personData);
//       });
// }

// class downloadCard extends StatefulWidget {
//   const downloadCard({
//     Key? key,
//     required this.personData,
//   }) : super(key: key);

//   final dynamic personData;

//   @override
//   State<downloadCard> createState() => _downloadCardState();
// }

// class _downloadCardState extends State<downloadCard> {
//   String currentChapter = "";
//   IconData btnIcon = Icons.play_arrow;

//   AudioPlayer audioPlayer = new AudioPlayer(mode: PlayerMode.MEDIA_PLAYER);
//   bool isPlaying = false;
//   String currentSong = "";
// // @override
// //   void dispose() {
// //     Hive.box('audiostore').close();
// //     super.dispose();
// //   }

//   void playMusic(String url) async {
//     if (isPlaying && currentSong != url) {
//       audioPlayer.pause();
//       int result = await audioPlayer.play(url);
//       if (result == 1) {
//         setState(() {
//           currentSong = url;
//         });
//       }
//     } else if (!isPlaying) {
//       int result = await audioPlayer.play(url);
//       if (result == 1) {
//         setState(() {
//           isPlaying = true;
//         });
//       }
//     }
//     audioPlayer.onAudioPositionChanged.listen((event) {
//       setState(() {
//         position = event;
//       });
//     });
//     audioPlayer.onDurationChanged.listen((event) {
//       setState(() {
//         duration = event;
//       });
//     });
//   }

//   Duration duration = new Duration();

//   Duration position = new Duration();
//   @override
//   void initState() {
//     //  playMusic(widget.personData.path!.toString());
//     // TODO: implement initState
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: InkWell(
//         child: Container(
//           padding: EdgeInsets.all(8.0),
//           child: Row(
//             children: [
//               InkWell(
//                 onTap: () async {
//                   //  if(isPlaying){
//                   //          await   audioPlayer.pause();

//                   //               setState(() {
//                   //             btnIcon=Icons.play_arrow;
//                   //             isPlaying=false;
//                   //           });

//                   //         }else{
//                   //           await audioPlayer.resume();

//                   //              setState(() {
//                   //             btnIcon=Icons.pause;
//                   //             isPlaying=true;
//                   //           });

//                   //         }
//                   // playMusic(widget.personData.path!.toString());
//                   openFile(
//                       id: widget.personData.id!,
//                       url: widget.personData.path!.toString());
//                   // setState(() {
//                   //   currentChapter = widget.personData.title!;
//                   // });
//                 },
//                 child: Container(
//                   height: 80,
//                   width: 80,
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(16.0),
//                       image: DecorationImage(
//                           image: AssetImage("assets/icons/folder.png"))),
//                 ),
//               ),
//               SizedBox(
//                 width: 10.0,
//               ),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     widget.personData.title!,
//                     style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
//                   ),
//                   // SizedBox(height: 5.0,),
//                   // Text(widget.personData.path!,style: TextStyle(color:Colors.grey,fontSize: 16 ),)
//                 ],
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Future openFile(
//       {required String url, String? fileName, required int id}) async {
//     final file = await url;
//     if (file == null) return;
//     print('Path:${file}');

//     OpenFile.open(file);
//   }
// }
