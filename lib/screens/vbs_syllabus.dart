import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hr_app/model/vbsSyllabusModel.dart';
import 'package:hr_app/screens/home_screen.dart';
import 'package:hr_app/widgets/bacgroundimage_colorsless.dart';
class VbsSyllabus extends StatefulWidget {
  static const String id = "vbs-syllabus";
  const VbsSyllabus({ Key? key }) : super(key: key);

  @override
  State<VbsSyllabus> createState() => _VbsSyllabusState();
}

class _VbsSyllabusState extends State<VbsSyllabus> {
       final List<VbsSyllabusModel> childList = VbsSyllabusModel.getVbsSyllabusModel();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [BackgroundImageColorsLess(
          assetimage: "assets/images/bunny.jpg",
           ),
          Scaffold(backgroundColor: Colors.transparent,
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
                                          Text("Books",style: TextStyle(fontSize: 23,fontWeight: FontWeight.bold,color: Colors.black),),
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
  VbsSyllabusModel child,
  BuildContext context,
) {
  return InkWell(
      child: Center(
        child: Column(
          children: [
            // Padding(
            //   padding: const EdgeInsets.all(20),
            //   child: Container(
            //    width: MediaQuery.of(context).size.width * 0.8,
            //                                       height: 230,
            //     decoration: BoxDecoration(
            //       borderRadius: BorderRadius.all(Radius.circular(20)),
            //       shape: BoxShape.rectangle,
                  
            //     ),
            //   ),
            // ),
         Padding(
           padding: const EdgeInsets.all(20),
           child: Container(width: MediaQuery.of(context).size.width * 0.8,
                                                    height: 90,
              decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    shape: BoxShape.rectangle,
                   color: Colors.white
                  ),

             child: Center(child: Column(mainAxisAlignment: MainAxisAlignment.spaceAround,
               children: [
                 Text(child.title,style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),),
                Text(child.age,style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.normal),),

               ],
             )),),
         ) ],
        ),
      ),
      onTap: () {
        //Navigator.pushNamed(context, OldTestament.id);
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