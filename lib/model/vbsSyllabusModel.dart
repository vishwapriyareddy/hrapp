class VbsSyllabusModel{
 static List<VbsSyllabusModel> getVbsSyllabusModel() => [
        VbsSyllabusModel(
          "Beginner",
          "4,5 years",
          ),
        VbsSyllabusModel(
          "Primary",
          "6,7,8 years", 
            ),
        VbsSyllabusModel(
          "Junior",
          "9,10,11 years",
           ),
        VbsSyllabusModel(
          "Intermediate",
          "12,13,14 years",
           ),
        VbsSyllabusModel(
          "Senior",
          "15,16,17 years",
           ),
        VbsSyllabusModel(
          "Super Senior",
          "18+ years",
           ),     
      ];
  String title;
  String age;
 
  VbsSyllabusModel(this.title, this.age, );
}
