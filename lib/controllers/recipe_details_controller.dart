import 'package:FoodRecipe/models/recipe_detail_model.dart';
import 'package:FoodRecipe/services/remote_services.dart';
import 'package:get/state_manager.dart';

class RecipeDetailController extends GetxController{
  var recipeDetail = RecipeDetail().obs;
  var isLoading=true.obs;

  void fetchRecipeDetail(String idd) async{
        String a = idd;
    try{
      isLoading(true);

      var detail = await RemoteServices.fetchRecipeDetail(a);
      if(detail!=null){
        recipeDetail.value = detail;
        print(recipeDetail);
        print('aaaaa');
      }
    }
    finally{
      isLoading(false);
    }
  }
}
