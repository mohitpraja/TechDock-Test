class SearchRecipeResponse {
  List<SearchResultList>? searchResultList;
  int? offset;
  int? number;
  int? totalResults;

  SearchRecipeResponse(
      {this.searchResultList, this.offset, this.number, this.totalResults});

  SearchRecipeResponse.fromJson(Map<String, dynamic> json) {
    if (json["results"] is List) {
      searchResultList = json["results"] == null
          ? null
          : (json["results"] as List)
              .map((e) => SearchResultList.fromJson(e))
              .toList();
    }
    if (json["offset"] is int) {
      offset = json["offset"];
    }
    if (json["number"] is int) {
      number = json["number"];
    }
    if (json["totalResults"] is int) {
      totalResults = json["totalResults"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (searchResultList != null) {
      data["results"] = searchResultList?.map((e) => e.toJson()).toList();
    }
    data["offset"] = offset;
    data["number"] = number;
    data["totalResults"] = totalResults;
    return data;
  }
}

class SearchResultList {
  int? id;
  String? title;
  String? image;
  String? imageType;
  bool? isFavourite;

  SearchResultList(
      {this.id, this.title, this.image, this.imageType, this.isFavourite});

  SearchResultList.fromJson(Map<String, dynamic> json) {
    if (json["id"] is int) {
      id = json["id"];
    }
    if (json["title"] is String) {
      title = json["title"];
    }
    if (json["image"] is String) {
      image = json["image"];
    }
    if (json["imageType"] is String) {
      imageType = json["imageType"];
    }
    isFavourite = json["isFavourite"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["title"] = title;
    data["image"] = image;
    data["imageType"] = imageType;
    data["isFavourite"] = isFavourite;
    return data;
  }
}
