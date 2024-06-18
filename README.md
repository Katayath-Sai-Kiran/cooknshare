
# CooknShare

CooknShare is a Flutter-based recipe-sharing app designed to help users discover, share, and manage recipes with ease. Users can browse a variety of recipes, create their own, and interact with other cooking enthusiasts through comments and ratings.

## Features

- **User Authentication**: Sign up and log in using email and password.
- **Recipe Browsing**: Discover new recipes with an intuitive browsing interface.
- **Recipe Details**: View detailed recipe information including ingredients, steps, cooking time, and more.
- **Create Recipes**: Add your own recipes with a simple and user-friendly form.
- **Favorite Recipes**: Save your favorite recipes for quick access.
- **Search**: Find recipes by keywords, ingredients, or categories.
- **Categories**: Browse recipes by categories like breakfast, lunch, dinner, desserts, etc.
- **Comments and Ratings**: Leave feedback on recipes and rate them.
- **Notifications**: Get notified about new recipes and interactions.
- **Profile Management**: Manage your profile information and view your submitted recipes.

## Screenshots

<!-- Add screenshots here -->

## Installation

1. **Clone the repository**:
    ```bash
    git clone https://github.com/your-username/cooknshare.git
    ```

2. **Navigate to the project directory**:
    ```bash
    cd cooknshare
    ```

3. **Install dependencies**:
    ```bash
    flutter pub get
    ```

4. **Run the app**:
    ```bash
    flutter run
    ```

## Recipe Model

The `Recipe` model represents a recipe with various fields including title, description, ingredients, steps, and more.

```dart
class Recipe {
  final String id;
  final String title;
  final String description;
  final String cookingTime;
  final List<String> ingredients;
  final List<String> steps;
  final String imageUrl;
  final String author;
  final DateTime dateCreated;
  final DateTime dateUpdated;
  final bool isFavorite;
  final int servings;
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
```

## Contributing

We welcome contributions from the community. If you'd like to contribute, please fork the repository and create a pull request.

1. **Fork the repository**.
2. **Create a new branch**: `git checkout -b my-feature-branch`
3. **Make your changes and commit**: `git commit -m 'Add some feature'`
4. **Push to the branch**: `git push origin my-feature-branch`
5. **Create a pull request**.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Contact

For any inquiries, please contact [ksaikiran.site].

git commit -m "first commit"