import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_vlc_player/flutter_vlc_player.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:open_file/open_file.dart';

import '../../model/video_file.dart';
import '../../videoBox.dart';

class VideoDownloads extends StatefulWidget {
  const VideoDownloads({Key? key}) : super(key: key);

  @override
  State<VideoDownloads> createState() => _VideoDownloadsState();
}

class _VideoDownloadsState extends State<VideoDownloads> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ValueListenableBuilder<Box<VideoModel>>(
            valueListenable: VideoBoxes.getVideos().listenable(),
            builder: (context, box, _) {
              final videos = box.values.toList().cast<VideoModel>();
              //  int length = audios.length;
              videos.toSet();
              if (videos.isEmpty) {
                return Center(
                  child: Text('Empty Videos'),
                );
              } else {
                return downloadTile(
                  box: box,
                );
              }
            },
          ),
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
  // bool _isPlaying = true;
  // //String file = widget.personData.path!;
  // final VlcPlayerController _videoPlayerController = VlcPlayerController.asset(
  //     widget.personData.path!,
  //     hwAcc: HwAcc.full,
  //     autoPlay: true,
  //     options: VlcPlayerOptions());

// @override
//   void dispose() {
//     Hive.box('audiostore').close();
//     super.dispose();
//   }

  @override
  void initState() {
    //  playMusic(widget.personData.path!.toString());
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // _videoPlayerController != null
        //     ? VlcPlayer(
        //         controller: _videoPlayerController,
        //         aspectRatio: 16 / 9,
        //         placeholder: const Center(
        //           child: CircularProgressIndicator(),
        //         ),
        //       )
        //     : Container(height: 200, child: CircularProgressIndicator()),
        // Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        //   TextButton(
        //       onPressed: () {},
        //       child: Icon(
        //         Icons.fast_rewind,
        //         size: 28,
        //         color: Colors.black,
        //       )),
        //   // TextButton(
        //   //     // onPressed: () {
        //   //     //   if (_isPlaying) {
        //   //     //     setState(() {
        //   //     //       _isPlaying = false;
        //   //     //     });
        //   //     //     _videoPlayerController.pause();
        //   //     //   } else {
        //   //     //     setState(() {
        //   //     //       _isPlaying = true;
        //   //     //     });
        //   //     //     _videoPlayerController.play();
        //   //     //   }
        //   //     //},
        //   //     child: Icon(
        //   //   _isPlaying ? Icons.pause : Icons.play_arrow,
        //   //   size: 28,
        //   //   color: Colors.black,
        //   // )),
        //   TextButton(
        //       onPressed: () {},
        //       child: Icon(
        //         Icons.fast_forward,
        //         size: 28,
        //         color: Colors.black,
        //       )),
        // ]),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Video"),
            TextButton(
                onPressed: () {
                  // downloadFile(
                  //     'https://media.w3.org/2010/05/sintel/trailer.mp4',
                  //     "video",
                  //     1);
                  openFile(
                      id: widget.personData.id!,
                      url: widget.personData.path!.toString());
                },
                child: Icon(Icons.video_collection,
                    size: 35, color: Colors.orange)),
          ],
        ),
      ],
    );
  }

  Future openFile(
      {required String url, String? fileName, required int id}) async {
    final file = await url;
    // file.replaceAll(RegExp('\\s+'), '_');

    if (file == null) return;
    print('Path:${file}');

    OpenFile.open(file);
  }
}
