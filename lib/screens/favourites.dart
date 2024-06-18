import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/recipe_dart.dart';
import '../widgets/search_field.dart';

class FavouriteScreen extends StatelessWidget {
  FavouriteScreen({super.key});

  final TextEditingController _textEditingController = TextEditingController();
  String get query => _textEditingController.text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          SizedBox(height: Get.height * 0.07),
          Row(
            children: [
              Flexible(
                child: SearchTextfield(
                  onSubmit: (val) {},
                  textEditingController: _textEditingController,
                ),
              ),
              const SizedBox(width: 12),
              IconButton(
                onPressed: () {},
                padding: const EdgeInsets.all(16),
                style: IconButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8))),
                icon: const Icon(
                  Icons.filter_alt_outlined,
                ),
              )
            ],
          ),
          const SizedBox(height: 16),
          Expanded(
            child: ListView.separated(
                padding: EdgeInsets.zero,
                itemBuilder: (context, index) {
                  return const FavoritesRecipeCard(
                    cookingTime: '12 Min',
                    description: 'tsyudjhf aduhf baoduyf gadufh gadf',
                    imageUrl:
                        'https://images.unsplash.com/photo-1478145046317-39f10e56b5e9?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1yZWxhdGVkfDF8fHxlbnwwfHx8fHw%3D',
                    title: 'Lamonade',
                  );
                },
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 16),
                itemCount: 12),
          )
        ],
      ),
    );
  }
}
