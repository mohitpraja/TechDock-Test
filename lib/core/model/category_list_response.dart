
class CategoryListResponse {
  List<CategoryList>? categoryList;

  CategoryListResponse({this.categoryList});

  CategoryListResponse.fromJson(Map<String, dynamic> json) {
    if(json["meals"] is List) {
      categoryList = json["meals"] == null ? null : (json["meals"] as List).map((e) => CategoryList.fromJson(e)).toList();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if(categoryList != null) {
      data["meals"] = categoryList?.map((e) => e.toJson()).toList();
    }
    return data;
  }
}

class CategoryList {
  String? strCategory;

  CategoryList({this.strCategory});

  CategoryList.fromJson(Map<String, dynamic> json) {
    if(json["strCategory"] is String) {
      strCategory = json["strCategory"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["strCategory"] = strCategory;
    return data;
  }
}