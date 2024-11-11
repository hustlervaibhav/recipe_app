import 'dart:convert';
import "package:http/http.dart" as http;
import "package:recipe_app/models/recipe_model.dart";

recipesItems() async {
  Uri url =
      Uri.parse("https://dummyjson.com/recipes");
  var response = await http.get(url);
  if (response.statusCode == 200) {
    var data = RecipeModel.fromJson(
        jsonDecode(response.body)
            as Map<String, dynamic>);
    return data.recipes;
  } else {
    throw Exception("Error Occurred");
  }
}
