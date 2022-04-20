class OldTestamentModel{
 static List<OldTestamentModel> getChildModel() => [
   OldTestamentModel("assets/images/750x750bb.jpeg","In the Begining","Creation Of World","1","24",),
   OldTestamentModel("assets/images/maxresdefault.jpg","The First Sin","The Fall","31","24",),
   OldTestamentModel("assets/images/boat.jpg","Two By Two","Noah and The Flood","55","31")

 ];
   String images;
  String mainTitle;
  String subTitle;
  String start;
  String end;
   OldTestamentModel(this.images,this.mainTitle,this.subTitle,this.start,this.end );
}