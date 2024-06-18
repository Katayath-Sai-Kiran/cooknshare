import 'package:cooknshare/widgets/recipe_dart.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

import '../widgets/search_field.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});

  final TextEditingController _textEditingController = TextEditingController();
  String get query => _textEditingController.text;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            SizedBox(height: Get.height * 0.07),
            SearchTextfield(
              onSubmit: (val) {},
              textEditingController: _textEditingController,
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.separated(
                  padding: EdgeInsets.zero,
                  itemBuilder: (context, index) {
                    return const SearchRecipeCard();
                  },
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 16),
                  itemCount: 12),
            )
          ],
        ),
      ),
    );
  }
}
