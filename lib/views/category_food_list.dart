import 'package:FoodRecipe/controllers/category_food_list_controller.dart';
import 'package:FoodRecipe/controllers/recipe_details_controller.dart';
import 'package:FoodRecipe/views/food_tile.dart';
//import 'package:FoodRecipe/views/recipe_deatil.dart';
import 'package:FoodRecipe/views/recipe_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:FoodRecipe/controllers/internet_connection_controller.dart';

class CategoryFood extends StatelessWidget {
  final String name;
  CategoryFood({
    this.name,
  });
  final categoryFoodListController = Get.put(CategoryFoodController());
  final foodRecipeController = Get.put(RecipeDetailController());
  final InternetController internetController = Get.put(InternetController());
  @override
  Widget build(BuildContext context) {
    bool loading = false;
    var a = MediaQuery.of(context).orientation;
    if (a == Orientation.landscape) {
      loading = true;
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text(
          "$name",
          style: TextStyle(
              fontFamily: 'avenir', fontSize: 32, fontWeight: FontWeight.w900),
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(child: Obx(() {
            return internetController.isLoading.value
                ? categoryFoodListController.isLoading.value
                    ? Center(
                        child: CircularProgressIndicator(
                          strokeWidth: 40,
                        ),
                      )
                    : StaggeredGridView.countBuilder(
                        crossAxisCount: loading ? 4 : 2,
                        itemCount: categoryFoodListController
                            .categoryFoodList.value.meals.length,
                        mainAxisSpacing: 16,
                        crossAxisSpacing: 16,
                        itemBuilder: (context, index) {
                          return InkWell(
                              onTap: () {
                                internetController.getConnect();
                                foodRecipeController.fetchRecipeDetail(
                                    categoryFoodListController.categoryFoodList
                                        .value.meals[index].idMeal
                                        .toString());
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => RecipeDetailPage(
                                              name: categoryFoodListController
                                                  .categoryFoodList
                                                  .value
                                                  .meals[index]
                                                  .strMeal,
                                            )));
                              },
                              child: FoodTile(
                                  meal: categoryFoodListController
                                      .categoryFoodList.value.meals[index]));
                        },
                        staggeredTileBuilder: (index) => StaggeredTile.fit(1))
                : Center(
                    child: Text("No internet connection"),
                  );
          }))
        ],
      ),
    );
  }
}
