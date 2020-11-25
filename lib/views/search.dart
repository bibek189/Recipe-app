//import 'package:FoodRecipe/views/recipe_deatil.dart';
import 'package:FoodRecipe/views/recipe_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:FoodRecipe/controllers/search_controller.dart';
import 'package:FoodRecipe/controllers/recipe_details_controller.dart';

class DataSearch extends SearchDelegate<String> {
  final recent = [
    'chicken',
    'beef',
    'pork',
    'cake',
  ];
  get a => query;
  final searchResultsController = Get.put(SearchResultsController());
  final foodRecipeController = Get.put(RecipeDetailController());
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = '';
          }),
      IconButton(
          icon: Icon(Icons.search),
          onPressed: () {
            searchResultsController.fetchSearchReults(a);
            showResults(context);
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    bool loading = false;
    var a = MediaQuery.of(context).orientation;
    if (a == Orientation.landscape) {
      loading = true;
    }
    return Expanded(
      child: Obx(() {
        return searchResultsController.isLoading.value
            ? Center(
                child: CircularProgressIndicator(
                  strokeWidth: 40,
                ),
              )
            : StaggeredGridView.countBuilder(
                crossAxisCount: loading ? 4 : 2,
                itemCount:
                    searchResultsController.searchResults.value.meals.length,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                itemBuilder: (context, index) {
                   if(searchResultsController.searchResults.value.meals.length>0){return InkWell(
                    onTap: () {
                      foodRecipeController.fetchRecipeDetail(
                          searchResultsController
                              .searchResults.value.meals[index]['idMeal']
                              .toString());
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RecipeDetailPage(
                                    name: searchResultsController.searchResults
                                        .value.meals[index]['strMeal'],
                                  )));
                    },
                    child: SearchTile(
                      id: searchResultsController
                          .searchResults.value.meals[index]['idMeal'],
                      name: searchResultsController
                          .searchResults.value.meals[index]['strMeal'],
                      image: searchResultsController
                          .searchResults.value.meals[index]['strMealThumb'],
                    ),
                  );}
                  else{
                    return Center(child:Text("No recipe matched your search"));
                  }
                },
                staggeredTileBuilder: (index) => StaggeredTile.fit(1));
      }),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty ? recent : recent;
    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        onTap: () {
          searchResultsController.fetchSearchReults(suggestionList[index]);
            showResults(context);
        },
        leading: Icon(Icons.fastfood),
        title: Text(suggestionList[index]),
      ),
      itemCount: suggestionList.length,
    );
  }
}

class SearchTile extends StatelessWidget {
  final String id;
  final String name;
  final String image;
  SearchTile({this.id, this.name, this.image});
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: 180,
                  width: double.infinity,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Image.network(
                    image,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            Text(
              name,
              maxLines: 2,
              style:
                  TextStyle(fontFamily: 'avenir', fontWeight: FontWeight.w800),
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
