import 'dart:io';
import 'package:hive/hive.dart';
part 'audio_file.g.dart';

@HiveType(typeId: 0)
class AudioModel extends HiveObject{
  @HiveField(0)
  late int id;
  @HiveField(1)
  late String title;
  @HiveField(2)
  late String path;
}