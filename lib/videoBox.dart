import 'package:hive/hive.dart';

import 'model/video_file.dart';

class VideoBoxes {
  static Box<VideoModel> getVideos() => Hive.box<VideoModel>('videostore');
}
