import 'package:FoodRecipe/controllers/category_controller.dart';
import 'package:FoodRecipe/controllers/category_food_list_controller.dart';
import 'package:FoodRecipe/views/category_food_list.dart';
import 'package:FoodRecipe/views/category_tile.dart';
import 'package:FoodRecipe/views/search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:FoodRecipe/controllers/internet_connection_controller.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomePage extends StatelessWidget {
  final CategoryController categoryController = Get.put(CategoryController());
  final CategoryFoodController categoryFoodController =
      Get.put(CategoryFoodController());
  final InternetController internetController = Get.put(InternetController());
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  @override
  Widget build(BuildContext context) {
    bool loading = false;
    var a = MediaQuery.of(context).orientation;
    if (a == Orientation.landscape) {
      loading = true;
    }
    void _onRefresh() async {
      // monitor network fetch
      await Future.delayed(Duration(milliseconds: 1000));
      // if failed,use refreshFailed()
      _refreshController.refreshCompleted();
      internetController.getConnect();
      categoryController.fetchCategory();
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SmartRefresher(
        enablePullDown: true,
        header: WaterDropHeader(),
        onRefresh: () => _onRefresh(),
        controller: _refreshController,
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      'Food Recipe',
                      style: TextStyle(
                          fontFamily: 'avenir',
                          fontSize: 32,
                          fontWeight: FontWeight.w900),
                    ),
                  ),
                  IconButton(
                      icon: Icon(Icons.search),
                      onPressed: () {
                        showSearch(context: context, delegate: DataSearch());
                      }),
                ],
              ),
            ),
            Expanded(
              child: Obx(() {
                return internetController.isLoading.value
                    ? categoryController.isLoading.value
                        ? Center(
                            child: CircularProgressIndicator(
                              strokeWidth: 40,
                            ),
                          )
                        : StaggeredGridView.countBuilder(
                            crossAxisCount: loading ? 4 : 2,
                            itemCount: categoryController
                                .categorylist.value.categories.length,
                            mainAxisSpacing: 16,
                            crossAxisSpacing: 16,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  internetController.getConnect();
                                  categoryFoodController.fetchCategoryFood(
                                      categoryController.categorylist.value
                                          .categories[index].strCategory);
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => CategoryFood(
                                                name: categoryController
                                                    .categorylist
                                                    .value
                                                    .categories[index]
                                                    .strCategory,
                                              )));
                                },
                                child: CategoryTile(categoryController
                                    .categorylist.value.categories[index]),
                              );
                            },
                            staggeredTileBuilder: (index) =>
                                StaggeredTile.fit(1))
                    : Center(child: Text("No Internet Connection."));
              }),
            ),
          ],
        ),
      ),
    );
  }
}
