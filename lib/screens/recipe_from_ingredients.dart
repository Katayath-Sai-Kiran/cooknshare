import 'package:cooknshare/widgets/search_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class RecipeFromIngredientsScreen extends StatefulWidget {
  const RecipeFromIngredientsScreen({super.key});

  @override
  State<RecipeFromIngredientsScreen> createState() =>
      _RecipeFromIngredientsScreenState();
}

class _RecipeFromIngredientsScreenState
    extends State<RecipeFromIngredientsScreen> {
  final TextEditingController _textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "What's in your kitchen?",
              style: GoogleFonts.montserrat(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            Text(
              "Enter upto 2 ingredients",
              style: GoogleFonts.montserrat(
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 24),
            SearchTextfield(
                textEditingController: _textEditingController,
                onSubmit: (val) {}),
            const SizedBox(height: 16),
            ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(6),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            width: 62,
                            height: 62,
                            child: Image.asset(
                              'assets/asset1.jpeg',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Text(
                          'Mango',
                          style: GoogleFonts.roboto(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        const Spacer(),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.remove_circle_outline_sharp,
                            )),
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 12),
                itemCount: 6)
          ],
        ),
      ),
    );
  }
}
