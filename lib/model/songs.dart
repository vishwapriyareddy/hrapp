import 'package:flutter/material.dart';
class SongsModel{
   static List<SongsModel> getSongsModel() => [
     SongsModel(
            "Jesus Loves The Litle Children",),
      SongsModel(
            "Jesus Loves Me",),
      SongsModel(
            "I've Got The Joy",),
      SongsModel(
            "He's Got The Whole World...",),
       SongsModel(
            "I Am A C-H-R-I-S-T-I-A-N",),
       SongsModel(
            "The B-I-B-L-E",),
       SongsModel(
            "I'm In The Lord's Army",),
        SongsModel("Deep & Wide",),
       SongsModel(
            "Oh Happy Day",),
        SongsModel(
            "I'm H-A-P-P-Y",)                        

   ]; 
  String title;
  SongsModel( this.title, );
}