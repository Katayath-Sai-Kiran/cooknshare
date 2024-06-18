import 'package:hive/hive.dart';
import 'package:cooknshare/hive_helper/hive_types.dart';
import 'package:cooknshare/hive_helper/hive_adapters.dart';
import 'package:cooknshare/hive_helper/fields/recipe_fields.dart';

part 'recipe.g.dart';

@HiveType(typeId: HiveTypes.recipe, adapterName: HiveAdapters.recipe)
class Recipe extends HiveObject {
  @HiveField(RecipeFields.id)
  final String id;
  @HiveField(RecipeFields.title)
  final String title;
  @HiveField(RecipeFields.description)
  final String description;
  @HiveField(RecipeFields.cookingTime)
  final String cookingTime;
  @HiveField(RecipeFields.ingredients)
  final List<String> ingredients;
  @HiveField(RecipeFields.steps)
  final List<String> steps;
  @HiveField(RecipeFields.imageUrl)
  final String imageUrl;
  @HiveField(RecipeFields.author)
  final String author;
  @HiveField(RecipeFields.dateCreated)
  final DateTime dateCreated;
  @HiveField(RecipeFields.dateUpdated)
  final DateTime dateUpdated;
  @HiveField(RecipeFields.isFavorite)
  final bool isFavorite;
  @HiveField(RecipeFields.servings)
  final int servings;
  @HiveField(RecipeFields.categories)
  final List<String> categories;

  Recipe({
    required this.id,
    required this.title,
    required this.description,
    required this.cookingTime,
    required this.ingredients,
    required this.steps,
    required this.imageUrl,
    required this.author,
    required this.dateCreated,
    required this.dateUpdated,
    this.isFavorite = false,
    this.servings = 1,
    this.categories = const [],
  });

  // Factory method to create an instance from a JSON object
  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      cookingTime: json['cookingTime'] as String,
      ingredients: List<String>.from(json['ingredients'] as List),
      steps: List<String>.from(json['steps'] as List),
      imageUrl: json['imageUrl'] as String,
      author: json['author'] as String,
      dateCreated: DateTime.parse(json['dateCreated'] as String),
      dateUpdated: DateTime.parse(json['dateUpdated'] as String),
      isFavorite: json['isFavorite'] as bool? ?? false,
      servings: json['servings'] as int? ?? 1,
      categories: List<String>.from(json['categories'] as List? ?? []),
    );
  }

  // Method to convert an instance back to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'cookingTime': cookingTime,
      'ingredients': ingredients,
      'steps': steps,
      'imageUrl': imageUrl,
      'author': author,
      'dateCreated': dateCreated.toIso8601String(),
      'dateUpdated': dateUpdated.toIso8601String(),
      'isFavorite': isFavorite,
      'servings': servings,
      'categories': categories,
    };
  }
}
