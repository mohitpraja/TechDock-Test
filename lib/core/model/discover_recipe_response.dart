class DiscoverRecipeResponse {
  List<Meals>? meals;

  DiscoverRecipeResponse({this.meals});

  DiscoverRecipeResponse.fromJson(Map<String, dynamic> json) {
    if(json["meals"] is List) {
      meals = json["meals"] == null ? null : (json["meals"] as List).map((e) => Meals.fromJson(e)).toList();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if(meals != null) {
      data["meals"] = meals?.map((e) => e.toJson()).toList();
    }
    return data;
  }
}

class Meals {
  String? strMeal;
  String? strMealThumb;
  String? idMeal;

  Meals({this.strMeal, this.strMealThumb, this.idMeal});

  Meals.fromJson(Map<String, dynamic> json) {
    if(json["strMeal"] is String) {
      strMeal = json["strMeal"];
    }
    if(json["strMealThumb"] is String) {
      strMealThumb = json["strMealThumb"];
    }
    if(json["idMeal"] is String) {
      idMeal = json["idMeal"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["strMeal"] = strMeal;
    data["strMealThumb"] = strMealThumb;
    data["idMeal"] = idMeal;
    return data;
  }
}