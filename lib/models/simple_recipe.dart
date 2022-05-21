class SimpleRecipe {
  String id;
  String dishImage;
  String title;
  String duration;
  String source;
  List<String> information;
  String details;
  List ingredients;
  List steps;


  SimpleRecipe({
    required this.id,
    required this.dishImage,
    required this.title,
    required this.duration,
    required this.source,
    required this.information,
    required this.details,
    required this.ingredients,
    required this.steps


  });

  factory SimpleRecipe.fromJson(Map<String, dynamic> json) {
    return SimpleRecipe(

      id: json['id'] as String,
      dishImage: json['dishImage'] as String,
      title: json['title'] as String,
      duration: json['duration'] as String,
      source: json['source'] as String,
      information: json['information'].cast<String>() as List<String>,
      details: json['details'] as String,
      ingredients: json['ingredients'].cast<String>() as List<String>,
      steps: json['steps'].cast<String>() as List<String>
    );
  }
}
