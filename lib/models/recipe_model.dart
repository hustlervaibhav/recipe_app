class RecipeModel {
  List<Recipes>? recipes;
  int? total;
  int? skip;
  int? limit;

  RecipeModel(
      {this.recipes,
      this.total,
      this.skip,
      this.limit});

  RecipeModel.fromJson(
      Map<String, dynamic> json) {
    if (json["recipes"] is List) {
      recipes = json["recipes"] == null
          ? null
          : (json["recipes"] as List)
              .map((e) => Recipes.fromJson(e))
              .toList();
    }
    if (json["total"] is int) {
      total = json["total"];
    }
    if (json["skip"] is int) {
      skip = json["skip"];
    }
    if (json["limit"] is int) {
      limit = json["limit"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data =
        <String, dynamic>{};
    if (recipes != null) {
      _data["recipes"] = recipes
          ?.map((e) => e.toJson())
          .toList();
    }
    _data["total"] = total;
    _data["skip"] = skip;
    _data["limit"] = limit;
    return _data;
  }
}

class Recipes {
  int? id;
  String? name;
  List<String>? ingredients;
  List<String>? instructions;
  int? prepTimeMinutes;
  int? cookTimeMinutes;
  int? servings;
  String? difficulty;
  String? cuisine;
  int? caloriesPerServing;
  List<String>? tags;
  int? userId;
  String? image;
  double? rating;
  int? reviewCount;
  List<String>? mealType;

  Recipes(
      {this.id,
      this.name,
      this.ingredients,
      this.instructions,
      this.prepTimeMinutes,
      this.cookTimeMinutes,
      this.servings,
      this.difficulty,
      this.cuisine,
      this.caloriesPerServing,
      this.tags,
      this.userId,
      this.image,
      this.rating,
      this.reviewCount,
      this.mealType});

  Recipes.fromJson(Map<String, dynamic> json) {
    if (json["id"] is int) {
      id = json["id"];
    }
    if (json["name"] is String) {
      name = json["name"];
    }
    if (json["ingredients"] is List) {
      ingredients = json["ingredients"] == null
          ? null
          : List<String>.from(
              json["ingredients"]);
    }
    if (json["instructions"] is List) {
      instructions = json["instructions"] == null
          ? null
          : List<String>.from(
              json["instructions"]);
    }
    if (json["prepTimeMinutes"] is int) {
      prepTimeMinutes = json["prepTimeMinutes"];
    }
    if (json["cookTimeMinutes"] is int) {
      cookTimeMinutes = json["cookTimeMinutes"];
    }
    if (json["servings"] is int) {
      servings = json["servings"];
    }
    if (json["difficulty"] is String) {
      difficulty = json["difficulty"];
    }
    if (json["cuisine"] is String) {
      cuisine = json["cuisine"];
    }
    if (json["caloriesPerServing"] is int) {
      caloriesPerServing =
          json["caloriesPerServing"];
    }
    if (json["tags"] is List) {
      tags = json["tags"] == null
          ? null
          : List<String>.from(json["tags"]);
    }
    if (json["userId"] is int) {
      userId = json["userId"];
    }
    if (json["image"] is String) {
      image = json["image"];
    }
    if (json["rating"] is double) {
      rating = json["rating"];
    }
    if (json["reviewCount"] is int) {
      reviewCount = json["reviewCount"];
    }
    if (json["mealType"] is List) {
      mealType = json["mealType"] == null
          ? null
          : List<String>.from(json["mealType"]);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data =
        <String, dynamic>{};
    _data["id"] = id;
    _data["name"] = name;
    if (ingredients != null) {
      _data["ingredients"] = ingredients;
    }
    if (instructions != null) {
      _data["instructions"] = instructions;
    }
    _data["prepTimeMinutes"] = prepTimeMinutes;
    _data["cookTimeMinutes"] = cookTimeMinutes;
    _data["servings"] = servings;
    _data["difficulty"] = difficulty;
    _data["cuisine"] = cuisine;
    _data["caloriesPerServing"] =
        caloriesPerServing;
    if (tags != null) {
      _data["tags"] = tags;
    }
    _data["userId"] = userId;
    _data["image"] = image;
    _data["rating"] = rating;
    _data["reviewCount"] = reviewCount;
    if (mealType != null) {
      _data["mealType"] = mealType;
    }
    return _data;
  }
}
