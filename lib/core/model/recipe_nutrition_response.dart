
class RecipeNutritionResponse {
  String? calories;
  String? carbs;
  String? fat;
  String? protein;
  List<Bad>? bad;
  List<Good>? good;
  List<Nutrients>? nutrients;
  List<Properties>? properties;
  List<Flavonoids>? flavonoids;
  CaloricBreakdown? caloricBreakdown;
  WeightPerServing? weightPerServing;
  int? expires;
  bool? isStale;

  RecipeNutritionResponse({this.calories, this.carbs, this.fat, this.protein, this.bad, this.good, this.nutrients, this.properties, this.flavonoids, this.caloricBreakdown, this.weightPerServing, this.expires, this.isStale});

  RecipeNutritionResponse.fromJson(Map<String, dynamic> json) {
    if(json["calories"] is String) {
      calories = json["calories"];
    }
    if(json["carbs"] is String) {
      carbs = json["carbs"];
    }
    if(json["fat"] is String) {
      fat = json["fat"];
    }
    if(json["protein"] is String) {
      protein = json["protein"];
    }
    if(json["bad"] is List) {
      bad = json["bad"] == null ? null : (json["bad"] as List).map((e) => Bad.fromJson(e)).toList();
    }
    if(json["good"] is List) {
      good = json["good"] == null ? null : (json["good"] as List).map((e) => Good.fromJson(e)).toList();
    }
    if(json["nutrients"] is List) {
      nutrients = json["nutrients"] == null ? null : (json["nutrients"] as List).map((e) => Nutrients.fromJson(e)).toList();
    }
    if(json["properties"] is List) {
      properties = json["properties"] == null ? null : (json["properties"] as List).map((e) => Properties.fromJson(e)).toList();
    }
    if(json["flavonoids"] is List) {
      flavonoids = json["flavonoids"] == null ? null : (json["flavonoids"] as List).map((e) => Flavonoids.fromJson(e)).toList();
    }
    if(json["caloricBreakdown"] is Map) {
      caloricBreakdown = json["caloricBreakdown"] == null ? null : CaloricBreakdown.fromJson(json["caloricBreakdown"]);
    }
    if(json["weightPerServing"] is Map) {
      weightPerServing = json["weightPerServing"] == null ? null : WeightPerServing.fromJson(json["weightPerServing"]);
    }
    if(json["expires"] is int) {
      expires = json["expires"];
    }
    if(json["isStale"] is bool) {
      isStale = json["isStale"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["calories"] = calories;
    data["carbs"] = carbs;
    data["fat"] = fat;
    data["protein"] = protein;
    if(bad != null) {
      data["bad"] = bad?.map((e) => e.toJson()).toList();
    }
    if(good != null) {
      data["good"] = good?.map((e) => e.toJson()).toList();
    }
    if(nutrients != null) {
      data["nutrients"] = nutrients?.map((e) => e.toJson()).toList();
    }
    if(properties != null) {
      data["properties"] = properties?.map((e) => e.toJson()).toList();
    }
    if(flavonoids != null) {
      data["flavonoids"] = flavonoids?.map((e) => e.toJson()).toList();
    }
    if(caloricBreakdown != null) {
      data["caloricBreakdown"] = caloricBreakdown?.toJson();
    }
    if(weightPerServing != null) {
      data["weightPerServing"] = weightPerServing?.toJson();
    }
    data["expires"] = expires;
    data["isStale"] = isStale;
    return data;
  }
}

class WeightPerServing {
  int? amount;
  String? unit;

  WeightPerServing({this.amount, this.unit});

  WeightPerServing.fromJson(Map<String, dynamic> json) {
    if(json["amount"] is int) {
      amount = json["amount"];
    }
    if(json["unit"] is String) {
      unit = json["unit"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["amount"] = amount;
    data["unit"] = unit;
    return data;
  }
}

class CaloricBreakdown {
  double? percentFat;
  double? percentCarbs;
  double? percentProtein;

  CaloricBreakdown({this.percentFat, this.percentCarbs, this.percentProtein});

  CaloricBreakdown.fromJson(Map<String, dynamic> json) {
    if(json["percentFat"] is double) {
      percentFat = json["percentFat"];
    }
    if(json["percentCarbs"] is double) {
      percentCarbs = json["percentCarbs"];
    }
    if(json["percentProtein"] is double) {
      percentProtein = json["percentProtein"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["percentFat"] = percentFat;
    data["percentCarbs"] = percentCarbs;
    data["percentProtein"] = percentProtein;
    return data;
  }
}


class Nutrients1 {
  String? name;
  double? amount;
  String? unit;
  int? percentOfDailyNeeds;

  Nutrients1({this.name, this.amount, this.unit, this.percentOfDailyNeeds});

  Nutrients1.fromJson(Map<String, dynamic> json) {
    if(json["name"] is String) {
      name = json["name"];
    }
    if(json["amount"] is double) {
      amount = json["amount"];
    }
    if(json["unit"] is String) {
      unit = json["unit"];
    }
    if(json["percentOfDailyNeeds"] is int) {
      percentOfDailyNeeds = json["percentOfDailyNeeds"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["name"] = name;
    data["amount"] = amount;
    data["unit"] = unit;
    data["percentOfDailyNeeds"] = percentOfDailyNeeds;
    return data;
  }
}

class Flavonoids {
  String? name;
  double? amount;
  String? unit;

  Flavonoids({this.name, this.amount, this.unit});

  Flavonoids.fromJson(Map<String, dynamic> json) {
    if(json["name"] is String) {
      name = json["name"];
    }
    if(json["amount"] is double) {
      amount = json["amount"];
    }
    if(json["unit"] is String) {
      unit = json["unit"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["name"] = name;
    data["amount"] = amount;
    data["unit"] = unit;
    return data;
  }
}

class Properties {
  String? name;
  double? amount;
  String? unit;

  Properties({this.name, this.amount, this.unit});

  Properties.fromJson(Map<String, dynamic> json) {
    if(json["name"] is String) {
      name = json["name"];
    }
    if(json["amount"] is double) {
      amount = json["amount"];
    }
    if(json["unit"] is String) {
      unit = json["unit"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["name"] = name;
    data["amount"] = amount;
    data["unit"] = unit;
    return data;
  }
}

class Nutrients {
  String? name;
  double? amount;
  String? unit;
  double? percentOfDailyNeeds;

  Nutrients({this.name, this.amount, this.unit, this.percentOfDailyNeeds});

  Nutrients.fromJson(Map<String, dynamic> json) {
    if(json["name"] is String) {
      name = json["name"];
    }
    if(json["amount"] is double) {
      amount = json["amount"];
    }
    if(json["unit"] is String) {
      unit = json["unit"];
    }
    if(json["percentOfDailyNeeds"] is double) {
      percentOfDailyNeeds = json["percentOfDailyNeeds"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["name"] = name;
    data["amount"] = amount;
    data["unit"] = unit;
    data["percentOfDailyNeeds"] = percentOfDailyNeeds;
    return data;
  }
}

class Good {
  String? amount;
  bool? indented;
  String? title;
  double? percentOfDailyNeeds;

  Good({this.amount, this.indented, this.title, this.percentOfDailyNeeds});

  Good.fromJson(Map<String, dynamic> json) {
    if(json["amount"] is String) {
      amount = json["amount"];
    }
    if(json["indented"] is bool) {
      indented = json["indented"];
    }
    if(json["title"] is String) {
      title = json["title"];
    }
    if(json["percentOfDailyNeeds"] is double) {
      percentOfDailyNeeds = json["percentOfDailyNeeds"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["amount"] = amount;
    data["indented"] = indented;
    data["title"] = title;
    data["percentOfDailyNeeds"] = percentOfDailyNeeds;
    return data;
  }
}

class Bad {
  String? amount;
  bool? indented;
  String? title;
  double? percentOfDailyNeeds;

  Bad({this.amount, this.indented, this.title, this.percentOfDailyNeeds});

  Bad.fromJson(Map<String, dynamic> json) {
    if(json["amount"] is String) {
      amount = json["amount"];
    }
    if(json["indented"] is bool) {
      indented = json["indented"];
    }
    if(json["title"] is String) {
      title = json["title"];
    }
    if(json["percentOfDailyNeeds"] is double) {
      percentOfDailyNeeds = json["percentOfDailyNeeds"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["amount"] = amount;
    data["indented"] = indented;
    data["title"] = title;
    data["percentOfDailyNeeds"] = percentOfDailyNeeds;
    return data;
  }
}