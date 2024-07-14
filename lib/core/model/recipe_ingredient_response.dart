
class RecipeIngredientResponse {
  List<Ingredients>? ingredients;

  RecipeIngredientResponse({this.ingredients});

  RecipeIngredientResponse.fromJson(Map<String, dynamic> json) {
    if(json["ingredients"] is List) {
      ingredients = json["ingredients"] == null ? null : (json["ingredients"] as List).map((e) => Ingredients.fromJson(e)).toList();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if(ingredients != null) {
      data["ingredients"] = ingredients?.map((e) => e.toJson()).toList();
    }
    return data;
  }
}

class Ingredients {
  String? name;
  String? image;
  Amount? amount;

  Ingredients({this.name, this.image, this.amount});

  Ingredients.fromJson(Map<String, dynamic> json) {
    if(json["name"] is String) {
      name = json["name"];
    }
    if(json["image"] is String) {
      image = json["image"];
    }
    if(json["amount"] is Map) {
      amount = json["amount"] == null ? null : Amount.fromJson(json["amount"]);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["name"] = name;
    data["image"] = image;
    if(amount != null) {
      data["amount"] = amount?.toJson();
    }
    return data;
  }
}

class Amount {
  Metric? metric;
  Us? us;

  Amount({this.metric, this.us});

  Amount.fromJson(Map<String, dynamic> json) {
    if(json["metric"] is Map) {
      metric = json["metric"] == null ? null : Metric.fromJson(json["metric"]);
    }
    if(json["us"] is Map) {
      us = json["us"] == null ? null : Us.fromJson(json["us"]);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if(metric != null) {
      data["metric"] = metric?.toJson();
    }
    if(us != null) {
      data["us"] = us?.toJson();
    }
    return data;
  }
}

class Us {
  int? value;
  String? unit;

  Us({this.value, this.unit});

  Us.fromJson(Map<String, dynamic> json) {
    if(json["value"] is int) {
      value = json["value"];
    }
    if(json["unit"] is String) {
      unit = json["unit"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["value"] = value;
    data["unit"] = unit;
    return data;
  }
}

class Metric {
  double? value;
  String? unit;

  Metric({this.value, this.unit});

  Metric.fromJson(Map<String, dynamic> json) {
    if(json["value"] is double) {
      value = json["value"];
    }
    if(json["unit"] is String) {
      unit = json["unit"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["value"] = value;
    data["unit"] = unit;
    return data;
  }
}