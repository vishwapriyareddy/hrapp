import 'package:hive/hive.dart';
import 'package:hr_app/model/audio_file.dart';

class Boxes{
  static Box<AudioModel> getAudios()=>
  Hive.box<AudioModel>('audiostore');
}