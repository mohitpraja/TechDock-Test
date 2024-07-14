class Urls{
  static const String discoverRecipe = 'https://www.themealdb.com/api/json/v1/1/filter.php?a=Indian';
  static const String categoryList = 'https://www.themealdb.com/api/json/v1/1/list.php?c=list';
  static const String searchRecipe = 'https://api.spoonacular.com/recipes/complexSearch?query=';
  static String recipeNutrition(id) {return 'https://api.spoonacular.com/recipes/$id/nutritionWidget.json';}
  static String recipeIngredient(id) {return 'https://api.spoonacular.com/recipes/$id/ingredientWidget.json';}
  static String recipeInstruction(id) {return 'https://api.spoonacular.com/recipes/$id/analyzedInstructions';}
}