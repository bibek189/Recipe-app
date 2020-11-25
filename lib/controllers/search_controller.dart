import 'package:FoodRecipe/models/search_results_model.dart';
import 'package:FoodRecipe/services/remote_services.dart';
import 'package:get/state_manager.dart';

class SearchResultsController extends GetxController{
  var searchResults = SearchResults().obs;
    var isLoading=true.obs;

  void fetchSearchReults(String name) async{
        String namee = name;
    try{
      isLoading(true);

      var detail = await RemoteServices.fetchSearchReults(namee);
      if(detail!=null){
        searchResults.value = detail;
        print(searchResults);
        print('aaaaa');
      }
    }
    finally{
      isLoading(false);
    }
  }
}