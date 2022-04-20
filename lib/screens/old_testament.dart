import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hr_app/model/oldtestamentModel.dart';
import 'package:hr_app/screens/ChildrensPlayList.dart';
import 'package:hr_app/screens/home_screen.dart';

import '../model/childrensbibleModel.dart';
import '../widgets/widgets.dart';
class OldTestament extends StatefulWidget {
  static const String id = "old-testament";
  const OldTestament({ Key? key }) : super(key: key);

  @override
  State<OldTestament> createState() => _OldTestamentState();
}

class _OldTestamentState extends State<OldTestament> {
    final List<OldTestamentModel> childList = OldTestamentModel.getChildModel();
   
  @override
  Widget build(BuildContext context) {
     return SafeArea(
      child: Stack(
        children: [BackgroundImage(assetimage: "assets/images/20432038.jpg", colors1: Colors.black12.withOpacity(.1), colors2: Colors.black26.withOpacity(.1))
         , Scaffold(backgroundColor: Colors.transparent,
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                    IconButton(onPressed: (){Navigator.pushNamed(context, HomeScreen.id);},  icon: FaIcon(
                                            FontAwesomeIcons.home,
                                            color: Colors.black,
                                            size: 20,
                                          ),),
                                          Text("Children\'s Bible",style: TextStyle(fontSize: 23,fontWeight: FontWeight.bold,color: Colors.black),),
                                          Text(""),
                                  ],),
                  ),
                 //  Text(,style: TextStyle(fontSize: 23,fontWeight: FontWeight.bold,color: Colors.black),),
              ListView.builder(itemCount: childList.length,shrinkWrap: true,physics: NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return Stack(children: [Padding(
                                  padding: const EdgeInsets.only(left:10,right: 10),
                                  child: Divider(thickness: 1,color: Colors.black54,),
                                ),childCard(childList[index], context), ],);})  
              ],
              )
            ),
          ),
        ],
      ),
    );
  }

  Widget childCard(
  OldTestamentModel child,
  BuildContext context,
) {
  return Center(
    child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Container(
           width: MediaQuery.of(context).size.width * 0.8,
                                              height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              shape: BoxShape.rectangle,
              image: DecorationImage(
                  image: AssetImage("assets/images/115-1153730_cartoon-background-image-hd.jpg"),
                  fit: BoxFit.cover),
            ),child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
              ClipRRect(borderRadius: BorderRadius.all(Radius.circular(10)),child: Image(image: AssetImage(child.images), fit: BoxFit.cover,height: 130,width: 100,)),
           Column(mainAxisAlignment: MainAxisAlignment.center,
             children: [
               Text(child.mainTitle,style: TextStyle(color: Colors.blue.shade800,fontWeight: FontWeight.bold,fontSize: 25),),
           Padding(
             padding: const EdgeInsets.all(4.0),
             child: Text(child.subTitle,style: TextStyle(color: Colors.black,fontWeight: FontWeight.normal,fontSize: 18),),
           ),  
           Text("Generic\t${child.start} - ${child.end}",style: TextStyle(color: Colors.black,fontWeight: FontWeight.normal,fontSize: 11),),
   Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
     children: [
  Padding(
    padding: const EdgeInsets.only(top:8,left: 13,right: 13),
    child: Column(
  children: [
    CircleAvatar(
      backgroundColor: Colors.white,
      child: Image(
        image: AssetImage("assets/images/read.png"), fit: BoxFit.cover,height: 25,width: 25,)),
    Text("Read\nmyself",style: TextStyle(color: Colors.black,fontWeight: FontWeight.normal,fontSize: 13),),

  ],
    ),
  ),
  InkWell(
    onTap: (){
      Navigator.pushNamed(context, ChildrenPlayList.id);
    },
    child: Padding(
      padding: const EdgeInsets.only(top:8,left: 13,right: 13),
      child: Column(
    children: [
      CircleAvatar(
        backgroundColor: Colors.white,
        child: Image(
          image: AssetImage("assets/images/book.png"), 
          fit: BoxFit.cover,height: 25,width: 25,)),
      Text("Read\nfor me",
      style: TextStyle(color: Colors.black,fontWeight: FontWeight.normal,fontSize: 13),),
  
    ],
      ),
    ),
  )
  ,],)
            ],
           ) ],),
          ),
        ),
   
        ],
    ),
  );
}
}