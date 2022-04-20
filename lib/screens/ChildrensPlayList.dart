import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:hr_app/boxes.dart';
import 'package:hr_app/model/audio_file.dart';
import 'package:open_file/open_file.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import '../widgets/custom_list_tile.dart';
class ChildrenPlayList extends StatefulWidget {
  static const String id = "childrens-playlist"; 
  const ChildrenPlayList({ Key? key }) : super(key: key);

  @override
  State<ChildrenPlayList> createState() => _ChildrenPlayListState();
}

class _ChildrenPlayListState extends State<ChildrenPlayList> {
   // final Box downloadsBox = Hive.box('audiostore');

  final List<AudioModel> audio =[];
  
  
 bool downloading = false;
  var progressString = "";
  List music=[
    {"id":1,
    "title":"Mellow Background",
    "singer":"chapter 1",
    "url":"https://waveform.customer.envato.com/tsunami/118036036/preview.mp3",
    "coverUrl":"https://audio-previews.elements.envatousercontent.com/files/118036036/preview.mp3?response-content-disposition=attachment%3B+filename%3D%22VUGND8F-mellow-background.mp3%22" 
    },
    {"id":2,
    "title":"Mellow",
    "singer":"chapter 2",
    "url":"https://waveform.customer.envato.com/tsunami/234006788/preview.mp3",
    "coverUrl":   "https://audio-previews.elements.envatousercontent.com/files/234006788/preview.mp3?response-content-disposition=attachment%3B+filename%3D%22QRD4P9Z-mellow.mp3%22" 
    },
    {"id":3,
    "title":"Mellow Background",
    "singer":"chapter 3",
    "url":"https://waveform.customer.envato.com/tsunami/118036036/preview.mp3",
    "coverUrl":"https://audio-previews.elements.envatousercontent.com/files/118036036/preview.mp3?response-content-disposition=attachment%3B+filename%3D%22VUGND8F-mellow-background.mp3%22" 
    },
    {"id":4,
    "title":"Mellow",
    "singer":"chapter 4",
    "url":"https://waveform.customer.envato.com/tsunami/234006788/preview.mp3",
    "coverUrl":   "https://audio-previews.elements.envatousercontent.com/files/234006788/preview.mp3?response-content-disposition=attachment%3B+filename%3D%22QRD4P9Z-mellow.mp3%22" 
    }
    ];
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

void playMusic(String url)async{
    if(isPlaying && currentSong != url){
      audioPlayer.pause();
      int result= await audioPlayer.play(url);
      if(result==1){
setState(() {
  currentSong = url;  
});
      }
    }else if(!isPlaying){
       int result= await audioPlayer.play(url);
      if(result==1){
setState(() {
  isPlaying = true;  
});
      }
    }
    audioPlayer.onAudioPositionChanged.listen((event) {
      setState(() {
      position =event;
    });
    });
 audioPlayer.onDurationChanged.listen((event) {
      setState(() {
      duration =event;
    });
    });
}

Duration  duration = new Duration(); 

Duration  position  = new Duration(); 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(child: ListView.builder(itemCount: music.length,itemBuilder: (context, index )=> 
          customTile(
            //index:index,
          //downloading:downloading,
          //progressString:progressString,
            onTap: (){
               if(isPlaying){
                    audioPlayer.pause();
                  setState(() {
                    btnIcon=Icons.play_arrow;
                    isPlaying=false;
                  });
                }else{
                   audioPlayer.resume();
                  setState(() {
                    btnIcon=Icons.pause;
                    isPlaying=true;
                  });
                }
              playMusic(music[index]["coverUrl"]); 
              setState(() {
                currentChapter=music[index]['singer'];
              });
            },
            title: music[index]['title'],
             singer: music[index]['singer'],
            onTapDownload: ()=>openFile(id: music[index]['id'],
              url:music[index]['coverUrl'],
            fileName:music[index]['singer'])
            )
      )),
          Container(              

            decoration: BoxDecoration(color: Colors.white,boxShadow: [
            BoxShadow(color: Color(0x55212121),
            blurRadius: 8.0)
          ]),
          child: Column(
            children: [ 
            Slider(value:  position.inSeconds.toDouble(),
            min:0.0 ,max:duration.inSeconds.toDouble(),
             onChanged: (value){
               
            }),
            Padding(
              padding: const EdgeInsets.only(bottom:8.0,left:8.0,right:8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                Text(
                  currentChapter,style: TextStyle(color:Colors.grey.shade900,fontSize: 16 ),),
                  
                downloading ?  Text('$currentChapter $progressString'):Text(""),
                IconButton(
                  onPressed: (){
                if(isPlaying){
                    audioPlayer.pause();
                  setState(() {
                    btnIcon=Icons.play_arrow;
                    isPlaying=false;
                  });
                }else{
                   audioPlayer.resume();
                  setState(() {
                    btnIcon=Icons.pause;
                    isPlaying=true;
                  });
                }
                },iconSize: 42, icon: Icon(btnIcon))
              ],),
            )
          ],),)  ,

          
        ],
      ),
    );
  }
  Future addAudioStorage(String title, String path,int id) async {
    final audios  = AudioModel()
    ..title= title
    ..path=path
    ..id=id;
   // setState(() =>audio.add(audios));
  final box = Boxes.getAudios();
   //final mybox = Boxes.getAudios(); 
   final myAudio  = box.get('key');
   if(!box.containsKey(audios.id)){
     box.add(audios);
    }else{
      audios.delete();
    }
   // mybox.values; 
  // box.keys;

  }
  void editAudio(AudioModel audio,String title, String path,int id){

  audio.id=id;
  audio.path=path;
  audio.title=title;
  audio.save();
  
  }


  Future openFile({required String url ,String? fileName, required int id})async{
    //final file = await downloadFile(url, fileName!).whenComplete(() => addAudioStorage(fileName, url,id));
    final file = await downloadFile(url, fileName!,id);
    if(file==null) return;
    print('Path:${file.path}');
    addAudioStorage(fileName, file.path, id);
    // OpenFile.open(file.path);
  }

  
  Future<File?> downloadFile(String url, String name,int id)async{
     var hiddenFolder = '.nomedia';
 try {
    var directoryExternal = await getExternalStorageDirectory();
    final dir = Directory('${directoryExternal!.path}/$hiddenFolder');
    if ((await dir.exists()) 
  
    ) {
    } else {
      dir.create();
    }
        String fileName = url.split('/').last;

    Dio dio = Dio();
    dio.download(
                                url, 
                                '${dir.path}/.${fileName}',
                              onReceiveProgress: (rec, total) {
                             print("Rec: $rec , Total: $total");
                                  setState(() {
                                   downloading = true;
          progressString = ((rec / total) * 100).toStringAsFixed(0) + "%";
                                  });
                                  });
                                  File file =  File('${dir.path}/.${fileName}');

    //final http.Response responseData = await http.get(Uri.parse(url));
    //var uint8list = responseData.bodyBytes;
    //var buffer = uint8list.buffer;
    //ByteData byteData = ByteData.view(buffer);

    // String fileName = url.split('/').last;
   // File file = await File('${dir.path}/.${fileName}').writeAsBytes(
     //   buffer.asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));
    return file;
 }catch (e) {
      print(e);
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