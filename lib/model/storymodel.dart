class StoryModel {
  static List<StoryModel> getStoryModel() => [
        StoryModel(
            "OLD Testament Stories",
            "assets/images/revived-bible-thee-ten-thou-of.png",
          ),
        StoryModel(
            "NEW Testament Stories",
            "assets/images/03_FB_ISC_Easter.png",
            
            ),
        StoryModel(
          "General Moral Stories",
          "assets/images/A-Boys-Struggle-Against-Child-Labour-in-India.png",
          //["Blue Collar", "White Collar"],
          //[
            //"1 BHK",
          //   "2 BHK",
          //   "3 BHK",
          //   "4 BHK",
          //   "5 BHK",
          //   "Villa(3000 sq ft)",
          //   "Villa(4000 sq ft)",
          // ]
          
        //  "https://images.unsplash.com/photo-1581578731548-c64695cc6952?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8Y2xlYW5pbmd8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
         // [2000, 3000, 4000, 5000, 6000, 7000, 8000],
        ),
      
      ];
  String title;
  String urlImage;
 // String image;
 // List<double> offerPrice;
 // List<String> categories;
  //List<String> listName;
  StoryModel(this.title, this.urlImage, );
}