
class RecipeInstructionResponse {
  String? name;
  List<Steps>? steps;

  RecipeInstructionResponse({this.name, this.steps});

  RecipeInstructionResponse.fromJson(Map<String, dynamic> json) {
    if(json["name"] is String) {
      name = json["name"];
    }
    if(json["steps"] is List) {
      steps = json["steps"] == null ? null : (json["steps"] as List).map((e) => Steps.fromJson(e)).toList();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["name"] = name;
    if(steps != null) {
      data["steps"] = steps?.map((e) => e.toJson()).toList();
    }
    return data;
  }
}

class Steps {
  int? number;
  String? step;
  List<dynamic>? ingredients;
  List<Equipment>? equipment;

  Steps({this.number, this.step, this.ingredients, this.equipment});

  Steps.fromJson(Map<String, dynamic> json) {
    if(json["number"] is int) {
      number = json["number"];
    }
    if(json["step"] is String) {
      step = json["step"];
    }
    if(json["ingredients"] is List) {
      ingredients = json["ingredients"] ?? [];
    }
    if(json["equipment"] is List) {
      equipment = json["equipment"] == null ? null : (json["equipment"] as List).map((e) => Equipment.fromJson(e)).toList();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["number"] = number;
    data["step"] = step;
    if(ingredients != null) {
      data["ingredients"] = ingredients;
    }
    if(equipment != null) {
      data["equipment"] = equipment?.map((e) => e.toJson()).toList();
    }
    return data;
  }
}

class Equipment {
  int? id;
  String? name;
  String? localizedName;
  String? image;

  Equipment({this.id, this.name, this.localizedName, this.image});

  Equipment.fromJson(Map<String, dynamic> json) {
    if(json["id"] is int) {
      id = json["id"];
    }
    if(json["name"] is String) {
      name = json["name"];
    }
    if(json["localizedName"] is String) {
      localizedName = json["localizedName"];
    }
    if(json["image"] is String) {
      image = json["image"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["name"] = name;
    data["localizedName"] = localizedName;
    data["image"] = image;
    return data;
  }
}