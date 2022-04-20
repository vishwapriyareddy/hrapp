import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
Widget customTile({String? title,String? singer, onTap,onTapDownload,}
){
  return InkWell(onTap: onTap,
    child: Container(padding: EdgeInsets.all(8.0),child: 
    Row(
      children: [     
        
         //  if(downloading==true)
      //Text('${progressString==100? "Done":"$progressString"}'),

      Center(
        child:
       
        InkWell(onTap:  onTapDownload,
          child: Container(height:80,width: 80,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(16.0),
            image:DecorationImage(image: AssetImage("assets/icons/folder.png")
            )
            )
            ,),
        ),
      ),
    
        SizedBox(width: 10.0,),
        Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Text(title!,style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600),
          ),
          SizedBox(height: 5.0,),
          Text(singer!,style: TextStyle(color:Colors.grey,fontSize: 16 ),)
        ],)
    ],),),
  );
}

