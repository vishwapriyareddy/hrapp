import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vlc_player/flutter_vlc_player.dart';
import 'package:hr_app/model/video_file.dart';
import 'package:hr_app/videoBox.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';

class PlayVideoOnline extends StatefulWidget {
  const PlayVideoOnline({Key? key}) : super(key: key);

  @override
  State<PlayVideoOnline> createState() => _PlayVideoOnlineState();
}

class _PlayVideoOnlineState extends State<PlayVideoOnline> {
  final List<VideoModel> video = [];

  bool downloading = false;
  var progressString = "";
  bool _isPlaying = true;
  final VlcPlayerController _videoPlayerController =
      VlcPlayerController.network(
          'https://media.w3.org/2010/05/sintel/trailer.mp4',
          hwAcc: HwAcc.full,
          autoPlay: true,
          options: VlcPlayerOptions());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _videoPlayerController != null
              ? VlcPlayer(
                  controller: _videoPlayerController,
                  aspectRatio: 16 / 9,
                  placeholder: const Center(
                    child: CircularProgressIndicator(),
                  ),
                )
              : Container(height: 200, child: CircularProgressIndicator()),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            TextButton(
                onPressed: () {},
                child: Icon(
                  Icons.fast_rewind,
                  size: 28,
                  color: Colors.black,
                )),
            TextButton(
                onPressed: () {
                  if (_isPlaying) {
                    setState(() {
                      _isPlaying = false;
                    });
                    _videoPlayerController.pause();
                  } else {
                    setState(() {
                      _isPlaying = true;
                    });
                    _videoPlayerController.play();
                  }
                },
                child: Icon(
                  _isPlaying ? Icons.pause : Icons.play_arrow,
                  size: 28,
                  color: Colors.black,
                )),
            TextButton(
                onPressed: () {},
                child: Icon(
                  Icons.fast_forward,
                  size: 28,
                  color: Colors.black,
                )),
          ]),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                  onPressed: () {
                    // downloadFile(
                    //     'https://media.w3.org/2010/05/sintel/trailer.mp4',
                    //     "video",
                    //     1);
                    openFile(
                        url: 'https://media.w3.org/2010/05/sintel/trailer.mp4',
                        fileName: "video",
                        id: 1);
                  },
                  child: progressString == 100
                      ? Icon(Icons.download_done, size: 35, color: Colors.green)
                      : Icon(Icons.download, size: 35, color: Colors.green)),
            ],
          ),
          downloading ? Text(' $progressString') : Text(""),
        ],
      ),
    );
  }

  Future addVideoStorage(String title, String path, int id) async {
    final videos = VideoModel()
      ..title = title
      ..path = path
      ..id = id;
    // setState(() =>audio.add(audios));
    final box = VideoBoxes.getVideos();
    //final mybox = Boxes.getAudios();
    final myVideo = box.get('key');
    if (!box.containsKey(videos.id)) {
      box.add(videos);
    } else {
      videos.delete();
    }
    // mybox.values;
    // box.keys;
  }

  void editVideo(VideoModel video, String title, String path, int id) {
    video.id = id;
    video.path = path;
    video.title = title;
    video.save();
  }

  Future openFile(
      {required String url, String? fileName, required int id}) async {
    //final file = await downloadFile(url, fileName!).whenComplete(() => addAudioStorage(fileName, url,id));
    final file = await downloadFile(url, fileName!, id);
    if (file == null) return;
    print('Path:${file.path}');
    addVideoStorage(fileName, file.path, id);
    // OpenFile.open(file.path);
  }

  Future<File?> downloadFile(String url, String name, int id) async {
    var hiddenFolder = '.nomedia';
    try {
      var directoryExternal = await getExternalStorageDirectory();
      final dir = Directory('${directoryExternal!.path}/$hiddenFolder');
      if ((await dir.exists())) {
      } else {
        dir.create();
      }
      String fileName = url.split('/').last;

      Dio dio = Dio();
      dio.download(url, '${dir.path}/.${fileName}',
          onReceiveProgress: (rec, total) {
        print("Rec: $rec , Total: $total");
        setState(() {
          downloading = true;
          progressString = ((rec / total) * 100).toStringAsFixed(0) + "%";
        });
      });
      File file = File('${dir.path}/.${fileName}');

      //final http.Response responseData = await http.get(Uri.parse(url));
      //var uint8list = responseData.bodyBytes;
      //var buffer = uint8list.buffer;
      //ByteData byteData = ByteData.view(buffer);

      // String fileName = url.split('/').last;
      // File file = await File('${dir.path}/.${fileName}').writeAsBytes(
      //   buffer.asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));
      return file;
    } catch (e) {
      print("the error is ${e}");
    }
    // final appStorage = await getApplicationDocumentsDirectory();
    // final file = File('${appStorage.path}/$name');

    // final response = await Dio().get(
    //   url ,
    //   options: Options(responseType: ResponseType.bytes,followRedirects: false,receiveTimeout: 0 )
    // );

    // final raf = file.openSync(mode: FileMode.write);
    // raf.writeFromSync(response.data);
    // await raf.close();
    // return file;
    setState(() {
      downloading = false;
      progressString = "Completed";
    });
    print("Download completed");
  }
}
