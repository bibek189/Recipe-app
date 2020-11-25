import 'package:flutter/material.dart';
import 'package:FoodRecipe/controllers/recipe_details_controller.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:FoodRecipe/controllers/internet_connection_controller.dart';


class RecipeDetailPage extends StatelessWidget {
  final String name;
  RecipeDetailPage({
    this.name,
  });
  final foodRecipeController = Get.put(RecipeDetailController());
  final internetController = Get.put(InternetController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: false,
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text('$name'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(child: Obx(() {
            return internetController.isLoading.value
                ? foodRecipeController.isLoading.value
                    ? Center(
                        child: CircularProgressIndicator(
                          strokeWidth: 35,
                        ),
                      )
                    : SingleChildScrollView(
                        child: Column(
                          children: <Widget>[
                            Container(
                              height: 180,
                              width: double.infinity,
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Image.network(
                                foodRecipeController.recipeDetail.value.meals[0]
                                    ['strMealThumb'],
                                fit: BoxFit.cover,
                              ),
                            ),
                            Row(children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Center(
                                  child: Text(
                                      "Area:" +
                                          foodRecipeController.recipeDetail
                                              .value.meals[0]['strArea'],
                                      style: TextStyle(
                                        fontFamily: 'avenir',
                                        fontSize: 18,
                                      )),
                                ),
                              ),
                            ]),
                            Divider(),
                            Text('Cooking Instructions',
                                style: TextStyle(
                                  fontFamily: 'avenir',
                                  color: Colors.red,
                                  fontSize: 20,
                                )),
                            Row(
                              children: <Widget>[
                                Expanded(
                                  child: Text(
                                      foodRecipeController.recipeDetail.value
                                          .meals[0]['strInstructions'],
                                      style: TextStyle(
                                        fontFamily: 'avenir',
                                        fontSize: 15,
                                      )),
                                )
                              ],
                            ),
                            Divider(),
                            Text('Ingredients Required',
                                style: TextStyle(
                                    fontFamily: 'avenir',
                                    fontSize: 20,
                                    color: Colors.red)),
                            Row(
                              children: <Widget>[
                                Expanded(
                                  child: Text(
                                      foodRecipeController.recipeDetail.value
                                              .meals[0]['strIngredient1'] ??
                                          "" + ' : ',
                                      style: TextStyle(
                                        fontFamily: 'avenir',
                                        fontSize: 15,
                                      )),
                                ),
                                Expanded(
                                  child: Text(
                                      foodRecipeController.recipeDetail.value
                                              .meals[0]['strMeasure1'] ??
                                          "",
                                      style: TextStyle(
                                        fontFamily: 'avenir',
                                        fontSize: 15,
                                      )),
                                ),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Expanded(
                                  child: Text(
                                      foodRecipeController.recipeDetail.value
                                              .meals[0]['strIngredient2'] ??
                                          "" + ' : ',
                                      style: TextStyle(
                                        fontFamily: 'avenir',
                                        fontSize: 15,
                                      )),
                                ),
                                Expanded(
                                  child: Text(
                                      foodRecipeController.recipeDetail.value
                                              .meals[0]['strMeasure2'] ??
                                          "",
                                      style: TextStyle(
                                        fontFamily: 'avenir',
                                        fontSize: 15,
                                      )),
                                ),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Expanded(
                                  child: Text(
                                      foodRecipeController.recipeDetail.value
                                              .meals[0]['strIngredient3'] ??
                                          "" + ' : ',
                                      style: TextStyle(
                                        fontFamily: 'avenir',
                                        fontSize: 15,
                                      )),
                                ),
                                Expanded(
                                  child: Text(
                                      foodRecipeController.recipeDetail.value
                                              .meals[0]['strMeasure3'] ??
                                          "",
                                      style: TextStyle(
                                        fontFamily: 'avenir',
                                        fontSize: 15,
                                      )),
                                ),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Expanded(
                                  child: Text(
                                      foodRecipeController.recipeDetail.value
                                              .meals[0]['strIngredient4'] ??
                                          "" + ' : ',
                                      style: TextStyle(
                                        fontFamily: 'avenir',
                                        fontSize: 15,
                                      )),
                                ),
                                Expanded(
                                  child: Text(
                                      foodRecipeController.recipeDetail.value
                                              .meals[0]['strMeasure4'] ??
                                          "",
                                      style: TextStyle(
                                        fontFamily: 'avenir',
                                        fontSize: 15,
                                      )),
                                ),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Expanded(
                                  child: Text(
                                      foodRecipeController.recipeDetail.value
                                              .meals[0]['strIngredient5'] ??
                                          "" + ' : ',
                                      style: TextStyle(
                                        fontFamily: 'avenir',
                                        fontSize: 15,
                                      )),
                                ),
                                Expanded(
                                  child: Text(
                                      foodRecipeController.recipeDetail.value
                                              .meals[0]['strMeasure5'] ??
                                          "",
                                      style: TextStyle(
                                        fontFamily: 'avenir',
                                        fontSize: 15,
                                      )),
                                ),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Expanded(
                                  child: Text(
                                      foodRecipeController.recipeDetail.value
                                              .meals[0]['strIngredient6'] ??
                                          "" + ' : ',
                                      style: TextStyle(
                                        fontFamily: 'avenir',
                                        fontSize: 15,
                                      )),
                                ),
                                Expanded(
                                  child: Text(
                                      foodRecipeController.recipeDetail.value
                                              .meals[0]['strMeasure6'] ??
                                          "",
                                      style: TextStyle(
                                        fontFamily: 'avenir',
                                        fontSize: 15,
                                      )),
                                ),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Expanded(
                                  child: Text(
                                      foodRecipeController.recipeDetail.value
                                              .meals[0]['strIngredient7'] ??
                                          "" + ' : ',
                                      style: TextStyle(
                                        fontFamily: 'avenir',
                                        fontSize: 15,
                                      )),
                                ),
                                Expanded(
                                  child: Text(
                                      foodRecipeController.recipeDetail.value
                                              .meals[0]['strMeasure7'] ??
                                          "",
                                      style: TextStyle(
                                        fontFamily: 'avenir',
                                        fontSize: 15,
                                      )),
                                ),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Expanded(
                                  child: Text(
                                      foodRecipeController.recipeDetail.value
                                              .meals[0]['strIngredient8'] ??
                                          "" + ' : ',
                                      style: TextStyle(
                                        fontFamily: 'avenir',
                                        fontSize: 15,
                                      )),
                                ),
                                Expanded(
                                  child: Text(
                                      foodRecipeController.recipeDetail.value
                                              .meals[0]['strMeasure9'] ??
                                          "",
                                      style: TextStyle(
                                        fontFamily: 'avenir',
                                        fontSize: 15,
                                      )),
                                ),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Expanded(
                                  child: Text(
                                      foodRecipeController.recipeDetail.value
                                              .meals[0]['strIngredient9'] ??
                                          "" + ' : ',
                                      style: TextStyle(
                                        fontFamily: 'avenir',
                                        fontSize: 15,
                                      )),
                                ),
                                Expanded(
                                  child: Text(
                                      foodRecipeController.recipeDetail.value
                                              .meals[0]['strMeasure9'] ??
                                          "",
                                      style: TextStyle(
                                        fontFamily: 'avenir',
                                        fontSize: 15,
                                      )),
                                ),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Expanded(
                                  child: Text(
                                      foodRecipeController.recipeDetail.value
                                              .meals[0]['strIngredient10'] ??
                                          "" + ' : ',
                                      style: TextStyle(
                                        fontFamily: 'avenir',
                                        fontSize: 15,
                                      )),
                                ),
                                Expanded(
                                  child: Text(
                                      foodRecipeController.recipeDetail.value
                                              .meals[0]['strMeasure10'] ??
                                          "",
                                      style: TextStyle(
                                        fontFamily: 'avenir',
                                        fontSize: 15,
                                      )),
                                ),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Expanded(
                                  child: Text(
                                      foodRecipeController.recipeDetail.value
                                              .meals[0]['strIngredient11'] ??
                                          "" + ' : ',
                                      style: TextStyle(
                                        fontFamily: 'avenir',
                                        fontSize: 15,
                                      )),
                                ),
                                Expanded(
                                  child: Text(
                                      foodRecipeController.recipeDetail.value
                                              .meals[0]['strMeasure11'] ??
                                          "",
                                      style: TextStyle(
                                        fontFamily: 'avenir',
                                        fontSize: 15,
                                      )),
                                ),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Expanded(
                                  child: Text(
                                      foodRecipeController.recipeDetail.value
                                              .meals[0]['strIngredient12'] ??
                                          "" + ' : ',
                                      style: TextStyle(
                                        fontFamily: 'avenir',
                                        fontSize: 15,
                                      )),
                                ),
                                Expanded(
                                  child: Text(
                                      foodRecipeController.recipeDetail.value
                                              .meals[0]['strMeasure12'] ??
                                          "",
                                      style: TextStyle(
                                        fontFamily: 'avenir',
                                        fontSize: 15,
                                      )),
                                ),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Expanded(
                                  child: Text(
                                      foodRecipeController.recipeDetail.value
                                              .meals[0]['strIngredient13'] ??
                                          "" + ' : ',
                                      style: TextStyle(
                                        fontFamily: 'avenir',
                                        fontSize: 15,
                                      )),
                                ),
                                Expanded(
                                  child: Text(
                                      foodRecipeController.recipeDetail.value
                                              .meals[0]['strMeasure13'] ??
                                          "",
                                      style: TextStyle(
                                        fontFamily: 'avenir',
                                        fontSize: 15,
                                      )),
                                ),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Expanded(
                                  child: Text(
                                      foodRecipeController.recipeDetail.value
                                              .meals[0]['strIngredient14'] ??
                                          "" + ' : ',
                                      style: TextStyle(
                                        fontFamily: 'avenir',
                                        fontSize: 15,
                                      )),
                                ),
                                Expanded(
                                  child: Text(
                                      foodRecipeController.recipeDetail.value
                                              .meals[0]['strMeasure14'] ??
                                          "",
                                      style: TextStyle(
                                        fontFamily: 'avenir',
                                        fontSize: 15,
                                      )),
                                ),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Expanded(
                                  child: Text(
                                      foodRecipeController.recipeDetail.value
                                              .meals[0]['strIngredient15'] ??
                                          "" + ' : ',
                                      style: TextStyle(
                                        fontFamily: 'avenir',
                                        fontSize: 15,
                                      )),
                                ),
                                Expanded(
                                  child: Text(
                                      foodRecipeController.recipeDetail.value
                                              .meals[0]['strMeasure15'] ??
                                          "",
                                      style: TextStyle(
                                        fontFamily: 'avenir',
                                        fontSize: 15,
                                      )),
                                ),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Expanded(
                                  child: Text(
                                      foodRecipeController.recipeDetail.value
                                              .meals[0]['strIngredient16'] ??
                                          "" + ' : ',
                                      style: TextStyle(
                                        fontFamily: 'avenir',
                                        fontSize: 15,
                                      )),
                                ),
                                Expanded(
                                  child: Text(
                                      foodRecipeController.recipeDetail.value
                                              .meals[0]['strMeasure16'] ??
                                          "",
                                      style: TextStyle(
                                        fontFamily: 'avenir',
                                        fontSize: 15,
                                      )),
                                ),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Expanded(
                                  child: Text(
                                      foodRecipeController.recipeDetail.value
                                              .meals[0]['strIngredient17'] ??
                                          "" + ' : ',
                                      style: TextStyle(
                                        fontFamily: 'avenir',
                                        fontSize: 15,
                                      )),
                                ),
                                Expanded(
                                  child: Text(
                                      foodRecipeController.recipeDetail.value
                                              .meals[0]['strMeasure17'] ??
                                          "",
                                      style: TextStyle(
                                        fontFamily: 'avenir',
                                        fontSize: 15,
                                      )),
                                ),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Expanded(
                                  child: Text(
                                      foodRecipeController.recipeDetail.value
                                              .meals[0]['strIngredient18'] ??
                                          "" + ' : ',
                                      style: TextStyle(
                                        fontFamily: 'avenir',
                                        fontSize: 15,
                                      )),
                                ),
                                Expanded(
                                  child: Text(
                                      foodRecipeController.recipeDetail.value
                                              .meals[0]['strMeasure18'] ??
                                          "",
                                      style: TextStyle(
                                        fontFamily: 'avenir',
                                        fontSize: 15,
                                      )),
                                ),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Expanded(
                                  child: Text(
                                      foodRecipeController.recipeDetail.value
                                              .meals[0]['strIngredient19'] ??
                                          "" + ' : ',
                                      style: TextStyle(
                                        fontFamily: 'avenir',
                                        fontSize: 15,
                                      )),
                                ),
                                Expanded(
                                  child: Text(
                                      foodRecipeController.recipeDetail.value
                                              .meals[0]['strMeasure19'] ??
                                          "",
                                      style: TextStyle(
                                        fontFamily: 'avenir',
                                        fontSize: 15,
                                      )),
                                ),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Expanded(
                                  child: Text(
                                      foodRecipeController.recipeDetail.value
                                              .meals[0]['strIngredient20'] ??
                                          "" + ' : ',
                                      style: TextStyle(
                                        fontFamily: 'avenir',
                                        fontSize: 15,
                                      )),
                                ),
                                Expanded(
                                  child: Text(
                                      foodRecipeController.recipeDetail.value
                                              .meals[0]['strMeasure20'] ??
                                          "",
                                      style: TextStyle(
                                        fontFamily: 'avenir',
                                        fontSize: 15,
                                      )),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                : Center(
                    child: Text("No internet Connection"),
                  );
          })),
        ],
      ),
      bottomNavigationBar: Row(
        children: <Widget>[
          Expanded(
              child: RaisedButton(
            color: Colors.red,
            onPressed: () async {
              var url = foodRecipeController.recipeDetail.value.meals[0]
                  ['strYoutube'];
              if (await canLaunch(url)) {
                await launch(url);
              } else {
                throw 'Could not launch $url';
              }
            },
            child: Text('Watch Video',style: TextStyle(color:Colors.white),),
          )),
          Expanded(
              child: RaisedButton(
            color: Colors.blue,
            onPressed: () async {
              var url =
                  foodRecipeController.recipeDetail.value.meals[0]['strSource'];
              if (await canLaunch(url)) {
                await launch(url);
              } else {
                throw 'Could not launch $url';
              }
            },
            child: Text('Go to Source',style: TextStyle(color:Colors.white)),
          )),
        ],
      ),
    );
  }
}
