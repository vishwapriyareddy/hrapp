import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hr_app/screens/home_screen.dart';

import '../model/songs.dart';
import '../widgets/widgets.dart';
class Songs extends StatefulWidget {
  static const String id = "songs-screen";
  const Songs({ Key? key }) : super(key: key);

  @override
  State<Songs> createState() => _SongsState();
}

class _SongsState extends State<Songs> {
   final List<SongsModel> SongList = SongsModel.getSongsModel();
  @override

  Widget build(BuildContext context) {
      return SafeArea(
      child: Stack(
        children: [BackgroundImage(assetimage: "assets/images/HD-wallpaper.jpg",colors1:Color(0xFFC1272D).withOpacity(.8) ,colors2: Color(0xFFFFFFFF).withOpacity(.4),)
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
                                            color: Colors.white54,
                                            size: 20,
                                          ),),
                                          Text("Songs",style: TextStyle(fontSize: 23,fontWeight: FontWeight.bold,color: Color.fromARGB(255, 255, 255, 255)),),
                                          Text(""),
                                  ],),
                  ),
              ListView.builder(itemCount: SongList.length,shrinkWrap: true,physics: NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return Stack(children: [songCard(SongList[index], context), ],);})  ],
              ),
            ),
          ),
        ],
      ),
    );
  }
  
  Widget songCard(
  SongsModel songs,
  BuildContext context,
) {
  return InkWell(
      child: Column(
        children: [Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: Divider(thickness: 1,color: Colors.white54,),
                                ),
          Center(
            child: Container(
             
              margin: EdgeInsets.only(left:20,top:5,bottom: 5),
              child: Row(mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.07,
                        height: MediaQuery.of(context).size.height * 0.07,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          shape: BoxShape.rectangle,
                          image: DecorationImage(
                              image: AssetImage("assets/icons/play.png"),
                              fit: BoxFit.contain),
                        ),
                      ),
                      ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(songs.title,style: TextStyle(color:Color.fromARGB(246, 255, 255, 255)),textAlign:TextAlign.start , 
                    // Align(
                    //   alignment: Alignment.center,
                    //   child: Container(
                    //       width: MediaQuery.of(context).size.width * 6.0,
                    //       height: MediaQuery.of(context).size.height * 0.7,
                    //       child: Text(
                    //         story.title,
                    //         textAlign: TextAlign.center,
                    //         style:
                    //             Theme.of(context).textTheme.headline6!.copyWith(
                    //                   color: Colors.black,
                    //                   fontSize: 12,
                    //                 ),
                    //       )),
                    // ),
                    
                  ),
                ),
               
                ],
              ),
            ),
          ),
        ],
      ),
      onTap: () {
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