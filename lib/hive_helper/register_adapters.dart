import 'package:hive/hive.dart';
import 'package:cooknshare/models/recipe.dart';

void registerAdapters() {
	Hive.registerAdapter(RecipeAdapter());
}
