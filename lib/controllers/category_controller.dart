import 'package:FoodRecipe/models/category_model.dart';
import 'package:FoodRecipe/services/remote_services.dart';
import 'package:get/state_manager.dart';

class CategoryController extends GetxController{
  var categorylist = Food().obs;
  var isLoading=true.obs;

  @override
  void onInit(){
    fetchCategory();
    super.onInit();

  }
  void fetchCategory() async{
    try {
      isLoading(true);
      var categories = await RemoteServices.fetchCategory();
      if(categories!= null){
        categorylist.value = categories;
      }
    } finally{
      isLoading(false);
    }
  }

}