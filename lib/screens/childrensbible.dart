import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hr_app/screens/home_screen.dart';
import 'package:hr_app/screens/old_testament.dart';

import '../model/childrensbibleModel.dart';
import '../widgets/background_image.dart';
class ChildrensBible extends StatefulWidget {
  static const String id ="childrens-bible";
  const ChildrensBible({ Key? key }) : super(key: key);

  @override
  State<ChildrensBible> createState() => _ChildrensBibleState();
}

class _ChildrensBibleState extends State<ChildrensBible> {
     final List<ChildrensBibleModel> childList = ChildrensBibleModel.getChildModel();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [BackgroundImage(
          assetimage: "assets/images/20432038.jpg", colors1: Colors.white12.withOpacity(.1), colors2: Colors.white54.withOpacity(.1),)
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
  ChildrensBibleModel child,
  BuildContext context,
) {
  return InkWell(
      child: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Container(
               width: MediaQuery.of(context).size.width * 0.8,
                                                  height: 230,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  shape: BoxShape.rectangle,
                  image: DecorationImage(
                      image: AssetImage(child.urlImage),
                      fit: BoxFit.cover),
                ),
              ),
            ),
         Container(width: MediaQuery.of(context).size.width * 0.8,
                                                  height: 45,
            decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  shape: BoxShape.rectangle,
                 color: Colors.white
                ),

           child: Center(child: Text(child.title,style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),)),) ],
        ),
      ),
      onTap: () {Navigator.pushNamed(context, OldTestament.id);
        // Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //         builder: (context) => ServiceListViewDetails(
        //               serviceName: service.title,
        //               service: service,
        //             )));
      });
}
}