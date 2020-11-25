import 'package:FoodRecipe/models/category_food_list_model.dart';
import 'package:FoodRecipe/services/remote_services.dart';
import 'package:get/state_manager.dart';

class CategoryFoodController extends GetxController{
  var categoryFoodList = FoodList().obs;
  var isLoading=true.obs;


  void fetchCategoryFood(String name )async{
    String a = name;
    try{
      isLoading(true);

      var categoryFood = await RemoteServices.fetchCategoryFood(a);
      if(categoryFood!=null){
        categoryFoodList.value = categoryFood;
        print(categoryFoodList);
      }
    }
    finally{
      isLoading(false);
    }
  }
}