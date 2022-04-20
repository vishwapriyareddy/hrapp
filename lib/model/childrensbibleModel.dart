

class ChildrensBibleModel{
  static List<ChildrensBibleModel> getChildModel() => [
    ChildrensBibleModel("assets/images/135146.jpg","Old Testament",),
    ChildrensBibleModel("assets/images/135184.jpg","New Testament"),
  ]; 
   
  String urlImage;
 String title;
 
  ChildrensBibleModel( this.urlImage,this.title );
}