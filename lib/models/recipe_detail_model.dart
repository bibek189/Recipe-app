// To parse this JSON data, do
//
//     final recipeDetail = recipeDetailFromJson(jsonString);

import 'dart:convert';

RecipeDetail recipeDetailFromJson(String str) => RecipeDetail.fromJson(json.decode(str));

String recipeDetailToJson(RecipeDetail data) => json.encode(data.toJson());

class RecipeDetail {
    RecipeDetail({
        this.meals,
    });

    List<Map<String, String>> meals;

    factory RecipeDetail.fromJson(Map<String, dynamic> json) => RecipeDetail(
        meals: List<Map<String, String>>.from(json["meals"].map((x) => Map.from(x).map((k, v) => MapEntry<String, String>(k, v == null ? null : v)))),
    );

    Map<String, dynamic> toJson() => {
        "meals": List<dynamic>.from(meals.map((x) => Map.from(x).map((k, v) => MapEntry<String, dynamic>(k, v == null ? null : v)))),
    };
}
