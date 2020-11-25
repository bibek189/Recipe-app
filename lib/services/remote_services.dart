import 'package:FoodRecipe/models/category_model.dart';
import 'package:FoodRecipe/models/category_food_list_model.dart';
import 'package:http/http.dart' as http;
import 'package:FoodRecipe/models/recipe_detail_model.dart';
import 'package:FoodRecipe/models/search_results_model.dart';

class RemoteServices{
  static var client = http.Client();
  static Future<Food> fetchCategory() async{
    var response = await client.get('https://www.themealdb.com/api/json/v1/1/categories.php');
    if(response.statusCode==200){
      var jsonString = response.body;
       return foodFromJson(jsonString);
    }else{
      return null;
    }
  }

  static Future<FoodList> fetchCategoryFood(String name) async{
    
    var response = await client.get('https://www.themealdb.com/api/json/v1/1/filter.php?c='+name);
    if(response.statusCode==200){
      var jsonString1 = response.body;
      
      return foodListFromJson(jsonString1);
      
    }
    else{
      return null;
    }
  }
  static Future <RecipeDetail> fetchRecipeDetail(String id)async{
    var response = await client.get('https://www.themealdb.com/api/json/v1/1/lookup.php?i='+id.toString());
    print(id);
    if(response.statusCode==200){
      var jsonString2 = response.body;
      print(response.body);
      return recipeDetailFromJson(jsonString2);
    }
    else{
      return null;
    }
  }
  static Future <SearchResults> fetchSearchReults( String nameee) async{
    var response = await client.get('https://www.themealdb.com/api/json/v1/1/search.php?s='+nameee.toString());
    if(response.statusCode == 200){
      var jsonString3 = response.body;
      return searchResultsFromJson(jsonString3);

    }
    else{
      return null;
    }
  }
}