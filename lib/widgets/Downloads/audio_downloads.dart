import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:open_file/open_file.dart';

import '../../boxes.dart';
import '../../model/audio_file.dart';

class AudioDownloads extends StatefulWidget {
  const AudioDownloads({Key? key}) : super(key: key);

  @override
  State<AudioDownloads> createState() => _AudioDownloadsState();
}

class _AudioDownloadsState extends State<AudioDownloads> {
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
  void initState() {
    //  playMusic(widget.personData.path!.toString());
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ValueListenableBuilder<Box<AudioModel>>(
            valueListenable: Boxes.getAudios().listenable(),
            builder: (context, box, _) {
              final audios = box.values.toList().cast<AudioModel>();
              //  int length = audios.length;
              audios.toSet();
              if (audios.isEmpty) {
                return Center(
                  child: Text('Empty audios'),
                );
              } else {
                return downloadTile(
                  box: box,
                );
              }
            },
          ),

          //              Container(

          //             decoration: BoxDecoration(color: Colors.white,boxShadow: [
          //             BoxShadow(color: Color(0x55212121),
          //             blurRadius: 8.0)
          //           ]),
          //           child: Column(
          //             children: [
          //             Slider(value:  position.inSeconds.toDouble(),
          //             min:0.0 ,max:duration.inSeconds.toDouble(),
          //              onChanged: (value){

          //             }),
          //             Padding(
          //               padding: const EdgeInsets.only(bottom:8.0,left:8.0,right:8.0),
          //               child: Row(
          //                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //                 children: [
          //                 Text(
          //                   currentChapter,style: TextStyle(color:Colors.grey.shade900,fontSize: 16 ),),

          //                 IconButton(
          //                   onPressed: ()async{
          //                 if(isPlaying){
          //                   await  audioPlayer.pause();

          //  setState(() {
          //                     btnIcon=Icons.play_arrow;
          //                     isPlaying=false;
          //                   });

          //                 }else{

          //                  audioPlayer.resume();

          //                      setState(() {
          //                     btnIcon=Icons.pause;
          //                     isPlaying=true;
          //                   });

          //                 }
          //                 },iconSize: 42, icon: Icon(btnIcon))
          //               ],),
          //             )
          //           ],),)  ,
        ],
      ),
    );
  }
}

Widget downloadTile({box}) {
  return ListView.builder(
      shrinkWrap: true,
      itemCount: box.length,
      itemBuilder: (context, index) {
        var personData = box.getAt(index)!;
        //var personData = box.containsKey(box.id);
        return downloadCard(personData: personData);
      });
}

class downloadCard extends StatefulWidget {
  const downloadCard({
    Key? key,
    required this.personData,
  }) : super(key: key);

  final dynamic personData;

  @override
  State<downloadCard> createState() => _downloadCardState();
}

class _downloadCardState extends State<downloadCard> {
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
  void initState() {
    //  playMusic(widget.personData.path!.toString());
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        padding: EdgeInsets.all(8.0),
        child: Row(
          children: [
            InkWell(
              onTap: () async {
                //  if(isPlaying){
                //          await   audioPlayer.pause();

                //               setState(() {
                //             btnIcon=Icons.play_arrow;
                //             isPlaying=false;
                //           });

                //         }else{
                //           await audioPlayer.resume();

                //              setState(() {
                //             btnIcon=Icons.pause;
                //             isPlaying=true;
                //           });

                //         }
                // playMusic(widget.personData.path!.toString());
                openFile(
                    id: widget.personData.id!,
                    url: widget.personData.path!.toString());
                // setState(() {
                //   currentChapter = widget.personData.title!;
                // });
              },
              child: Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.0),
                    image: DecorationImage(
                        image: AssetImage("assets/icons/folder.png"))),
              ),
            ),
            SizedBox(
              width: 10.0,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.personData.title!,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                // SizedBox(height: 5.0,),
                // Text(widget.personData.path!,style: TextStyle(color:Colors.grey,fontSize: 16 ),)
              ],
            )
          ],
        ),
      ),
    );
  }

  Future openFile(
      {required String url, String? fileName, required int id}) async {
    final file = await url;
    if (file == null) return;
    print('Path:${file}');

    OpenFile.open(file);
  }
}
